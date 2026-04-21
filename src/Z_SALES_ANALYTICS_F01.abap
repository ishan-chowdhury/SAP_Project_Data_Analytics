*&---------------------------------------------------------------------*
*& Include Z_SALES_ANALYTICS_F01
*&---------------------------------------------------------------------*
*& Purpose: Subroutines (Forms) for Data Fetching and ALV Output
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
FORM get_data.
  SELECT h~vbeln
         h~erdat
         h~kunnr
         h~vkorg
         h~netwr
         h~waerk
         i~posnr
         i~matnr
         i~arktx
         i~kwmeng
         i~vrkme
    INTO CORRESPONDING FIELDS OF TABLE it_sales
    FROM vbak AS h
    INNER JOIN vbap AS i ON h~vbeln = i~vbeln
    WHERE h~vbeln IN s_vbeln
      AND h~erdat IN s_erdat
      AND h~kunnr IN s_kunnr.
    
  IF sy-subrc <> 0.
    MESSAGE 'No records found for the given criteria.' TYPE 'I'.
    LEAVE LIST-PROCESSING.
  ENDIF.

  " Assign Traffic Light logic based on Net Value (High value = Green, Low = Red)
  LOOP AT it_sales INTO wa_sales.
    IF wa_sales-netwr > 5000.
      wa_sales-traffic_light = '3'. " Green (High Value)
    ELSEIF wa_sales-netwr > 1000.
      wa_sales-traffic_light = '2'. " Yellow (Medium Value)
    ELSE.
      wa_sales-traffic_light = '1'. " Red (Low Value)
    ENDIF.
    MODIFY it_sales FROM wa_sales INDEX sy-tabix.
  ENDLOOP.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form build_alv_layout
*&---------------------------------------------------------------------*
FORM build_alv_layout.
  CLEAR wa_layout.
  wa_layout-colwidth_optimize = 'X'.
  wa_layout-zebra             = 'X'.
  wa_layout-lights_fieldname  = 'TRAFFIC_LIGHT'. " Enable status lights
ENDFORM.

*&---------------------------------------------------------------------*
*& Form build_fieldcat
*&---------------------------------------------------------------------*
FORM build_fieldcat.
  DATA: lv_colpos TYPE i VALUE 0.

  DEFINE add_field.
    lv_colpos = lv_colpos + 1.
    CLEAR wa_fieldcat.
    wa_fieldcat-col_pos   = lv_colpos.
    wa_fieldcat-fieldname = &1.
    wa_fieldcat-seltext_m = &2.
    wa_fieldcat-emphasize = &3.
    wa_fieldcat-hotspot   = &4.
    APPEND wa_fieldcat TO it_fieldcat.
  END-OF-DEFINITION.

  add_field 'VBELN'  'Sales Order' 'C110' 'X'. " Hotspot enabled for drill-down
  add_field 'ERDAT'  'Creation Date' '' ''.
  add_field 'KUNNR'  'Customer' 'C410' ''.
  add_field 'VKORG'  'Sales Org' '' ''.
  add_field 'NETWR'  'Net Value' '' ''.
  add_field 'WAERK'  'Currency' '' ''.
  add_field 'POSNR'  'Item No' '' ''.
  add_field 'MATNR'  'Material' 'C510' ''.
  add_field 'ARKTX'  'Description' '' ''.
  add_field 'KWMENG' 'Quantity' '' ''.
  add_field 'VRKME'  'UoM' '' ''.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form display_alv
*&---------------------------------------------------------------------*
FORM display_alv.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program      = sy-repid
      i_callback_user_command = 'USER_COMMAND' " Handle interactive clicks
      is_layout               = wa_layout
      it_fieldcat             = it_fieldcat
    TABLES
      t_outtab                = it_sales
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form user_command
*&---------------------------------------------------------------------*
FORM user_command USING r_ucomm LIKE sy-ucomm
                        rs_selfield TYPE slis_selfield.
  " Drill-down interaction logic
  IF r_ucomm = '&IC1'. " Standard double click event
    IF rs_selfield-fieldname = 'VBELN'.
      READ TABLE it_sales INTO wa_sales INDEX rs_selfield-tabindex.
      IF sy-subrc = 0.
        " Open Sales Order implicitly using transaction VA03
        SET PARAMETER ID 'AUN' FIELD wa_sales-vbeln.
        CALL TRANSACTION 'VA03' AND SKIP FIRST SCREEN.
      ENDIF.
    ENDIF.
  ENDIF.
ENDFORM.

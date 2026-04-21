*&---------------------------------------------------------------------*
*& Include Z_SALES_ANALYTICS_SEL
*&---------------------------------------------------------------------*
*& Purpose: Selection Screen for Sales Analytics Report
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.

* Main Filter Criteria
SELECT-OPTIONS: s_vbeln FOR vbak-vbeln,                 " Sales Order range
                s_erdat FOR vbak-erdat OBLIGATORY,      " Date range (Mandatory)
                s_kunnr FOR vbak-kunnr.                 " Customer range

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.
* Display Options
PARAMETERS: p_layout TYPE slis_vari. " ALV Layout variant
SELECTION-SCREEN END OF BLOCK b2.

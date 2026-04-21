*&---------------------------------------------------------------------*
*& Include Z_SALES_ANALYTICS_TOP
*&---------------------------------------------------------------------*
*& Purpose: Global Declarations for Sales Analytics Report
*&---------------------------------------------------------------------*

TABLES: vbak, vbap.

* Type Declarations for Internal Table
TYPES: BEGIN OF ty_sales_data,
         vbeln TYPE vbak-vbeln, " Sales Document
         erdat TYPE vbak-erdat, " Creation Date
         kunnr TYPE vbak-kunnr, " Sold-to Party
         vkorg TYPE vbak-vkorg, " Sales Organization
         netwr TYPE vbak-netwr, " Net Value
         waerk TYPE vbak-waerk, " Currency
         posnr TYPE vbap-posnr, " Item Number
         matnr TYPE vbap-matnr, " Material Number
         arktx TYPE vbap-arktx, " Short Text
         kwmeng TYPE vbap-kwmeng, " Order Quantity
         vrkme TYPE vbap-vrkme, " Sales Unit
         traffic_light TYPE c,  " Status Indicator
       END OF ty_sales_data.

* Global Data Definitions
DATA: it_sales TYPE TABLE OF ty_sales_data,
      wa_sales TYPE ty_sales_data.

* ALV Grid Data Definitions
DATA: it_fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv,
      wa_layout   TYPE slis_layout_alv,
      it_events   TYPE slis_t_event,
      wa_event    TYPE slis_alv_event.

*&---------------------------------------------------------------------*
*& Report Z_SALES_ANALYTICS_ALV
*&---------------------------------------------------------------------*
*& Purpose: SAP Data Analytics - Sales Order Extract and ALV Presentation
*& Version: 2.0 (Modularized with Interactive Features)
*&---------------------------------------------------------------------*
REPORT Z_SALES_ANALYTICS_ALV.

*----------------------------------------------------------------------*
* INCLUDE FILES (Modular Architecture)
*----------------------------------------------------------------------*
INCLUDE Z_SALES_ANALYTICS_TOP. " Global Definitions & Table Work Areas
INCLUDE Z_SALES_ANALYTICS_SEL. " Selection Screen

*----------------------------------------------------------------------*
* INITIALIZATION
*----------------------------------------------------------------------*
INITIALIZATION.
  " Default dates to current month to prevent massive database loads
  s_erdat-sign   = 'I'.
  s_erdat-option = 'BT'.
  s_erdat-low    = sy-datum(6) && '01'.
  s_erdat-high   = sy-datum.
  APPEND s_erdat.

*----------------------------------------------------------------------*
* START-OF-SELECTION
*----------------------------------------------------------------------*
START-OF-SELECTION.
  PERFORM get_data.

*----------------------------------------------------------------------*
* END-OF-SELECTION
*----------------------------------------------------------------------*
END-OF-SELECTION.
  PERFORM build_alv_layout.
  PERFORM build_fieldcat.
  PERFORM display_alv.

INCLUDE Z_SALES_ANALYTICS_F01. " Subroutines (Forms)

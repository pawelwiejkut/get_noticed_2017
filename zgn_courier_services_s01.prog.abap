*&---------------------------------------------------------------------*
*&  Include           ZGN_COURIER_SERVICES_S01
*&---------------------------------------------------------------------*

TABLES: sscrfields.

DATA:
      l_str_packdata TYPE zpackage_data.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
PARAMETERS:
  p_cont  TYPE c LENGTH 20,
  p_weig  TYPE i,
  p_value TYPE i,
  p_from  TYPE but000-partner,
  p_to    TYPE but000-partner.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
PARAMETERS:
  p_street TYPE c LENGTH 20.
SELECTION-SCREEN PUSHBUTTON 70(6) bcheck USER-COMMAND display.
SELECTION-SCREEN END OF BLOCK b2.

INITIALIZATION.
  bcheck = 'Check'.

AT SELECTION-SCREEN.
  IF sscrfields-ucomm EQ 'BUT1'.
  ENDIF.

  l_str_packdata-content = p_cont.
  l_str_packdata-send_from = p_from.
  l_str_packdata-send_to = p_to.
  l_str_packdata-value = p_value.
  l_str_packdata-weight = p_weig.

  PERFORM filldb USING l_str_packdata.

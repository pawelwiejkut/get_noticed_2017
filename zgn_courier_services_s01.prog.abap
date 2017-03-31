*&---------------------------------------------------------------------*
*&  Include           ZGN_COURIER_SERVICES_S01
*&---------------------------------------------------------------------*

TABLES: sscrfields.

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

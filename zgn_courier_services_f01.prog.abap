*&---------------------------------------------------------------------*
*&  Include           ZGN_COURIER_SERVICES_F01
*&---------------------------------------------------------------------*

FORM filldb USING l_str_packdata TYPE zpackage_data.
  DATA:
        l_tab_packdata TYPE STANDARD TABLE OF zpackage_data.
  APPEND l_str_packdata TO l_tab_packdata.
  INSERT zpackage_data FROM TABLE l_tab_packdata.
ENDFORM.

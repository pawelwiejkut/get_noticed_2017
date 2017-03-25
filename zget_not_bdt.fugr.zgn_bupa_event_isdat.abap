FUNCTION zgn_bupa_event_isdat.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------

  DATA:
    l_tab_tab_zpacknr TYPE STANDARD TABLE OF zpack_bp_screen,
    l_var_bpnumber    TYPE but000-partner.


  CALL FUNCTION 'BUP_BUPA_BUT000_GET'
    IMPORTING
      e_but000 = g_str_but000.

  l_var_bpnumber = g_str_but000-partner.

  SELECT * FROM zpack_bp_screen
    INTO CORRESPONDING FIELDS OF TABLE l_tab_tab_zpacknr
    WHERE partner EQ l_var_bpnumber.

  IF sy-subrc EQ 0.
    LOOP AT l_tab_tab_zpacknr INTO g_str_zpacknr.
      APPEND g_str_zpacknr TO g_tab_zpacknr.
    ENDLOOP.
  ENDIF.




ENDFUNCTION.

*&---------------------------------------------------------------------*
*& Report ZGENERATE_DATA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgenerate_data.

DATA:
  lcl_random     TYPE REF TO cl_abap_random_int,
  l_str_pdata    TYPE zpackage_data,
  l_tab_pdata    TYPE STANDARD TABLE OF zpackage_data,
  l_var_init     TYPE i,
  l_var_char(10) TYPE c,
  l_var_cont     TYPE string,
  l_var_rand     TYPE i.

DATA:
  BEGIN OF l_str_cont OCCURS 0,
    content(100) TYPE c,
  END OF l_str_cont,

  l_str_scont LIKE LINE OF l_str_cont,
  l_tab_cont  LIKE STANDARD TABLE OF l_str_scont.

l_var_cont = 'Książki,Sprzęt AGD, Komputery, Materiały spożywcze, materiały biurowe'.


SPLIT l_var_cont  AT ',' INTO TABLE l_str_cont.
LOOP AT l_str_cont INTO l_str_scont.
  APPEND l_str_scont TO l_tab_cont.
ENDLOOP.

lcl_random = cl_abap_random_int=>create( min = 1 max = 5 ).

DO 100 TIMES.

  l_var_rand = lcl_random->get_next( ).
  READ TABLE l_tab_cont INTO l_str_scont INDEX l_var_rand.
  l_str_pdata-content = l_str_scont.

  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max = 100000
      ran_int_min = 1
    IMPORTING
      ran_int     = l_var_init.

  l_var_char = l_var_init.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
    EXPORTING
      input  = l_var_char
    IMPORTING
      output = l_str_pdata-send_from.

  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max = 100000
      ran_int_min = 1
    IMPORTING
      ran_int     = l_var_init.

  l_var_char = l_var_init.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
    EXPORTING
      input  = l_var_char
    IMPORTING
      output = l_str_pdata-send_to.

  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max = 100
      ran_int_min = 1
    IMPORTING
      ran_int     = l_var_init.

  l_str_pdata-value = l_var_init.


  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max = 1000000
      ran_int_min = 1
    IMPORTING
      ran_int     = l_var_init.

  l_var_char = l_var_init.

  l_str_pdata-weight = l_var_char.

  APPEND l_str_pdata TO l_tab_pdata.

ENDDO.

INSERT zpackage_data FROM TABLE l_tab_pdata.

Write:/ 'Tabela została zaaktualizowana'.

FUNCTION-POOL zget_not_bdt.                 "MESSAGE-ID ..

TABLES:
        zpack_bp_screen.
CONTROLS:
        tc_package_number TYPE TABLEVIEW USING SCREEN 0001.

DATA:
      g_str_zpacknr TYPE zpack_bp_screen,
      g_tab_zpacknr TYPE STANDARD TABLE OF zpack_bp_screen,
      g_str_but000  TYPE but000.

* INCLUDE LZGET_NOT_BDTD...                  " Local class definition

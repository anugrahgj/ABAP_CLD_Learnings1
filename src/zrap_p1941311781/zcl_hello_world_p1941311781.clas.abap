CLASS zcl_hello_world_p1941311781 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hello_world_p1941311781 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( |Hello World!({ cl_abap_context_info=>get_user_alias(  ) })| ).
    out->write( cl_abap_context_info=>get_user_alias( ) ).
    out->write( sy-uname ).
  ENDMETHOD.

ENDCLASS.

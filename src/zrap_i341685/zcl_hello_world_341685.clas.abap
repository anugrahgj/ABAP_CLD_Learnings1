CLASS zcl_hello_world_341685 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hello_world_341685 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
     out->write( |Hello wolrd ({ cl_abap_context_info=>get_user_alias( ) })| ).
     out->write( |Hello wolrd ({ cl_abap_context_info=>get_user_technical_name( ) })  from David.  { cl_abap_context_info=>get_system_date(  ) } { cl_abap_context_info=>get_system_time( ) }| ).
     "out->write( |Hello wolrd ({ cl_abap_context_info=>get_system_time( ) })  from David.| ).
  ENDMETHOD.

ENDCLASS.

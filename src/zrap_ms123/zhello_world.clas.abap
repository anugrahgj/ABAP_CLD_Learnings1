CLASS zhello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zhello_world IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
out->write( |Hello world! ({ cl_abap_context_info=>get_user_description(  ) })| ).
  ENDMETHOD.

ENDCLASS.

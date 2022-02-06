CLASS z_class_agj1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_class_agj1 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( 'Hello World!' ).
  ENDMETHOD.

ENDCLASS.

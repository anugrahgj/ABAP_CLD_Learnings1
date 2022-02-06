CLASS z_class_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_class_001 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write('Hello world!').
  ENDMETHOD.

ENDCLASS.

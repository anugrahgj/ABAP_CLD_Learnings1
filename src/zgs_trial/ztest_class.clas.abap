CLASS ztest_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztest_class IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
out->write( 'Hellow World' ).
  ENDMETHOD.

ENDCLASS.

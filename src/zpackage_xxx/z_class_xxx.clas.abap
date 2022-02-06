CLASS z_class_xxx DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_class_xxx IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->Write('Hello SAP Cloud Platform ABAP Environment!').
  ENDMETHOD.

ENDCLASS.

CLASS zkast_cl_abap_unit_test_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES: zif_kast_helper.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zkast_cl_abap_unit_test_helper IMPLEMENTATION.

  METHOD zif_kast_helper~get_value.
    rv_value = 'Real Value'.
  ENDMETHOD.

ENDCLASS.

*"* use this source file for your ABAP unit test classes

class ltc_readonly_methods definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      first_test for testing raising cx_static_check.
endclass.

**************************************************************
*  Local class to test read-only behavior implementations         *
**************************************************************
"! @testing BDEF:ZRAP400_I_Travel_0001
class ltc_readonly_methods implementation.

  method first_test.
    cl_abap_unit_assert=>fail( 'Implement your first test here' ).
  endmethod.

endclass.

class ltc_writing_methods definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      first_test for testing raising cx_static_check.
endclass.



**************************************************************
*  Local class to test modifying behavior implementations         *
**************************************************************
"! @testing BDEF:ZRAP400_I_Travel_0001
class ltc_writing_methods implementation.

  method first_test.
    cl_abap_unit_assert=>fail( 'Implement your first test here' ).
  endmethod.

endclass.

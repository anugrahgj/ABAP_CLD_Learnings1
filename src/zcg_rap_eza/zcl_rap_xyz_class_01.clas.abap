CLASS zcl_rap_xyz_class_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_xyz_class_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TRY.

 out->write( |Our first ABAP program on SAP Cloud | ).
" out->write( |Date: { sy-datum } | ).
 out->write( |Date: { cl_abap_context_info=>get_system_date( ) } | ).
 out->write( |System URL: { cl_abap_context_info=>get_system_url( )  }| ).

  CATCH cx_abap_context_info_error.
    out->write( |Error!| ).
  ENDTRY.

  ENDMETHOD.
ENDCLASS.

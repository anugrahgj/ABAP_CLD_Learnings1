CLASS zcl_rfc_demo_i347421 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rfc_demo_i347421 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(lo_destination) = cl_rfc_destination_provider=>create_by_cloud_destination( i_name  = 'Newton').
        DATA(lv_destination) = lo_destination->get_destination_name( ).
        DATA lv_result TYPE c LENGTH 200.

        CALL FUNCTION 'RFC_SYSTEM_INFO' DESTINATION lv_destination
          IMPORTING
            rfcsi_export = lv_result.


        out->write( lv_result ).

      CATCH cx_rfc_dest_provider_error INTO DATA(lx_rfc_error).
        out->write( lx_rfc_error->get_longtext( ) ).
    ENDTRY.
  ENDMETHOD.

ENDCLASS.

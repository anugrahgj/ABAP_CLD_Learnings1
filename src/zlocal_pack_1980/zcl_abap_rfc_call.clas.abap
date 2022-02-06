CLASS zcl_abap_rfc_call DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abap_rfc_call IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(i_authorization_mode) =  if_a4c_cp_service=>service_specific.

        DATA(lo_destination) = cl_rfc_destination_provider=>create_by_cloud_destination(
                                 EXPORTING
                                     i_name = 'S4D_RFC'
                               ).

        DATA(lv_destination) = lo_destination->get_destination_name( ).

        DATA: lv_result TYPE c LENGTH 200,
              msg       type bapi_msg.


        CALL FUNCTION 'RFC_SYSTEM_INFO'
          DESTINATION lv_destination
          IMPORTING
            rfcsi_export          = lv_result
          EXCEPTIONS
            system_failure        = 1 MESSAGE msg
            communication_failure = 2 MESSAGE msg
            OTHERS                = 3.
        CASE sy-subrc.
          WHEN 0.
            out->write( lv_result ).
          WHEN 1.
            out->write( |EXCEPTION SYSTEM_FAILURE | && msg ).
          WHEN 2.
            out->write( |EXCEPTION COMMUNICATION_FAILURE | && msg ).
          WHEN 3.
            out->write( |EXCEPTION OTHERS| ).
        ENDCASE.

        out->write( lv_result ).
      CATCH cx_root INTO DATA(lx_root).
        out->write( lx_root->get_text( ) ).
    ENDTRY.

  ENDMETHOD.


ENDCLASS.

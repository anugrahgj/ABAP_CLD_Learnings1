CLASS zcl_bank_read_by_proxy_XXX DEFINITION PUBLIC FINAL CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS ZCL_BANK_READ_BY_PROXY_XXX IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
*=========================================================================================================
*   Instantiate Client Proxy
*=========================================================================================================
        DATA(lo_client_proxy) = zcl_bank_read_client_proxy_XXX=>get_client_proxy( ).

*=========================================================================================================
*   Create Read Request for entity set  *** IMPORTANT: Entity Set in CAPITALS !
*=========================================================================================================
        DATA(lo_read_request) = lo_client_proxy->create_resource_for_entity_set( 'A_BANKDETAIL' )->create_request_for_read( ).

*=========================================================================================================
*   execute request
*=========================================================================================================
        DATA(lo_web_http_response) = lo_read_request->execute( ).

*=========================================================================================================
*   read response object
*=========================================================================================================
        DATA: lt_bankdetail TYPE TABLE OF za_bankdetail.

        lo_web_http_response->get_business_data( IMPORTING et_business_data = lt_bankdetail ).

        IF lines( lt_bankdetail ) > 0.
          out->write( lines( lt_bankdetail ) ).
          out->write( lt_bankdetail ).
        ELSE.
          out->write( lo_web_http_response ).
        ENDIF.

      CATCH cx_root INTO DATA(lo_error).
        out->write( |error Read Request:  { lo_error->get_text( ) }| ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

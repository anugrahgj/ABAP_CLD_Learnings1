CLASS zcl_airline_info_xxx DEFINITION PUBLIC FINAL CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_airline_info_xxx IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(lo_http_destination) =
            cl_http_destination_provider=>create_by_url( 'https://URL/sap/opu/odata/IWBEP/RMTSAMPLEFLIGHT_2/CarrierCollection' ).

        "DATA(lo_http_destination) = cl_http_destination_provider=>create_by_cloud_destination(
        "i_name = 'S4H_100'
        "i_authn_mode = if_a4c_cp_service=>service_specific ).

        DATA(lo_web_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .
        DATA(lo_web_http_request) = lo_web_http_client->get_http_request( ).

        lo_web_http_request->set_authorization_basic(
            i_username = '<username>'
            i_password = '<password>'
        ).

        "set uri path for OData service including the entity to be read
        "lo_web_http_request->set_uri_path( |/sap/opu/odata/IWBEP/RMTSAMPLEFLIGHT_2/CarrierCollection| ).

        "set request method and execute request
        DATA(lo_web_http_response) = lo_web_http_client->execute( if_web_http_client=>get ).
        DATA(lv_response) = lo_web_http_response->get_text( ).

      CATCH cx_http_dest_provider_error cx_web_http_client_error cx_web_message_error INTO DATA(lx_exception).

        out->write( lx_exception->get_text( ) ).

    ENDTRY.
    out->write( lv_response ).
  ENDMETHOD.
ENDCLASS.

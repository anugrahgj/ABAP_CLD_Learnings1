CLASS zcl_bank_read_xxx DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bank_read_xxx IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        "create http destination by url; API endpoint for API sandbox
        DATA(lo_http_destination) =
            cl_http_destination_provider=>create_by_url( 'https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap/API_BANKDETAIL_SRV/A_BankDetail?$top=50' ).

        "alternatively create HTTP destination via destination service (NOT for trial!!!)
        "cl_http_destination_provider=>create_by_cloud_destination(
        "    i_name = 'HTTP_SANDBOX_XXX'
        "    i_authn_mode = if_a4c_cp_service=>service_specific ).

        "SAP Help: https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US/f871712b816943b0ab5e04b60799e518.html

        "create HTTP client by destination
        DATA(lo_web_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .

        "adding headers with API Key for API Sandbox
        DATA(lo_web_http_request) = lo_web_http_client->get_http_request( ).

        "lo_web_http_request->set_uri_path( |/s4hanacloud/sap/opu/odata/sap/API_BANKDETAIL_SRV/A_BankDetail?$format=json| ).

        lo_web_http_request->set_header_fields( VALUE #(
        (  name = 'APIKey' value = 'H8PDbLDjGRywsEbL0Gydyrg1sGe1yr9X' )
        (  name = 'DataServiceVersion' value = '2.0' )
        (  name = 'Content-Type' value = 'application/json' )
        (  name = 'Accept' value = 'application/json' )
         ) ).


        "set request method and execute request
        DATA(lo_web_http_response) = lo_web_http_client->execute( if_web_http_client=>get ).
        DATA(lv_response) = lo_web_http_response->get_text( ).
      "error handling
      CATCH cx_http_dest_provider_error
            cx_web_http_client_error
            cx_web_message_error INTO DATA(lo_exception).
        out->write( |error:  { lo_exception->get_longtext(  ) }| ).
    ENDTRY.

    "uncomment the following line for console output; prerequisite: code snippet is implementation of if_oo_adt_classrun~main
    out->write( |response:  { lv_response }| ).
  ENDMETHOD.
ENDCLASS.

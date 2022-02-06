CLASS zcl_proxy_users_xxx DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS
      get_client_proxy
        RETURNING VALUE(ro_client_proxy) TYPE REF TO /iwbep/if_cp_client_proxy
        RAISING   zcx_users_cons_xxx
        .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_proxy_users_xxx IMPLEMENTATION.

  METHOD get_client_proxy.
    TRY.
        " 1. Get the destination of foreign system
        " 2. Create http client



        " i_name = name of destination in SAP BTP cockpit; URL = base URL of your provisioning system
        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination(
                cl_http_destination_provider=>create_by_cloud_destination(
                    i_name                  = 'SF_TEST'
                )
               ).
        "LATER: Handle Exceptions
      CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).

        RAISE EXCEPTION TYPE zcx_users_cons_xxx
          EXPORTING
            textid   = zcx_users_cons_xxx=>destination_provider_fail
            previous = lx_http_dest_provider_error.



      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).

        RAISE EXCEPTION TYPE zcx_users_cons_xxx
          EXPORTING
            textid   = zcx_users_cons_xxx=>http_client_fail
            previous = lx_web_http_client_error.

    ENDTRY.

    TRY.

        "iv_service_definition_name = the service definition generated with Service Consumption Model (EDMX file)
        " iv_relative_service_root =

        ro_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
              iv_service_definition_name = 'Z_MODEL_USERS_XXX'
              io_http_client             = lo_http_client
              iv_relative_service_root   = '/odata/v2/UserAccount'
        ).

        "LATER: Handle Exceptions
      CATCH cx_web_http_client_error INTO DATA(lx_http_client_error).
        RAISE EXCEPTION TYPE zcx_users_cons_xxx
          EXPORTING
            textid   = zcx_users_cons_xxx=>client_proxy_fail
            previous = lx_web_http_client_error.

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_cp_remote).

        RAISE EXCEPTION TYPE zcx_users_cons_xxx
          EXPORTING
            " Handle remote Exception
            " It contains details about the problems of your http(s) connection
            textid   = zcx_users_cons_xxx=>remote_access_fail
            previous = lx_cp_remote.
      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).

        RAISE EXCEPTION TYPE zcx_users_cons_xxx
          EXPORTING
            textid   = zcx_users_cons_xxx=>gateway_fail
            previous = lx_gateway.

    ENDTRY.
  ENDMETHOD.

ENDCLASS.

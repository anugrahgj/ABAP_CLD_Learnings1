CLASS zcl_users_xxx DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_users_xxx IMPLEMENTATION.
  METHOD if_rap_query_provider~select.
          """Instantiate Client Proxy
    DATA(lo_client_proxy) = zcl_proxy_users_xxx=>get_client_proxy( ).
    DATA: lo_response type ref to /iwbep/if_cp_response_read_lst .


    TRY.
          """ Instantiate Client Proxy
          """ Create Read Request
          DATA(lo_read_request) = lo_client_proxy->create_resource_for_entity_set( 'UserAccount' )->create_request_for_read( ).



            """ Implement Paging
            DATA(ls_paging) = io_request->get_paging( ).

            IF ls_paging->get_offset( ) >= 0.
                lo_read_request->set_skip( ls_paging->get_offset( ) ).
            ENDIF.

            IF ls_paging->get_page_size( ) <> if_rap_query_paging=>page_size_unlimited.
                lo_read_request->set_top( ls_paging->get_page_size( ) ).

                """ Execute the Request
                lo_response = lo_read_request->execute( ).


            ENDIF.

                      """ Request Inline Count
            IF io_request->is_total_numb_of_rec_requested( ).
              io_response->set_total_number_of_records( lo_response->get_count( ) ).
            ENDIF.

            """ Define variables
            IF io_request->is_data_requested( ).

            DATA:
                "abstract entity; receives data from remote service
                lt_user    TYPE STANDARD TABLE OF ZUSERACCOUNT,
                "custom entity; fills output param of SELECT
                lt_user_ce TYPE STANDARD TABLE OF ZCE_USER_DATA_XXX.
                "local db table
*                lt_traveladd TYPE STANDARD TABLE OF zttravels_pmd.

                """ Get data from response object

                lo_response->get_business_data( IMPORTING et_business_data = lt_user ).

                """ Check if lt_travel returns entries, then pass data to internal table for custom entity
                IF lt_user IS NOT INITIAL.
                    lt_user_ce = CORRESPONDING #( lt_user MAPPING accountId = accountId ).
                ENDIF.

              """ Set return data
              io_response->set_data( lt_user_ce ).
            ENDIF.

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        RAISE EXCEPTION TYPE ZCX_USERS_CONS_XXX
          EXPORTING
            textid   = ZCX_USERS_CONS_XXX=>query_fail
            previous = lx_gateway.
      ENDTRY.



  ENDMETHOD.

ENDCLASS.

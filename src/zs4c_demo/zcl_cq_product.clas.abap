CLASS zcl_cq_product DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cq_product IMPLEMENTATION.


  METHOD if_rap_query_provider~select.


    DATA:
      lt_business_data TYPE TABLE OF za_product,
      lt_entities      TYPE TABLE OF zi_ce_product,

      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    DATA:
      lo_filter_factory    TYPE REF TO /iwbep/if_cp_filter_factory,
      lo_filter_node_1     TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_2     TYPE REF TO /iwbep/if_cp_filter_node,
      lo_filter_node_root  TYPE REF TO /iwbep/if_cp_filter_node,
      lt_range_PRODUCT     TYPE RANGE OF za_product-Product,
      lt_range_PRODUCTTYPE TYPE RANGE OF za_product-ProductType.


    TRY.
        " Create http client

        DATA base_url TYPE string.
        base_url = 'https://my301690-api.s4hana.ondemand.com'.
        DATA(lo_http_client)  = cl_web_http_client_manager=>create_by_http_destination( i_destination =  cl_http_destination_provider=>create_by_url( i_url = base_url ) ).

        lo_http_client->get_http_request( )->set_authorization_basic(
            i_username = 'ABAP_CP_OAUTH_009'
            i_password = 'KoTKDPqpdJEQAWvseWwqPKEQieD2~FqhFQBSZJAQ'
        ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'Z_PRODUCT'
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_PRODUCT_SRV' ).


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_PRODUCT' )->create_request_for_read( ).

        """Request Count
        IF io_request->is_total_numb_of_rec_requested( ).
          lo_request->request_count( ).
        ENDIF.

        """Request Data
        IF io_request->is_data_requested( ).

          """Request Paging
          DATA(ls_paging) = io_request->get_paging( ).
          IF ls_paging->get_offset( ) >= 0.
            lo_request->set_skip( ls_paging->get_offset( ) ).
          ENDIF.
          IF ls_paging->get_page_size( ) <> if_rap_query_paging=>page_size_unlimited.
            lo_request->set_top( ls_paging->get_page_size( ) ).
          ENDIF.
        ENDIF.

        """ filter data
        DATA(lt_filter) = io_request->get_filter( )->get_as_ranges( ).


        LOOP AT lt_filter ASSIGNING FIELD-SYMBOL(<fs_filter>).

          lo_filter_factory = lo_request->create_filter_factory( ).

          IF <fs_filter>-name = 'PRODUCT'.
            lt_range_PRODUCT = CORRESPONDING #( lt_filter[ name = 'PRODUCT' ]-range ).

            lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PRODUCT'
                                                                    it_range             = lt_range_PRODUCT ).
          ENDIF.
          IF  <fs_filter>-name = 'PRODUCTTYPE'.
            lt_range_PRODUCTTYPE = CORRESPONDING #( lt_filter[ name = 'PRODUCTTYPE' ]-range ).
            lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'PRODUCTTYPE'
                                                                    it_range             = lt_range_PRODUCTTYPE ).
          ENDIF.

          IF lo_filter_node_root IS INITIAL.
            lo_filter_node_root = lo_filter_node_1.
          ELSE.
            lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
          ENDIF.
        ENDLOOP.


        IF lo_filter_node_root IS NOT INITIAL.
          lo_request->set_filter( lo_filter_node_root ).
        ENDIF.


        """columns selection
        DATA(lt_req_elements) = io_request->get_requested_elements( ).

        "map differing names
        LOOP AT lt_req_elements ASSIGNING FIELD-SYMBOL(<fs_req_elements>).
          DATA(lv_select_property) = CONV /iwbep/if_cp_runtime_types=>ty_property_path( <fs_req_elements> ).
          DATA: lt_select_properties TYPE /iwbep/if_cp_runtime_types=>ty_t_property_path.
          APPEND lv_select_property TO lt_select_properties.
        ENDLOOP.
        "set select properties
        IF lt_select_properties IS NOT INITIAL.
          lo_request->set_select_properties( lt_select_properties  ).
        ENDIF.


        """Request Sorting
        DATA(lt_sort) = io_request->get_sort_elements( ).

        LOOP AT lt_sort ASSIGNING FIELD-SYMBOL(<fs_sort>).
          "map differing names
          DATA: lt_sort_properties TYPE /iwbep/if_cp_runtime_types=>ty_t_sort_order.
          APPEND VALUE #( property_path =  <fs_sort>-element_name
                          descending = <fs_sort>-descending )
                 TO lt_sort_properties.
        ENDLOOP.
        "set sorting properties
        IF lt_sort_properties IS NOT INITIAL.
          lo_request->set_orderby( lt_sort_properties ).
        ENDIF.


        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).

        """Set Count
        IF io_request->is_total_numb_of_rec_requested( ).
          io_response->set_total_number_of_records( lo_response->get_count( ) ).
        ENDIF.

        """Set Data
        IF io_request->is_data_requested( ).
          lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

          lt_entities = CORRESPONDING #( lt_business_data ).


          io_response->set_data( lt_entities ).
        ENDIF.

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        RAISE EXCEPTION TYPE cx_a4c_rap_query_provider
          EXPORTING
            previous = lx_remote.

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        RAISE EXCEPTION TYPE cx_a4c_rap_query_provider
          EXPORTING
            previous = lx_gateway.

        " Error handling
      CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
        RAISE EXCEPTION TYPE cx_a4c_rap_query_provider
          EXPORTING
            previous = lx_http_dest_provider_error.


      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
        RAISE EXCEPTION TYPE cx_a4c_rap_query_provider
          EXPORTING
            previous = lx_web_http_client_error.

      CATCH cx_rap_query_filter_no_range INTO DATA(lx_filter_no_range).
        RAISE EXCEPTION TYPE cx_a4c_rap_query_provider
          EXPORTING
            previous = lx_filter_no_range.

    ENDTRY.

  ENDMETHOD.
ENDCLASS.

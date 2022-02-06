CLASS zcl_product_via_rfc_i347421 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_product_via_rfc_i347421 IMPLEMENTATION.

  METHOD if_rap_query_provider~select.
    DATA lt_product TYPE STANDARD TABLE OF zce_product_i347421.
    DATA(lv_abap_trial) = abap_true.

    IF lv_abap_trial = abap_false.
      TRY.
          DATA(lo_rfc_dest) = cl_rfc_destination_provider=>create_by_cloud_destination( i_name = 'ES5_RFC_XXX' ).
          DATA(lv_rfc_dest_name) = lo_rfc_dest->get_destination_name( ).
        CATCH cx_rfc_dest_provider_error INTO DATA(lx_dest).
      ENDTRY.
    ENDIF.

    IF io_request->is_data_requested(  ).

      DATA lv_maxrows TYPE int4.
      DATA(lv_skip) = io_request->get_paging( )->get_offset(  ).
      DATA(lv_top) = io_request->get_paging( )->get_page_size(  ).

      lv_maxrows = lv_skip + lv_top.

      IF lv_abap_trial = abap_true.
        lt_product = VALUE #( ( productid = 'HT-1000' name = 'Notebook' )
                              ( productid = 'HT-1001' name = 'Notebook' )
                              ( productid = 'HT-1002' name = 'Notebook' )
                              ( productid = 'HT-1003' name = 'Notebook' )
                              ( productid = 'HT-1004' name = 'Notebook' )
                              ( productid = 'HT-1005' name = 'Notebook' )
                        ).


      ELSE.
        CALL FUNCTION 'BAPI_EPM_PRODUCT_GET_LIST'
          DESTINATION lv_rfc_dest_name
          EXPORTING
            max_rows   = lv_maxrows
          TABLES
            headerdata = lt_product.

      ENDIF.

      IF io_request->is_total_numb_of_rec_requested( ).
        io_response->set_total_number_of_records( lines( lt_product ) ).
      ENDIF.

      io_response->set_data( lt_product ).

    ENDIF.

  ENDMETHOD.

ENDCLASS.

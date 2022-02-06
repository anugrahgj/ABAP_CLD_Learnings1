CLASS zcl_status DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_STATUS IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA lt_status TYPE TABLE OF ZC_status.

    IF sy-subrc IS INITIAL.

    ENDIF.

    TRY.
        IF io_request->is_data_requested(  ).
          DATA(lt_filter) = io_request->get_filter(  ).
          DATA(lt_paging) = io_request->get_paging(  ).
          DATA(lt_req) = io_request->get_requested_elements(  ).
          DATA(lt_sort) = io_request->get_sort_elements(  ).

        ENDIF.

        lt_status = VALUE #(  ( OverallStatus = 'A' OverallStatusText = 'Accepted new' )
                              ( OverallStatus = 'R' OverallStatusText = 'Rejected new' )
                              ( OverallStatus = 'O' OverallStatusText = 'Open new' ) ).

        io_response->set_total_number_of_records( lines( lt_status ) ).
        io_response->set_data( lt_status ).
      CATCH cx_root INTO DATA(lx_root).
        DATA(lv_error) = lx_root->get_longtext(  ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.

CLASS zzcl_status DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZZCL_STATUS IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA lt_status TYPE TABLE OF zzc_status.
    TRY.

        IF io_request->is_data_requested( ).
          DATA(lt_filter)      = io_request->get_filter( ).
          DATA(ls_paging)      = io_request->get_paging( ).
          DATA(lt_fields)      = io_request->get_requested_elements( ).
          DATA(lt_sort)        = io_request->get_sort_elements( ).

          lt_status = VALUE #( ( OverallStatus = 'A' statustext = 'Accepted new')
                               ( OverallStatus = 'O' statustext = 'Open new' )
                               ( OverallStatus = 'R' statustext = 'Rejected new' ) ).
        ENDIF.
      CATCH cx_root INTO DATA(lx_root).
        DATA(lv_error) = lx_root->get_longtext(  ).

    ENDTRY.

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( lt_status ) ).
    ENDIF.

    io_response->set_data( lt_status ).

  ENDMETHOD.
ENDCLASS.

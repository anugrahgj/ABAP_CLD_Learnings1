CLASS lhc_ZC_RAP_BOOKING_RR1 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
  types:begin of ty_key,
  BookingUUID TYPE ZRAP_BOOK-booking_uuid,
  end of ty_key.
data lt_keys TYPE STANDARD TABLE OF ty_key.
    METHODS approve FOR MODIFY
      IMPORTING keys FOR ACTION zc_rap_booking_rr1~approve RESULT result.

ENDCLASS.

CLASS lhc_ZC_RAP_BOOKING_RR1 IMPLEMENTATION.

  METHOD approve.
  data lv_bookingUUID_hex type sysuuid_x16.
    DATA(lv_bookingUUID) = keys[ 1 ]-BookingUUID.

    SELECT SINGLE * FROM zi_rap_booking_rr1  WHERE BookingUUID = @lv_bookingUUID INTO @DATA(ls_booking).



*        lt_keys = VALUE #( FOR key IN keys (
*        BookingUUID = key-PurchaseOrder PurchaseItem = key-PurchaseItem )  ).
*        lt_orders = FILTER #( lt_orders IN lt_keys WHERE PurchaseOrder = purchaseorder AND PurchaseItem = purchaseitem ).
*
    TRY.
        DATA(lo_http_destination) =
                    cl_http_destination_provider=>create_by_url( 'https://3ec4e315trial.authentication.eu10.hana.ondemand.com/oauth/token' ).
        DATA(lo_web_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .
        DATA(lo_web_http_request) = lo_web_http_client->get_http_request( )->set_authorization_basic(
*  " i_username = 'sb-clone-5c06288c-9a61-448a-9e70-7504ff4a2f97!b12407|workflow!b10150'
         i_username = 'sb-clone-0195d55c-caa2-44b3-bd6c-cdbf229d8890!b116977|workflow!b10150'
*   i_password = 'b63e1597-9312-4c12-a55a-d4ff28ad248b$lMW4Tw02Slf48XnUT3F5V6WDG3vlzcyKl8cqRTvUSGs='
        i_password =  '3433209b-4be8-4241-bcd6-42bbb0575a82$aRMdPIFj4AIDyUkCJHrAjzFI_qKzfLy7UjdNdniocD0='
        ).
        lo_web_http_request->set_form_fields( VALUE #(
        (  name = 'grant_type' value = 'client_credentials' )

         ) ).

        DATA(lo_web_http_response) = lo_web_http_client->execute( if_web_http_client=>get ).
        DATA(lv_response) = lo_web_http_response->get_text( ).
      CATCH cx_http_dest_provider_error cx_web_http_client_error cx_web_message_error cx_rfc_dest_provider_error.
        "error handling
    ENDTRY.
    "out->write( |response:  { lv_response }| ).
    SPLIT lv_response AT '"access_token":"' INTO DATA(lv_str1) DATA(lv_str2).
    SPLIT lv_str2 AT '"' INTO lv_str1 lv_str2.

    TRY.
        lo_http_destination =
             cl_http_destination_provider=>create_by_url( 'https://api.workflow-sap.cfapps.eu10.hana.ondemand.com/workflow-service/rest/v1/workflow-instances' ).
        lo_web_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .
        lo_web_http_request = lo_web_http_client->get_http_request( )->set_authorization_bearer(
           i_bearer = lv_str1
           "i_password = 'b63e1597-9312-4c12-a55a-d4ff28ad248b$lMW4Tw02Slf48XnUT3F5V6WDG3vlzcyKl8cqRTvUSGs='
        ).

        "Content
        "Coding for sending(POST) the data
        DATA lv_content TYPE string.
        DATA lv_content1 TYPE string.
        DATA lv_content2 TYPE string.
        lv_content1 = '{ "definitionId": "bookingwfdemo", "context":{ "request": { "data": {'.
        lv_content2 = ' } } } }'.

lv_bookingUUID_hex =  ls_booking-BookingUUID.
        lv_content =  lv_content1 &&
         | "BookingUuid": "| && lv_bookingUUID_hex && |", | &&
                                     | "BookingID": "| && ls_booking-BookingID && |", | &&
                                     | "BookingDate":  "| &&   ls_booking-BookingDate && |", | &&
                                     | "CarrierID":  "| &&   ls_booking-CarrierID  && |", | &&
                                     | "CustomerID":  "| &&  ls_booking-CustomerID && |", | &&
                                     | "FlightDate":  "| &&   ls_booking-FlightDate && |", | &&
                                     | "FlightPrice":  "| &&   ls_booking-FlightPrice  && |", | &&
                                     | "CreatedBy":  "| &&  ls_booking-CreatedBy && |"  | &&
*                                     | "ApprovedBy":  "| &&  'ravish.ranka@sap.com' && |" | &&
                                         lv_content2.

        lo_web_http_request->set_text( i_text = lv_content ).
        lo_web_http_request->set_header_fields( VALUE #(
        (  name = 'content-type' value = 'application/json' )
         ) ).
        lo_web_http_response = lo_web_http_client->execute( if_web_http_client=>post ).
        lv_response = lo_web_http_response->get_text( ).

      CATCH cx_http_dest_provider_error cx_web_http_client_error cx_web_message_error.
        "error handling
    ENDTRY.
    "out->write( |response:  { lv_response }| )  .
  ENDMETHOD.

ENDCLASS.

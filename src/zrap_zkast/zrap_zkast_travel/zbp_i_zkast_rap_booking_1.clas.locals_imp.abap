CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateBookingID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateBookingID.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateTotalPrice.

    METHODS verifyGender FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~verifyGender.

ENDCLASS.


CLASS lhc_Booking IMPLEMENTATION.

  METHOD calculateBookingID.
    DATA max_bookingid TYPE /dmo/booking_id.
    DATA update TYPE TABLE FOR UPDATE ZI_ZKAST_RAP_Travel\\Booking.

    " Read all travels for the requested bookings.
    " If multiple bookings of the same travel are requested, the travel is returned only once.
    READ ENTITIES OF ZI_ZKAST_RAP_Travel IN LOCAL MODE
    ENTITY Booking BY \_Travel
      FIELDS ( TravelUUID )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    " Process all affected Travels. Read respective bookings, determine the max-id and update the bookings without ID.
    LOOP AT travels INTO DATA(travel).
      READ ENTITIES OF ZI_ZKAST_RAP_Travel IN LOCAL MODE
        ENTITY Travel BY \_Booking
          FIELDS ( BookingID )
        WITH VALUE #( ( %tky = travel-%tky ) )
        RESULT DATA(bookings).

      " Find max used BookingID in all bookings of this travel
      max_bookingid ='0000'.
      LOOP AT bookings INTO DATA(booking).
        IF booking-BookingID > max_bookingid.
          max_bookingid = booking-BookingID.
        ENDIF.
      ENDLOOP.

      " Provide a booking ID for all bookings that have none.
      LOOP AT bookings INTO booking WHERE BookingID IS INITIAL.
        max_bookingid += 10.
        APPEND VALUE #( %tky      = booking-%tky
                        BookingID = max_bookingid
                      ) TO update.
      ENDLOOP.
    ENDLOOP.

    " Update the Booking ID of all relevant bookings
    MODIFY ENTITIES OF ZI_ZKAST_RAP_Travel IN LOCAL MODE
    ENTITY Booking
      UPDATE FIELDS ( BookingID ) WITH update
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.



  METHOD calculateTotalPrice.
    " Read all travels for the requested bookings.
    " If multiple bookings of the same travel are requested, the travel is returned only once.
    READ ENTITIES OF ZI_ZKAST_RAP_Travel IN LOCAL MODE
    ENTITY Booking BY \_Travel
      FIELDS ( TravelUUID )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels)
      FAILED DATA(read_failed).

    " Trigger calculation of the total price
    MODIFY ENTITIES OF ZI_ZKAST_RAP_Travel IN LOCAL MODE
    ENTITY Travel
      EXECUTE recalcTotalPrice
      FROM CORRESPONDING #( travels )
    REPORTED DATA(execute_reported).

    reported = CORRESPONDING #( DEEP execute_reported ).
  ENDMETHOD.



  METHOD verifyGender.

    READ ENTITIES OF ZI_ZKAST_RAP_Travel IN LOCAL MODE
    ENTITY Booking
        FIELDS ( Gender )
        WITH CORRESPONDING #( keys )
        RESULT DATA(lt_bookings_gender).


    LOOP AT lt_bookings_gender INTO DATA(ls_booking_gender).

      SELECT COUNT( * ) FROM zkast_agender
      WHERE gender = @ls_booking_gender-Gender
      INTO @DATA(lv_gender_count).

      IF lv_gender_count = 0.

        APPEND VALUE #(  %tky = ls_booking_gender-%tky ) TO failed-booking.

        APPEND VALUE #(  %key = ls_booking_gender-%key
                         %msg = NEW zkast_cm_msg_gender(
                                    textid = zkast_cm_msg_gender=>gender_check
                                    gender = ls_booking_gender-Gender
                                    severity = if_abap_behv_message=>severity-error
                                    )


         %element-gender = if_abap_behv=>mk-on

         %path = VALUE #( Travel-TravelUUID = ls_booking_gender-TravelUUID ) ) TO reported-booking.

      ENDIF.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

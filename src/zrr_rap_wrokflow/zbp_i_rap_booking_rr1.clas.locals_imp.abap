CLASS lhc_ZI_RAP_BOOKING_RR1 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_rap_booking_rr1 RESULT result.

    METHODS approve FOR MODIFY
      IMPORTING keys FOR ACTION zi_rap_booking_rr1~approve RESULT result.

ENDCLASS.

CLASS lhc_ZI_RAP_BOOKING_RR1 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD approve.
  ENDMETHOD.

ENDCLASS.

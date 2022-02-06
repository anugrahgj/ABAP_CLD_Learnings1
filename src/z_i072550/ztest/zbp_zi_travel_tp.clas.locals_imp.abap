CLASS lhc_zzi_travel_tp DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zzi_travel_tp RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR travel RESULT result.
    METHODS accepttravel FOR MODIFY
      IMPORTING keys FOR ACTION travel~accepttravel RESULT result.
    METHODS calculate FOR DETERMINE ON MODIFY
      IMPORTING keys FOR travel~calculate.
*    METHODS checkprice FOR VALIDATE ON SAVE
*      IMPORTING keys FOR travel~checkprice.

ENDCLASS.

CLASS lhc_zzi_travel_tp IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF zzc_travel
    ENTITY zzc_travel ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result)
    FAILED DATA(ls_failed).

    result = VALUE #( FOR ls_travel IN lt_result ( %key = ls_travel-%key
                                                   TravelId = ls_travel-TravelId
                                                   %features-%field-BookingFee = COND #( WHEN ls_travel-BookingFee > 20
                                                                                         THEN if_abap_behv=>fc-f-read_only
                                                                                         ELSE if_abap_behv=>fc-f-unrestricted )
                                                   %features-%delete = COND #( WHEN ls_travel-BookingFee > 20
                                                                                         THEN if_abap_behv=>fc-f-read_only
                                                                                         ELSE if_abap_behv=>fc-f-unrestricted ) ) ).

  ENDMETHOD.

  METHOD AcceptTravel.

    READ ENTITIES OF zzc_travel
    ENTITY zzc_travel ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result)
    FAILED DATA(ls_failed).

    MODIFY ENTITIES OF zzc_travel
     ENTITY zzc_travel
     UPDATE FIELDS ( OverallStatus )
     WITH VALUE #( (  %key = keys[ 1 ]-%key
                      TravelId = keys[ 1 ]-TravelId
                      %data-OverallStatus = 'A'
                      %control-OverallStatus = if_abap_behv=>mk-on ) )
      MAPPED DATA(ls_mapped)
      FAILED ls_failed .

    LOOP AT lt_result ASSIGNING FIELD-SYMBOL(<fs_travel>).
      <fs_travel>-OverallStatus = 'A'.
    ENDLOOP.

    result = VALUE #( FOR ls_travel IN lt_result (  %key = keys[ 1 ]-%key
                                                    %param = CORRESPONDING #( ls_travel ) ) ) .

  ENDMETHOD.

*  METHOD checkprice.
*
*    READ ENTITIES OF zzc_travel
*      ENTITY zzc_travel ALL FIELDS WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_result)
*      FAILED DATA(ls_failed).
*
*    IF lt_result[ 1 ]-TotalPrice > 99 .
*        APPEND VALUE #(  travelid = lt_result[ 1 ]-TravelId ) TO failed-travel.
*        APPEND VALUE #(  travelid = lt_result[ 1 ]-TravelId
*                         %msg      = NEW /dmo/cm_flight_messages(
*                                                     agency_id = lt_result[ 1 ]-AgencyId
*                                                     textid      = /dmo/cm_flight_messages=>customer_unkown
*                                                     severity    = if_abap_behv_message=>severity-error )
*                         %element-totalprice = if_abap_behv=>mk-on
*                      ) TO reported-travel.
*    ENDIF.
*  ENDMETHOD.

  METHOD calculate.

    READ ENTITIES OF zzc_travel
       ENTITY zzc_travel ALL FIELDS WITH CORRESPONDING #( keys )
       RESULT DATA(lt_result)
       FAILED DATA(ls_failed).

    LOOP AT lt_result ASSIGNING FIELD-SYMBOL(<fs_result>).
      <fs_result>-TotalPrice = <fs_result>-BookingFee * 10.
    ENDLOOP.

    MODIFY ENTITIES OF zzc_travel
    ENTITY zzc_travel
    UPDATE FIELDS ( TotalPrice )
    WITH VALUE #( FOR ls_key IN lt_result
                  (  %key = ls_key-%key
                     TravelId = ls_key-TravelId
                     %data-TotalPrice = ls_key-TotalPrice
                     %control-TotalPrice = if_abap_behv=>mk-on ) )
     MAPPED DATA(ls_mapped)
     FAILED ls_failed
     REPORTED DATA(ls_reported) .

    REPORted = CORRESPONDING #( ls_reported ).

  ENDMETHOD.

ENDCLASS.

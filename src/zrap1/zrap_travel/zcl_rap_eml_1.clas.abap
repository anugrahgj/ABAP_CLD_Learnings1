CLASS zcl_rap_eml_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_1 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
        " Step 1 -READ

*        read ENTITIES of ZI_RAP_TRAVEL_1
*            ENTITY Travel
*                from VALUE #( ( TravelUUID = 'F14F14808C42EFCB17000502C7774C21' ) )
*            RESULT data(travels).
*
*            out->write( travels ).
        " Step 2 -READ with fields
*            read ENTITIES of ZI_RAP_TRAVEL_1
*            ENTITY Travel
*                FIELDS ( AgencyID CustomerID )
*                with VALUE #( ( TravelUUID = 'F14F14808C42EFCB17000502C7774C21' ) )
*            RESULT data(travels).
*
*            out->write( travels ).
            " Step 3 -read with all fields
*            read ENTITIES of ZI_RAP_TRAVEL_1
*            ENTITY Travel
*                all FIELDS with VALUE #( ( TravelUUID = 'F14F14808C42EFCB17000502C7774C21' ) )
*            RESULT data(travels).
*
*            out->write( travels ).
"Step 4- READ by Association
*            read ENTITIES of ZI_RAP_TRAVEL_1
*            ENTITY Travel by \_Booking
*                all FIELDS with VALUE #( ( TravelUUID = 'F14F14808C42EFCB17000502C7774C21' ) )
*            RESULT data(booking).
*
*            out->write( booking ).

            "Step 5- Unsuccessful Read
*            read ENTITIES of ZI_RAP_TRAVEL_1
*            ENTITY Travel
*                all FIELDS with VALUE #( ( TravelUUID = 'F14F14811111111111111111111' ) )
*            RESULT data(booking)
*            FAILED data(failed)
*            REPORTED data(reported).
*
*            out->write( booking ).
*            out->write( failed ).
*            out->write( reported ).

             "Step 6- Modify Upadate
            MODIFY ENTITIES of ZI_RAP_TRAVEL_1
            ENTITY Travel
                UPDATE
                SET FIELDS WITH VALUE
                    #( ( TravelUUID = '405014808C42EFCB17000502C7774C21'
                         Description = 'I like RAP ' ) )
            FAILED data(failed)
            REPORTED data(reported).

            out->write( 'Update Done' ).

            " step 6b - commit Entities
            COMMIT ENTITIES
            RESPONSE OF ZI_RAP_TRAVEL_1
            FAILED DATA(failed_commit)
            REPORTED DATA(reported_commit).

  ENDMETHOD.

ENDCLASS.

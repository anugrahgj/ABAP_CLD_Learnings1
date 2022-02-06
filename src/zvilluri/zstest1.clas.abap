CLASS zstest1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES: if_oo_adt_classrun,
if_oo_adt_classrun_out.
DATA: OUT TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZSTEST1 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
me->out = out.
with +result AS ( select * from ZC_FE_TRAVEL_000001 ),
+result2 AS ( select DISTINCT traveluuid from +result  )
*SELECT begindate from +result into TABLE @DATA(lt_details1).
SELECT traveluuid from +result2 into TABLE @data(lt_details2).
SELECT T~traveluuid, T~begindate,
       T~enddate,
       sum( T~bookingfee ) as sum,
       B~customerid,
       concat( T~enddate, B~customerid ) as con
       FROM ZC_FE_TRAVEL_000001 AS T
       inner JOIN ZC_FE_BOOKING_000001 AS B
       on T~TravelUUID = B~TravelUUID
       GROUP BY T~TravelUUID, T~BeginDate, T~EndDate, B~CustomerID
       into TABLE @DATA(lt_details).
out->write( lt_details ).
ENDMETHOD.
ENDCLASS.

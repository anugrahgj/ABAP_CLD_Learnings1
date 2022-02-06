CLASS zstest_amdp1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun,
if_oo_adt_classrun_out,
if_amdp_marker_hdb.
DATA: OUT TYPE REF TO if_oo_adt_classrun_out.

  PROTECTED SECTION.
  PRIVATE SECTION.
  types: ltyy_data TYPE STANDARD TABLE OF ZC_FE_TRAVEL_000001 WITH EMPTY KEY.
        methods: zamdp
        IMPORTING value(mandt) type mandt.
*                EXPORTING VALUE(X) TYPE c .
ENDCLASS.



CLASS Zstest_Amdp1 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
me->out = out.
zamdp( EXPORTING mandt = :sy-mandt ).

ENDMETHOD.


METHOD zamdp BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
OPTIONS READ-ONLY.
*USING ZC_FE_TRAVEL_000001.
DECLARE x  ALPHANUM;
DECLARE y ALPHANUM;
DECLARE lt_spil TABLE ( travel_uuid  "$ABAP.type( sysuuid_x16 )",
                        begin_date "$ABAP.type( /dmo/begin_date )" ,
                        end_date "$ABAP.type( /dmo/end_date )",
                        description "$ABAP.type( /dmo/description )" );
                        DECLARE lv_x "$ABAP.type( /dmo/begin_date )";
*lt_spil = SELECT travel_uuid ,  begin_date,
*        end_date  ,
*        LOWER( description ) AS description
*        FROM ZC_FE_TRAVEL_000001 LIMIT 5 OFFSET 2;
**       inner JOIN ZC_FE_BOOKING_000001 AS B
**       on T~TravelUUID = B~TravelUUID
**       GROUP BY T~TravelUUID, T~BeginDate, T~EndDate, B~CustomerID
*
* x =  select * from ZC_FE_TRAVEL_000001 ;
 x = upper( 'svilluri' );
 y = lower( 'SVillUri' );
ENDMETHOD.
ENDCLASS.

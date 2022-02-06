class ZDEV260_CL_DATA_GEN_RR definition
  public
  final
  create public .

public section.

  interfaces IF_OO_ADT_CLASSRUN .
protected section.
private section.
ENDCLASS.



CLASS ZDEV260_CL_DATA_GEN_RR IMPLEMENTATION.


METHOD IF_OO_ADT_CLASSRUN~MAIN.
      DELETE FROM ('zrap_atrav_0001').
     " insert travel demo data
     INSERT ('zrap_atrav_0001')  FROM (
         SELECT
           FROM ('/DMO/TRAVEL as travel')
           FIELDS
             uuid(  )      AS travel_uuid,
             travel~travel_id        AS travel_id,
             travel~agency_id        AS agency_id,
             travel~customer_id      AS customer_id,
             travel~begin_date       AS begin_date,
             travel~end_date         AS end_date,
             travel~booking_fee      AS booking_fee,
             travel~total_price      AS total_price,
             travel~currency_code    AS currency_code,
             travel~description      AS description,
             CASE travel~status    "Status [N(New) | P(Planned) | B(Booked) | X(Cancelled)]
               WHEN 'B' THEN 'A'
               WHEN 'X' THEN 'X'
               ELSE 'O'
             END                     AS overall_status,  "Travel Status [A(Accepted) | O(Open) | X(Cancelled)]
             travel~createdby        AS created_by,
             travel~createdat        AS created_at,
             travel~lastchangedby    AS last_changed_by,
             travel~lastchangedat    AS last_changed_at,
             travel~lastchangedat    AS local_last_changed_at
             ORDER BY travel_id UP TO 50 ROWS
       ).
     COMMIT WORK.
     " define FROM clause dynamically
     DATA: dyn_table_name TYPE string.
     dyn_table_name = | /dmo/booking    AS booking  |
                  && | JOIN { 'zrap_atrav_0001' } AS z |
                  && | ON   booking~travel_id = z~travel_id |.
     DELETE FROM ('zrap_book').
     " insert booking demo data
     INSERT ('zrap_book') FROM (
         SELECT
           FROM (dyn_table_name)
           FIELDS
             uuid( )                 AS booking_uuid ,
             z~travel_uuid             AS travel_uuid           ,
             booking~booking_id      AS booking_id            ,
             booking~booking_date    AS booking_date          ,
             booking~customer_id     AS customer_id           ,
             booking~carrier_id      AS carrier_id            ,
             booking~connection_id   AS connection_id         ,
             booking~flight_date     AS flight_date           ,
             booking~flight_price    AS flight_price          ,
             booking~currency_code   AS currency_code         ,
             z~created_by            AS created_by ,
             z~last_changed_by       AS last_changed_by       ,
             z~last_changed_at       AS last_changed_at
       ).
     COMMIT WORK.
ENDMETHOD.
ENDCLASS.

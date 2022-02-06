CLASS zcl_zrk_rap_testdata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zrk_rap_testdata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DELETE from zrk_connection.

    INSERT zrk_connection from (
        select FROM /dmo/connection FIELDS
        carrier_id AS carrier_id,
        connection_id AS connection_id,
        airport_from_id as airport_from_id,
        airport_to_id as airport_to_id,
        arrival_time as arrival_time,
        departure_time as departure_time,
        distance as distance,
        distance_unit as distance_unit
    ).
    commit WORK.
    out->write( 'Data  inserted' ).

  ENDMETHOD.
ENDCLASS.

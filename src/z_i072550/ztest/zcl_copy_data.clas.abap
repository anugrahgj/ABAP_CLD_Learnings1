CLASS zcl_copy_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_COPY_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_travel   TYPE TABLE OF ztravel,
          lt_booking  TYPE TABLE OF zbooking,
          lt_booksupl TYPE TABLE OF zbooksuppl.

    SELECT * FROM /dmo/travel INTO TABLE @DATA(lt_dmo_travel).
    SELECT * FROM /dmo/booking INTO TABLE @DATA(lt_dmo_booking).
    SELECT * FROM /dmo/booksuppl_m INTO TABLE @DATA(lt_dmo_booksuppl).

    lt_travel = CORRESPONDING #( lt_dmo_travel ).
    lt_booking = CORRESPONDING #( lt_dmo_booking ).
    lt_booksupl = CORRESPONDING #( lt_dmo_booksuppl ).

    insert ztravel from TABLE @lt_travel.
    insert zbooking from TABLE @lt_booking.
    insert zbooksuppl from TABLE @lt_booksupl.
  ENDMETHOD.
ENDCLASS.

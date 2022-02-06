CLASS zkast_unit_test_1 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_signature,
        ty_date_of_hire TYPE dats,
        ty_yrs_srvc     TYPE dats,
      END OF ty_signature .
    TYPES:
      tty_table_signature TYPE TABLE OF ty_signature WITH EMPTY KEY .


    METHODS get_yrs_of_srvc
      IMPORTING
        !iv_date_of_hire TYPE ty_signature-ty_date_of_hire
      EXPORTING
        !ev_yrs_srvc     TYPE ty_signature-ty_yrs_srvc
        !ev_msgtext      TYPE string .

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zkast_unit_test_1 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lv_date_of_hire  TYPE dats VALUE '20000621',
          lv_yrs_srvc      TYPE dats,
          lv_error_message TYPE string.

    me->get_yrs_of_srvc(
      EXPORTING
        iv_date_of_hire = lv_date_of_hire
  IMPORTING
    ev_yrs_srvc     = lv_yrs_srvc
    ev_msgtext      = lv_error_message
    ).

  ENDMETHOD.


  METHOD get_yrs_of_srvc.

    DATA: lv_error_message TYPE string VALUE 'Error message wrong date'.

    IF iv_date_of_hire GT sy-datum.

      ev_msgtext = lv_error_message.

    ELSE.
      ev_yrs_srvc = ( sy-datum - iv_date_of_hire ) / 365.
      ev_yrs_srvc = round( val = ev_yrs_srvc dec = 1 ).

    ENDIF.

  ENDMETHOD.






ENDCLASS.

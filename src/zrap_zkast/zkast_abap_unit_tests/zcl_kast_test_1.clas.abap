CLASS zcl_kast_test_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS multiply
      IMPORTING
        iv_number_1 TYPE int8
        iv_number_2 TYPE int8
      EXPORTING
        ev_result   TYPE int8.


    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_kast_test_1 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lv_number_1    TYPE int8 VALUE 2,
          lv_number_2    TYPE int8 VALUE 2,
          lv_result_mult TYPE int8.

    me->multiply(
      EXPORTING
        iv_number_1 = lv_number_1
        iv_number_2 = lv_number_2
      IMPORTING
        ev_result = lv_result_mult
    ).

  ENDMETHOD.


  METHOD multiply.

    ev_result = iv_number_1 * iv_number_2.

  ENDMETHOD.

ENDCLASS.

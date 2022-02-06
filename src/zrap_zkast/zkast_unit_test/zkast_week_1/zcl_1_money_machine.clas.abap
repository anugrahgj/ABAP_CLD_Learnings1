CLASS zcl_1_money_machine DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_amount_in_coins
      IMPORTING i_amount       TYPE i
      RETURNING VALUE(r_value) TYPE i.

    METHODS get_amount_in_notes
      IMPORTING i_amount       TYPE i
      RETURNING VALUE(r_value) TYPE i .


    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_1_money_machine IMPLEMENTATION.

  METHOD get_amount_in_coins.
    r_value = COND #( WHEN i_amount <= 0
                      THEN -1
                      ELSE i_amount MOD 5 ).

*     DATA(cash_provider) = CAST ZIF_WTC_CASH_PROVIDER( NEW ZCL_WTC_CASH_PROVIDER( ) ).
*
*    DATA(notes) = cash_provider->get_notes( i_currency = 'EUR' ).
*
*    SORT notes BY amount ASCENDING.
*
*    r_value = COND #( WHEN i_amount <= 0
*                      THEN -1
*                      ELSE i_amount MOD notes[ 1 ]-amount ).

  ENDMETHOD.




  METHOD get_amount_in_notes.
    r_value = get_amount_in_coins( i_amount ).
    IF r_value >= 0.
      r_value = i_amount - r_value.
    ENDIF.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    get_amount_in_coins( 1 ).
    get_amount_in_notes( i_amount = 1 ).

  ENDMETHOD.

ENDCLASS.

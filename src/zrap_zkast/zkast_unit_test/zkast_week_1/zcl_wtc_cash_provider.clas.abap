CLASS zcl_wtc_cash_provider DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    interfaces ZIF_WTC_CASH_PROVIDER .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_wtc_cash_provider IMPLEMENTATION.

  METHOD ZIF_WTC_CASH_PROVIDER~get_coins.
    "not usable right now
    ASSERT 0 = 1.
  ENDMETHOD.


  METHOD ZIF_WTC_CASH_PROVIDER~get_notes.
    "not usable right now
    ASSERT 0 = 1.
  ENDMETHOD.

ENDCLASS.

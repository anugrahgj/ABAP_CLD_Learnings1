CLASS zcl_get_account_data_anl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_get_account_data_anl IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_accounts type ZTT_ACCOUNTS_ANL.

    select * from ZACCOUNTS_ANL
    into table @lt_accounts.

    out->write( EXPORTING
    data = lt_accounts
    name = 'Accounts:' ).

  ENDMETHOD.
  ENDCLASS.

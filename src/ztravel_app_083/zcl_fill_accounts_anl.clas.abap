CLASS zcl_fill_accounts_anl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_accounts_anl IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
DATA: lt_accounts type table of ZACCOUNTS_ANL.

"read current timestamp
GET TIME STAMP FIELD DATA(zv_tsl).

"fill internal table
lt_accounts = VALUE #(

    ( client ='100' account_number ='00000001' bank_customer_id ='100001' bank_name ='Volksbank' city = 'Gaertringen' balance ='200.00 ' currency ='EUR' account_category ='01' lastchangedat = zv_tsl )
    ( client ='100' account_number ='00000002' bank_customer_id ='200002' bank_name ='Sparkasse' city ='Schwetzingen' balance ='500.00 ' currency ='EUR' account_category ='02' lastchangedat = zv_tsl )
    ( client ='100' account_number ='00000003' bank_customer_id ='200003' bank_name ='Commerzbank' city ='Nuernberg' balance ='150.00 ' currency ='EUR' account_category ='02' lastchangedat = zv_tsl )
).

"Delete possible entries; insert new entries
DELETE FROM ZACCOUNTS_ANL.

INSERT ZACCOUNTS_ANL from table @lt_accounts.

"Check result in console
out->write( sy-dbcnt ).
out->write(  'DONE!' ).
  ENDMETHOD.

ENDCLASS.

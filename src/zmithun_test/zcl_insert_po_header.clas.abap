CLASS zcl_insert_po_header DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_po_header IMPLEMENTATION.
   METHOD if_oo_adt_classrun~main.
        DATA:
          lt_details TYPE STANDARD TABLE OF ztest_po_header.
        GET TIME STAMP FIELD DATA(lv_time).
        lt_details = VALUE #(
        ( client = '100' ebeln = '3500000175' bsart = 'ZOC' aedat = '20100520' lifnr = '5019244'
          ekorg = 'ZZI0' ekgrp = 'SE1' WAERS = 'SEK' )
        ( client = '100' ebeln = '3500000316' bsart = 'ZOC' aedat = '20100608' lifnr = '5019214'
          ekorg = 'ZZI0' ekgrp = 'SE1' WAERS = 'SEK'  )
        ( client = '100' ebeln = '4500051136' bsart = 'NB' aedat = '20100514' lifnr = 'PNL04'
          ekorg = 'ZZS0' ekgrp = 'T23' WAERS = 'TRY'  )
        ( client = '100' ebeln = '4500059330' bsart = 'NB' aedat = '20100616' lifnr = '5005740'
          ekorg = 'ZZI0' ekgrp = 'TH5' WAERS = 'THB'  )
        ( client = '100' ebeln = '8800080433' bsart = 'ZNB' aedat = '20100514' lifnr = '5055451'
          ekorg = 'ZZI0' ekgrp = 'US8' WAERS = 'USD'  )
         ).
         MODIFY ztest_po_header FROM TABLE @lt_details.
         out->write( 'Done!!' ).
    ENDMETHOD.
ENDCLASS.

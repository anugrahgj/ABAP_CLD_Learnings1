CLASS zcl_insert_po DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_po IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
        DATA:
          lt_details TYPE STANDARD TABLE OF ztest_po.
        GET TIME STAMP FIELD DATA(lv_time).
        lt_details = VALUE #(
        ( client = '100' ebeln = '3500000175' ebelp = '10'
          txz01 = 'PRODUKT/EMBALLAGE,HYGIEN-&TORKPAPPER MM.'
          matnr = '' werks = 'SE01' bukrs = 'SE03' lgort = '0101'
          matkl = 'YFACCON' menge = '1' meins = 'PC' netpr = '18057.99'
          peinh = '1' )
        ( client = '100' ebeln = '3500000316' ebelp = '10'
          txz01 = 'OMBYGGNAD AV S+,ÄNDRINGAR AV NÖDSTOPPAR'
          matnr = '' werks = 'SE01' bukrs = 'SE03' lgort = '0101'
          matkl = 'YENGCONST' menge = '1' meins = 'PC' netpr = '6800.00'
          peinh = '1' )
        ( client = '100' ebeln = '4500051136' ebelp = '140'
          txz01 = 'EUPH PLA ECKESPOINT PRIMERO YPL 104'
          matnr = '10006600' werks = 'TR01' bukrs = 'TR04' lgort = ''
          matkl = 'CUT800' menge = '6' meins = 'BOX' netpr = '3603.00'
          peinh = '100' )
        ( client = '100' ebeln = '4500059330' ebelp = '50'
          txz01 = 'Banner 120x240 NK40'
          matnr = '' werks = 'TH01' bukrs = 'TH04' lgort = ''
          matkl = 'YMASERVIC' menge = '60' meins = 'EA' netpr = '340.00'
          peinh = '1' )
        ( client = '100' ebeln = '8800080433' ebelp = '10'
          txz01 = 'Green Works& 8482 All Purpose Biodegrada'
          matnr = '' werks = 'USA0' bukrs = 'US13' lgort = ''
          matkl = 'YFACCON' menge = '2' meins = 'PAC' netpr = '683.00'
          peinh = '1' )
         ).
         MODIFY ztest_po FROM TABLE @lt_details.
         out->write( 'Done!!' ).
    ENDMETHOD.
ENDCLASS.

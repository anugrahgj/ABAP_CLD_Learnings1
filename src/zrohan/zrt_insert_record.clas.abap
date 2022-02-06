CLASS zrt_insert_record DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS
      add_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrt_insert_record IMPLEMENTATION.
  METHOD add_data.
  DATA:lt_vbak TYPE TABLE OF zvbak,
       lt_vbap TYPE TABLE OF zvbap.
    DELETE FROM zvbap.
    DELETE FROM zvbak.
    lt_vbak = VALUE #(

                        ( client = '110' vbeln = '00000000001' erdat = '09.12.2021' ernam = 'PLROTIW' )
                        ( client = '110' vbeln = '00000000002' erdat = '10.12.2021' ernam = 'PLROTIW' )
                        ( client = '110' vbeln = '00000000003' erdat = '11.12.2021' ernam = 'PLROTIW')
                        ( client = '110' vbeln = '00000000004' erdat = '09.12.2021' ernam = 'PLROTIW')
                     ).
    lt_vbap = VALUE #(

                        ( client = '110' vbeln = '00000000001' posnr = '000001' matnr = 'MAT1' netwr = '100' waers = 'PLN' )
                        ( client = '110' vbeln = '00000000002' posnr = '000001' matnr = 'MAT2' netwr = '200' waers = 'PLN' )
                        ( client = '110' vbeln = '00000000003' posnr = '000001' matnr = 'MAT3' netwr = '300' waers = 'PLN' )
                        ( client = '110' vbeln = '00000000004' posnr = '000001' matnr = 'MAT2' netwr = '100' waers = 'PLN' )
                     ).
    INSERT zvbak FROM TABLE @lt_vbak.
    INSERT zvbap FROM TABLE @lt_vbap.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    add_data(  ).
  ENDMETHOD.

ENDCLASS.

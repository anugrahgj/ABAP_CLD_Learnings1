CLASS zcl_insert_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
   METHODS create_sample_so_header.
    METHODS create_sample_so_item.
    METHODS reset_sample_so_so_item.
ENDCLASS.



CLASS zcl_insert_data IMPLEMENTATION.
  METHOD create_sample_so_header.

  DATA: lt_so_header TYPE STANDARD TABLE OF zserv_ordhd,
        lv_timestamp TYPE timestampl.
  GET TIME STAMP FIELD lv_timestamp.


  lt_so_header = VALUE #(
                    (
                      sord          = '1001'
                      partner       = 't1'
                      status        = '1'
                      priority      = '1'
                      estcost       = '100.00'
                      currkey       = 'EUR'
                      crea_date_time          = lv_timestamp
                      crea_uname    = 'Tizio'
                      lchg_date_time = lv_timestamp
                      lchg_uname     = 'Caio'
                     )
                     (
                     sord          = '1002'
                      partner       = 't2'
                      status        = '1'
                      priority      = '1'
                      estcost       = '100.00'
                      currkey       = 'EUR'
                      crea_date_time          = lv_timestamp
                      crea_uname    = 'Tizio'
                      lchg_date_time = lv_timestamp
                      lchg_uname     = 'Caio'
                     )
                     (
                     sord          = '1003'
                      partner       = 't3'
                      status        = '1'
                      priority      = '1'
                      estcost       = '200.00'
                      currkey       = 'EUR'
                      crea_date_time          = lv_timestamp
                      crea_uname    = 'Tizio'
                      lchg_date_time = lv_timestamp
                      lchg_uname     = 'Caio'
                     )
                     (
                     sord          = '1004'
                     partner       = 't4'
                      status        = '1'
                      priority      = '1'
                      estcost       = '200.00'
                      currkey       = 'EUR'
                      crea_date_time = lv_timestamp
                      crea_uname    = 'Tizio'
                      lchg_date_time = lv_timestamp
                      lchg_uname     = 'Caio'
                     )
                   ).

        INSERT zserv_ordhd FROM TABLE @lt_so_header.

  ENDMETHOD.

  METHOD create_sample_so_item.

  DATA: lt_so_item TYPE STANDARD TABLE OF zserv_orditm,
         lv_timestamp TYPE timestampl.

    GET TIME STAMP FIELD lv_timestamp.


     lt_so_item = VALUE #(
                    (

                          sord          = '1001'
                         sitm          = '100'
                         servcode           = 'M-10'
                        servdescr          = 'Laptop'
                        itemstatus          = '1'
                        partcost          = '100.00'
                        labourcode           = 'EUR'
                        labourcat         = '1'
                      labstarttime         = lv_timestamp
                      labendtime         = lv_timestamp

                     )
                     (
                       sord          = '1001'
                         sitm          = '101'
                         servcode           = 'M-10'
                        servdescr          = 'Laptop'
                        itemstatus          = '1'
                        partcost          = '100.00'
                        labourcode           = 'EUR'
                        labourcat         = '1'
                      labstarttime         = lv_timestamp
                      labendtime         = lv_timestamp
                     )

                     (
                       sord          = '1002'
                         sitm          = '200'
                         servcode           = 'M-10'
                        servdescr          = 'Laptop'
                        itemstatus          = '2'
                        partcost          = '100.00'
                        labourcode           = 'EUR'
                        labourcat         = '2'
                      labstarttime         = lv_timestamp
                      labendtime         = lv_timestamp
                     )

                     (
                       sord          = '1002'
                         sitm          = '201'
                         servcode           = 'M-10'
                        servdescr          = 'Laptop'
                        itemstatus          = '2'
                        partcost          = '100.00'
                        labourcode           = 'EUR'
                        labourcat         = '2'
                      labstarttime         = lv_timestamp
                      labendtime         = lv_timestamp
                     )
                     (
                       sord          = '1003'
                         sitm          = '300'
                         servcode           = 'M-10'
                        servdescr          = 'Laptop'
                        itemstatus          = '3'
                        partcost          = '100.00'
                        labourcode           = 'EUR'
                        labourcat         = '3'
                      labstarttime         = lv_timestamp
                      labendtime         = lv_timestamp
                     )

                     (
                       sord          = '1003'
                         sitm          = '301'
                         servcode           = 'M-10'
                        servdescr          = 'Laptop'
                        itemstatus          = '3'
                        partcost          = '100.00'
                        labourcode           = 'EUR'
                        labourcat         = '3'
                      labstarttime         = lv_timestamp
                      labendtime         = lv_timestamp
                     )

                     (
                       sord          = '1004'
                         sitm          = '400'
                         servcode           = 'M-10'
                        servdescr          = 'Laptop'
                        itemstatus          = '4'
                        partcost          = '100.00'
                        labourcode           = 'EUR'
                        labourcat         = '4'
                      labstarttime         = lv_timestamp
                      labendtime         = lv_timestamp
                     )

                     (
                       sord          = '1004'
                         sitm          = '401'
                         servcode           = 'M-10'
                        servdescr          = 'Laptop'
                        itemstatus          = '4'
                        partcost          = '100.00'
                        labourcode           = 'EUR'
                        labourcat         = '4'
                      labstarttime         = lv_timestamp
                      labendtime         = lv_timestamp
                     )

                   ).

        INSERT zserv_orditm FROM TABLE @lt_so_item.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

   reset_sample_so_so_item(  ).
    create_sample_so_header(  ).
    create_sample_so_item(  ).

     if sy-subrc eq 0.
        out->write(
         EXPORTING
            data = 'Done' ).
     endif.

  ENDMETHOD.

  METHOD reset_sample_so_so_item.

DELETE FROM zserv_ordhd.
DELETE FROM zserv_orditm.

  ENDMETHOD.

ENDCLASS.

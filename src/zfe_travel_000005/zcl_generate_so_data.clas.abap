CLASS zcl_generate_so_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GENERATE_SO_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA itab TYPE TABLE OF zcds_sales_order.

*   fill internal travel table (itab)
    itab = VALUE #(
      ( sales_order_key = '1111111111' sales_order_id = '00000022' net_amount = '070001' tax_amount = '000077' changed_at = '20190624' )
      ( sales_order_key = '2222222222' sales_order_id = '00000106' net_amount = '070005' tax_amount = '000005' changed_at = '20190613'  )
      ( sales_order_key = '3333333333' sales_order_id = '00000103' net_amount = '070010' tax_amount = '000011' changed_at = '20190610' )
    ).

*   delete existing entries in the database table
    DELETE FROM zcds_sales_order.

*   insert the new table entries
    INSERT zcds_sales_order FROM TABLE @itab.

*   output the result as a console message
    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

  ENDMETHOD.
ENDCLASS.

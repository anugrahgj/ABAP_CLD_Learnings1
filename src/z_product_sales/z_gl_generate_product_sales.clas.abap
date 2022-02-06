CLASS z_gl_generate_product_sales DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z_GL_GENERATE_PRODUCT_SALES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA itab TYPE TABLE OF zproducts_sales.

*   fill internal travel table (itab)
    itab = VALUE #(
      ( mykey = 'FD946628'
brand = 'ACER'
product_name = 'LAUNCHPAD'
product_type = 'LAPTOP'
quantity = '25'
unit_price = '29500'
amount = '737500'
store_name = 'AMAZON'
channel = 'ONLINE'
customer_name = 'ANDY'
)
( mykey = 'FD946624'
brand = 'LENOVO'
product_name = 'YOGA 3'
product_type = 'LAPTOP'
quantity = '5'
unit_price = '30000'
amount = '150000'
store_name = 'GRAND COMPUTERS'
channel = 'STORE'
customer_name = 'JOHN'
)
( mykey = 'FD946625'
brand = 'DELL'
product_name = 'IDEAPAD'
product_type = 'LAPTOP'
quantity = '6'
unit_price = '27500'
amount = '165000'
store_name = 'INTEK SYSTEMS'
channel = 'STORE'
customer_name = 'KENNEDY'
)
( mykey = 'FD946626'
brand = 'APPLE'
product_name = 'MACBOOK PRO'
product_type = 'LAPTOP'
quantity = '3'
unit_price = '80000'
amount = '240000'
store_name = 'INNOVATE SYSTEMS'
channel = 'STORE'
customer_name = 'MORGAN'
)
( mykey = 'FD946627'
brand = 'ASUS'
product_name = 'VIVOBOOK S14'
product_type = 'LAPTOP'
quantity = '10'
unit_price = '25000'
amount = '250000'
store_name = 'MODEL SYSTEMS'
channel = 'STORE'
customer_name = 'THOMAS'
)

    ).

*   delete existing entries in the database table
    DELETE FROM zproducts_sales.

*   insert the new table entries
    INSERT zproducts_sales FROM TABLE @itab.

*   output the result as a console message
    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

  ENDMETHOD.
ENDCLASS.

CLASS zcl_create_bookings_007 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_create_bookings_007 IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
      DATA: ltbl_bookings TYPE TABLE OF ztbooking_007.
* Read current timestamp
      GET TIME STAMP FIELD DATA(lv_timestmp).
* Fill booking entries in table
      ltbl_bookings = VALUE #(
        ( bookingID = '1' customername = 'Venkatesh' numberofpassengers = '5' emailaddress = 'venkat@flight.sample.com'
          country = 'India' dateofbooking = '20220120' dateoftravel = '20220131211525' price = '25000' currencycode = 'INR'
          lastchangedat = lv_timestmp )
        ( bookingID = '2' customername = 'Abhigyan' numberofpassengers = '5' emailaddress = 'abhigyan@flight.sample.com'
          country = 'India' dateofbooking = '20220120' dateoftravel = '20220131211525' price = '25000' currencycode = 'INR'
          lastchangedat = lv_timestmp )
        ( bookingID = '3' customername = 'Rashmi' numberofpassengers = '5' emailaddress = 'rashmi@flight.sample.com'
          country = 'India' dateofbooking = '20220120' dateoftravel = '20220131211525' price = '25000' currencycode = 'INR'
          lastchangedat = lv_timestmp )
        ( bookingID = '4' customername = 'Rupa' numberofpassengers = '5' emailaddress = 'rupa@flight.sample.com'
          country = 'India' dateofbooking = '20220120' dateoftravel = '20220131211525' price = '25000' currencycode = 'INR'
          lastchangedat = lv_timestmp )
        ( bookingID = '5' customername = 'Siva' numberofpassengers = '5' emailaddress = 'siva@flight.sample.com'
          country = 'India' dateofbooking = '20220120' dateoftravel = '20220131211525' price = '25000' currencycode = 'INR'
          lastchangedat = lv_timestmp )
      ) .

* Delete the entries from database table - in case if already filled
      DELETE FROM ztbooking_007.
* Insert above entries into database table
      INSERT ztbooking_007 FROM TABLE @ltbl_bookings.

* Check whether entries got inserted into database table or not
      SELECT * FROM ztbooking_007 INTO TABLE @ltbl_bookings.

* Write the number entries inserted
      out->write( sy-dbcnt ).
      out->write( 'Records inserted successfully!' )    .
    ENDMETHOD.

ENDCLASS.

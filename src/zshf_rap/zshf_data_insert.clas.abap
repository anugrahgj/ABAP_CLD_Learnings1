CLASS zshf_data_insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS
      add_user_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zshf_data_insert IMPLEMENTATION.

  METHOD add_user_data.
    DATA: lt_user TYPE STANDARD TABLE OF zshfuserinfo_03.

    lt_user = VALUE #(
                        ( user_email = 'am@demo.com'
                          first_name = 'Alfred'
                          last_name =  'Müller')
                        ( user_email = 'mj@demo.com'
                          first_name = 'Michael'
                          last_name =  'Jordan')
                        ( user_email = 'bk@demo.com'
                          first_name = 'Bruno'
                          last_name =  'Keller')
                        ( user_email = 'fh@demo.com'
                          first_name = 'Fritz'
                          last_name =  'Heinkes')
                     ).

    INSERT zshfuserinfo_03 FROM TABLE @lt_user.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    add_user_data(  ).
  ENDMETHOD.

ENDCLASS.

CLASS zc_data_insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS add_user_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zc_data_insert IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    add_user_data(  ).
    out->write( 'Data inserted' ).

  ENDMETHOD.


  METHOD add_user_data.

*    DATA lt_gender TYPE STANDARD TABLE OF zkast_agender.
*
*    lt_gender = VALUE #(
*    ( gender = 'MALE')
*    ( gender = 'FEMALE')
*    ( gender = 'OTHERS')
*    ( gender = 'DO NOT SPECIFY')
*    ).
*
*    INSERT zkast_agender FROM TABLE @lt_gender.

**********************************************************************

*
*    DATA lt_trl_status TYPE STANDARD TABLE OF zkast_trl_status.
*    DATA lt_trl_status1 TYPE  zkast_trl_status.
*
*    lt_trl_status = VALUE #(
*    ( trv_stts = 'O' trv_stts_desc = 'Open')
*    ( trv_stts = 'A' trv_stts_desc = 'Accepted')
*    ( trv_stts = 'X' trv_stts_desc = 'Canceled')
*    ).
*
*    INSERT zkast_trl_status FROM TABLE @lt_trl_status.


*    DELETE FROM zkast_trl_status WHERE trv_stts =  '' OR trv_stts_desc = '' .

**********************************************************************




    DATA lt_zkast_a_emp_u TYPE STANDARD TABLE OF zkast_a_emp_u.

    lt_zkast_a_emp_u = VALUE #(
    (   emp_id = 1  emp_first_name = 'Ivan' emp_last_name = 'Ivanov')
    ( emp_id = 2 emp_first_name = 'Stepan' emp_last_name = 'Steklov')
    (  emp_id = 3 emp_first_name = 'Petr' emp_last_name = 'Petrov')
    ).

*DELETE FROM zkast_a_emp_u WHERE emp_id IS INITIAL OR emp_first_name =  '' OR emp_last_name = '' .

    INSERT zkast_a_emp_u FROM TABLE @lt_zkast_a_emp_u.





  ENDMETHOD.

ENDCLASS.

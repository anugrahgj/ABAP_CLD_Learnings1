CLASS zc_data_insert_to_db_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS add_user_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zc_data_insert_to_db_table IMPLEMENTATION.


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


********************INSERT DATA TO DB TABLE*********************

*    DATA lt_zkast_a_emp_u TYPE STANDARD TABLE OF zkast_a_emp_u.
**
*    lt_zkast_a_emp_u = VALUE #(
*    (   emp_id = 4 emp_first_name = 'Anna'   emp_last_name = 'Sivak' emp_age = 25 emp_gender = 'Female' )
*    (   emp_id = 5 emp_first_name = 'Alina' emp_last_name = 'Antonova' emp_age = 25 emp_gender = 'Female')
*    (   emp_id = 6 emp_first_name = 'Sveta'   emp_last_name = 'Kurochkina' emp_age = 25 emp_gender = 'Female')
*    ).
***
********DELETE FROM zkast_a_emp_u WHERE emp_id IS INITIAL OR emp_first_name =  '' OR emp_last_name = '' .
***
*    INSERT zkast_a_emp_u FROM TABLE @lt_zkast_a_emp_u.

**********************************************************************
****    DATA lt_zkast_a_empinf_u TYPE STANDARD TABLE OF zkast_a_emp_u_1.
****
****    lt_zkast_a_empinf_u = VALUE #(
****    (   emp_gnr_uuid = 000001 emp_gnr_id = 000001 emp_first_name = 'Ivan'
****        emp_last_name = 'Ivanov' emp_company = 'SAP'
****        emp_company_web_site = 'https://leverx.com/images/header/ic_logo.svg'
****        emp_age = 24 emp_gender = 'Male' )
********    (   emp_id = 000005 emp_city = 'City5' emp_number = '+5555' emp_email = 'gfbfg23.rty@gmail.com' )
********    (   emp_id = 000006 emp_city = 'City6'   emp_number = '+6666' emp_email = 'df6.kjh@mail.ru' )
****    ).
****
********DELETE FROM zkast_a_emp_u WHERE emp_id IS INITIAL OR emp_first_name =  '' OR emp_last_name = '' .
****
****    INSERT zkast_a_emp_u_1 FROM TABLE @lt_zkast_a_empinf_u.


    DATA lt_zkast_a_empinf_u TYPE STANDARD TABLE OF zkast_a_einf_u_1.

    lt_zkast_a_empinf_u = VALUE #(
    (   emp_inf_uuid = 000002 emp_gnr_id = 000001 emp_city = 'Moscow'
        emp_number = '+37525' emp_email = 'asdf22@mail.ru'     )
****    (   emp_id = 000005 emp_city = 'City5' emp_number = '+5555' emp_email = 'gfbfg23.rty@gmail.com' )
****    (   emp_id = 000006 emp_city = 'City6'   emp_number = '+6666' emp_email = 'df6.kjh@mail.ru' )
    ).

****DELETE FROM zkast_a_emp_u WHERE emp_id IS INITIAL OR emp_first_name =  '' OR emp_last_name = '' .

    INSERT zkast_a_einf_u_1 FROM TABLE @lt_zkast_a_empinf_u.




********************UPDATE DATA TO DB TABLE*********************


*    DELETE FROM demo_update WHERE id = @id.
*    DATA(wa) = VALUE demo_update( id = id
*                                  col1 = 100
*                                  col2 = 100
*                                  col3 = 100
*                                  col4 = 100 ).
*    INSERT demo_update FROM @wa.


*******************update specific row**************************

*    DATA(num)   = 'SAP'.
*    DATA(diff)  = 'https://leverx.com/images/header/ic_logo.svg'.
*    DATA(token) = 'col4 = col4 - demo_update~col1'.
*
*    UPDATE zkast_a_emp_u
*           SET emp_company = @num,
*               emp_company_web_site =  @diff
*           WHERE emp_id = 000001.


*******************update all row**************************

*    DATA: lt_zkast_a_emp_u TYPE STANDARD TABLE OF zkast_a_emp_u,
*          ls_zkast_a_emp_u TYPE  zkast_a_emp_u,
*          lv_temp_1        TYPE int4 VALUE 18.
*
*    SELECT emp_id FROM zkast_a_emp_u INTO CORRESPONDING FIELDS OF TABLE @lt_zkast_a_emp_u.
*
*    LOOP AT lt_zkast_a_emp_u ASSIGNING FIELD-SYMBOL(<fs_zkast_a_emp_u>).
*
*      lv_temp_1 += 1.
*
*      <fs_zkast_a_emp_u>-emp_age = lv_temp_1.
*      <fs_zkast_a_emp_u>-emp_gender = 'Male'.
*
*    UPDATE zkast_a_emp_u
*           SET emp_age =  @<fs_zkast_a_emp_u>-emp_age,
*               emp_gender = @<fs_zkast_a_emp_u>-emp_gender
*           WHERE emp_id =  @<fs_zkast_a_emp_u>-emp_id.
*    ENDLOOP.

*********************************************************************************


  ENDMETHOD.

ENDCLASS.

CLASS zc_data_insert_to_db_table1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS add_user_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zc_data_insert_to_db_table1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    add_user_data(  ).
    out->write( 'Data inserted' ).

  ENDMETHOD.


  METHOD add_user_data.


*    DATA lt_ZKAST_A_PARK_U TYPE STANDARD TABLE OF zkast_a_park_u.
*
*    lt_ZKAST_A_PARK_U = VALUE #(
*    (   park_uuid = 2 park_id = '2' park_name = 'Park 2'
*        capacity = '200'      )
*    ).
*
*    INSERT zkast_a_park_u FROM TABLE @lt_ZKAST_A_PARK_U.



*    DATA lt_zkast_a_car_u TYPE STANDARD TABLE OF zkast_a_car_u.
*
*    lt_zkast_a_car_u = VALUE #(
*    (   car_uuid = 2 park_uuid = 1  car_id = 2  car_name = 'Mers' vin = '567zxc9087'
*        license_number = 'license№2'      )
*    ).
*
*    INSERT zkast_a_car_u FROM TABLE @lt_zkast_a_car_u.



    DELETE FROM zkast_a_park_u WHERE park_name = 'Park 2' or park_name = ''.




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

CLASS zcl_newprice_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_NEWPRICE_CALC IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    ASSIGN COMPONENT 'TRAVELID' OF STRUCTURE it_original_data[ 1 ] TO FIELD-SYMBOL(<fs_travel_id>).
    ASSIGN COMPONENT 'BOOKINGFEE' OF STRUCTURE it_original_data[ 1 ] TO FIELD-SYMBOL(<fs_BOOKINGFEE>).
    ASSIGN COMPONENT 'NEWPRICE' OF STRUCTURE ct_calculated_data[ 1 ] TO FIELD-SYMBOL(<fs_newprice>).


    <fs_newprice> = <fs_bookingfee> * 2.

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.

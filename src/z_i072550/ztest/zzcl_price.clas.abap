CLASS zzcl_price DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZZCL_PRICE IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    ASSIGN COMPONENT 'TRAVELID' OF STRUCTURE it_original_data[ 1 ] TO FIELD-SYMBOL(<fs_travel>).
    ASSIGN COMPONENT 'NEWPRICE' OF STRUCTURE ct_calculated_data[ 1 ] TO FIELD-SYMBOL(<fs_newprice>).

    IF <fs_travel> IS ASSIGNED.

      READ ENTITIES OF zzc_travel
      ENTITY zzc_travel
      ALL FIELDS WITH VALUE #( ( %key-TravelId = <fs_travel> ) )
      RESULT DATA(lt_result)
      FAILED DATA(ls_result).

      IF lt_result IS NOT INITIAL.
        <fs_newprice> = lt_result[ 1 ]-BookingFee * 2.

      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.

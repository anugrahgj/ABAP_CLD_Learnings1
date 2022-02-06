CLASS Z_ShowField DEFINITION
 PUBLIC
 FINAL
 CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
ENDCLASS.

CLASS Z_ShowField IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.
* Check the field for your condition and return either abap_true or abap_falsefor the
* virtual field.
    DATA lt_original_data TYPE STANDARD TABLE OF ZC_ZKAST_RAP_Travel_1 WITH
   DEFAULT KEY.
    lt_original_data = CORRESPONDING #( it_original_data ).
    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs_original_data>).
      <fs_original_data>-testField = COND abap_boolean( WHEN
     <fs_original_data>-BookingFee < 50 THEN abap_true ELSE abap_false ).
    ENDLOOP.
    ct_calculated_data = CORRESPONDING #( lt_original_data ).



  ENDMETHOD.



  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
* Extract the field you want the field visibility to depend on
*
    IF iv_entity <> 'ZC_ZKAST_RAP_Travel_1'.
*        RAISE EXCEPTION TYPE /dmo/cx_virtual_elements
*          EXPORTING
*            textid = /dmo/cx_virtual_elements=>entity_not_known
*            entity = iv_entity.
    ENDIF.

    LOOP AT it_requested_calc_elements ASSIGNING FIELD-SYMBOL(<fs_calc_element>).
      CASE <fs_calc_element>.
        WHEN 'testField'.
          APPEND 'BookingFee' TO et_requested_orig_elements.
          ...
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.


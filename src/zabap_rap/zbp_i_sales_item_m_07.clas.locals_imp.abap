CLASS lhc_SItemM_07 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS newSalesTotal FOR DETERMINE ON MODIFY
      IMPORTING keys FOR SItemM_07~newSalesTotal.

    METHODS checkUnitPriceQuantity FOR VALIDATE ON SAVE
      IMPORTING keys FOR SItemM_07~checkUnitPriceQuantity.

ENDCLASS.

CLASS lhc_SItemM_07 IMPLEMENTATION.

  METHOD newSalesTotal.

    DATA: lv_total_doc Type ZVBAK_07-netwr value 0,
          lv_doc_number Type ZVBAK_07-vbeln.

    READ ENTITIES OF Z_I_Sales_Header_M_07
        ENTITY sheadm_07 by \_SItemM_07
            ALL FIELDS WITH VALUE #( FOR key IN keys (
                            sales_doc_num = key-sales_doc_num

                                     ) )
           RESULT DATA(lt_sales_item).


        LOOP AT lt_sales_item ASSIGNING FIELD-SYMBOL(<fs_key>).

            lv_total_doc +=  ( <fs_key>-quanity *  <fs_key>-unit_cost ).

        ENDLOOP.

        IF lt_sales_item is not INITIAL.

            DATA(wa_item) = lt_sales_item[ 1 ].

            lv_doc_number = wa_item-sales_doc_num.


        ENDIF.

        MODIFY ENTITY Z_I_Sales_Header_M_07
            UPDATE FIELDS ( total_cost ) WITH
            VALUE #( (
                        sales_doc_num = lv_doc_number
                        total_cost = lv_total_doc

                        ) )
            REPORTED DATA(reported_update)
            FAILED DATA(failed_update).

            IF failed_update is not INITIAL.

                "Throw error message

            ENDIF.





  ENDMETHOD.

  METHOD checkUnitPriceQuantity.



    READ ENTITIES OF Z_I_Sales_Header_M_07
        ENTITY sheadm_07 by \_SItemM_07
            FROM VALUE #( FOR key IN keys (
                            sales_doc_num = key-sales_doc_num

                                     ) )
           RESULT DATA(lt_sales_item).


    LOOP AT lt_sales_item into DATA(wa_item).

        LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_key>).

            if <fs_key>-item_position eq wa_item-item_position.

                    if wa_item-unit_cost LT 0 OR wa_item-quanity LT 0.

                        "Issues

                        APPEND VALUE #(
                                sales_doc_num = wa_item-sales_doc_num
                                item_position = wa_item-item_position


                         ) To failed-sitemm_07.


                         APPEND VALUE #(
                                sales_doc_num = wa_item-sales_doc_num
                                %msg = new_message(
                                                        id = 'Z_SALES_ITEM_M_07'
                                                        number = '002'
                                                        v1 =  wa_item-item_position
                                                        severity = if_abap_behv_message=>severity-error
                                                 )


                         ) To reported-sitemm_07.



                    ENDIF.

            ENDIF.


        ENDLOOP.


    ENDLOOP.



  ENDMETHOD.

ENDCLASS.

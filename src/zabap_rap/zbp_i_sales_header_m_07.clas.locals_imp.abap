CLASS lhc_SHEADM_07 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR sheadm_07 RESULT result.

    METHODS blockOrder FOR MODIFY
      IMPORTING keys FOR ACTION sheadm_07~blockOrder RESULT result.

    METHODS unblockOrder FOR MODIFY
      IMPORTING keys FOR ACTION sheadm_07~unblockOrder RESULT result.

ENDCLASS.

CLASS lhc_SHEADM_07 IMPLEMENTATION.

  METHOD blockOrder.


      Loop at keys ASSIGNING FIELD-SYMBOL(<fs_head>).

        MODIFY ENTITY Z_I_Sales_Header_M_07
            UPDATE FIELDS ( block_status )
                WITH VALUE #( (
                                sales_doc_num = <fs_head>-sales_doc_num
                                block_status = '99' "That means we are blocking for admin approval
                            ) )
                REPORTED reported
                FAILED failed.

        READ ENTITY Z_I_Sales_Header_M_07
            ALL FIELDS WITH
                VALUE #( (
                            sales_doc_num =  <fs_head>-sales_doc_num
                        ) )
           RESULT data(lt_sales_head).

        result = VALUE #( FOR sales_head in lt_sales_head (
                                                             sales_doc_num        = <fs_head>-sales_doc_num
                                                             %param-sales_doc_num = sales_head-sales_doc_num
                                                             %param-block_status  = sales_head-block_status

                                                     ) ).

      ENDLOOP.


  ENDMETHOD.

  METHOD unblockOrder.

      Loop at keys ASSIGNING FIELD-SYMBOL(<fs_head>).

        MODIFY ENTITY Z_I_Sales_Header_M_07
            UPDATE FIELDS ( block_status )
                WITH VALUE #( (
                                sales_doc_num = <fs_head>-sales_doc_num
                                block_status = '' "That means we are unblocking
                            ) )
                REPORTED reported
                FAILED failed.


          READ ENTITY Z_I_Sales_Header_M_07
            ALL FIELDS WITH
                VALUE #( (
                            sales_doc_num =  <fs_head>-sales_doc_num
                        ) )
           RESULT data(lt_sales_head).

           result = VALUE #( FOR sales_head in lt_sales_head (
                                                             sales_doc_num        = <fs_head>-sales_doc_num
                                                             %param-sales_doc_num = sales_head-sales_doc_num
                                                             %param-block_status  = sales_head-block_status

                                                     ) ).



      ENDLOOP.


  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITY Z_I_Sales_Header_M_07
        ALL FIELDS WITH VALUE #( FOR key IN keys ( sales_doc_num = key-sales_doc_num ) )
        RESULT DATA(lt_sales_head).

        result = VALUE #( FOR sales_head IN lt_sales_head (

                                %tky = sales_head-sales_doc_num
                                %update = COND #( WHEN sales_head-block_status = ''
                                                    THEN if_abap_behv=>fc-f-unrestricted
                                                    ELSE if_abap_behv=>fc-f-read_only
                                                    )
                                %delete =  COND #( WHEN sales_head-block_status = ''
                                                    THEN if_abap_behv=>fc-o-enabled
                                                    ELSE if_abap_behv=>fc-o-disabled
                                                  )

                                %assoc-_SItemM_07 =  COND #( WHEN sales_head-block_status = ''
                                                    THEN if_abap_behv=>fc-o-enabled
                                                    ELSE if_abap_behv=>fc-o-disabled
                                                  )

        ) ).



  ENDMETHOD.

ENDCLASS.


CLASS lcl_save DEFINITION INHERITING FROM cl_abap_behavior_saver.

    PROTECTED SECTION.
        METHODS SAVE_MODIFIED REDEFINITION.

ENDCLASS.

CLASS lcl_save IMPLEMENTATION.

    METHOD SAVE_MODIFIED.

        DATA: lt_head TYPE STANDARD TABLE OF ZVBAK_07,
               lt_item TYPE STANDARD TABLE OF ZVBAP_07,
               i_status_subrc TYPE I VALUE 1.


        IF create-sitemm_07 is not INITIAL.

            IF update-sheadm_07 is not INITIAL.

                DATA(wa_head) = update-sheadm_07[ 1 ].

                DATA(sales_doc_update) = wa_head-sales_doc_num.

            ENDIF.

            IF sales_doc_update is not INITIAL.

                lt_item = VALUE #( FOR lt_item_new IN create-sitemm_07 (

                                                vbeln = sales_doc_update
                                                posnr = lt_item_new-item_position
                                                waerk = 'EUR'
                                                arktx = lt_item_new-mat_desc
                                                matnr = lt_item_new-mat_num
                                                kpein = lt_item_new-quanity
                                                netpr = lt_item_new-unit_cost
                                                netwr = lt_item_new-quanity * lt_item_new-unit_cost
                                                kmein = 'PC'
                                                last_changed_timestamp = lt_item_new-last_changed

                                     ) ).

                       CALL FUNCTION 'Z_CREATE_ITEM_WITH_DATA_07'
                        EXPORTING
                            ITEM = lt_item
                        IMPORTING
                            STATUS = i_status_subrc.

                       IF i_status_subrc <> 0.

                               "Error
                              Loop at lt_item into DATA(wa_item).

                                   APPEND VALUE #(

                                    sales_doc_num = wa_item-vbeln
                                    item_position = wa_item-posnr
                                    %MSG          = new_message(
                                                        id = 'Z_SALES_ITEM_M_07'
                                                        number = '001'
                                                        severity = if_abap_behv_message=>severity-error
                                                 )

                                    ) to reported-sitemm_07.

                                ENDLOOP.

                       ELSE.

                       LOOP AT update-sheadm_07 ASSIGNING FIELD-SYMBOL(<fs_so_head>).

                            UPDATE ZVBAK_07 SET netwr = @<fs_so_head>-total_cost where vbeln = @<fs_so_head>-sales_doc_num.
                            IF sy-subrc <> 0.

                                "Error

                            ENDIF.

                        ENDLOOP.

                       ENDIF.
               ENDIF.


        ENDIF.



        IF delete-sheadm_07 IS NOT INITIAL.

            lt_head = VALUE #(
                        FOR lt_head_line IN delete-sheadm_07 (

                                            vbeln = lt_head_line-sales_doc_num

                                            )  ).


            DELETE ZVBAK_07 FROM TABLE @lt_head.
            IF sy-subcs <> 0.
                "Throw a message

            ELSE.

                "Success

            ENDIF.

        ENDIF.


    ENDMETHOD.

ENDCLASS.

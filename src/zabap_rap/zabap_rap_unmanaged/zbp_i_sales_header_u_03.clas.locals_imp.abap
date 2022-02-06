CLASS lhc_SOHeader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    Data: block_code TYPE ZVBAK_02-faksk VALUE '99',
          un_block_code TYPE ZVBAK_02-faksk VALUE ''.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE SOHeader.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE SOHeader.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE SOHeader.

    METHODS read FOR READ
      IMPORTING keys FOR READ SOHeader RESULT result.

    METHODS rba_Sitem_u_03 FOR READ
      IMPORTING keys_rba FOR READ SOHeader\_Sitem_u_03 FULL result_requested RESULT result LINK association_links.

    METHODS cba_Sitem_u_03 FOR MODIFY
      IMPORTING entities_cba FOR CREATE SOHeader\_Sitem_u_03.
    METHODS blockOrder FOR MODIFY
      IMPORTING keys FOR ACTION SOHeader~blockOrder RESULT result.

    METHODS unBlockOrder FOR MODIFY
      IMPORTING keys FOR ACTION SOHeader~unBlockOrder RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SOHeader RESULT result.
    METHODS getfile FOR MODIFY
      IMPORTING keys FOR ACTION soheader~getfile RESULT result.

ENDCLASS.

CLASS lhc_SOHeader IMPLEMENTATION.

  METHOD create.

    Data: ls_so_head TYPE ZVBAK_02,
          lt_so_head TYPE STANDARD TABLE OF ZVBAK_02,
          lv_old_max_vblen TYPE ZVBAK_02-vbeln,
          lv_temp_vblen TYPE i,
          ls_timestamp Type timestampl.

          Select FROM ZVBAK_02 FIELDS MAX( vbeln ) INTO @lv_old_max_vblen.

          GET TIME STAMP FIELD ls_timestamp.

    Loop at entities ASSIGNING FIELD-SYMBOL(<fs_so_head>).

        ls_so_head = CORRESPONDING #( <fs_so_head> MAPPING
                                    faksk = block_status
                                    vtweg = sales_dist
                                    spart = sales_div
                                    vkorg = sales_org  ).

         "New Sales Doc Number Calculation
         lv_temp_vblen = CONV i( lv_old_max_vblen ) + 1.
         ls_so_head-vbeln = CONV ZVBELN_VA_02( lv_temp_vblen ).
         CONDENSE ls_so_head-vbeln.
         lv_old_max_vblen = lv_old_max_vblen + 1.

        ls_so_head-netwr = 0.
        ls_so_head-waerk = 'EUR'.

        ls_so_head-ernam = sy-uname.
        ls_so_head-erdat = sy-datum.


        ls_so_head-last_changed_timestamp = ls_timestamp.

        APPEND ls_so_head to lt_so_head.

    ENDLOOP.

    Data(lv_msg) = zcl_so_operation_u_01=>get_instance(  )->buffer_so_header_create( EXPORTING it_so = lt_so_head ).

        if lv_msg is not INITIAL.

            Loop at lt_so_head ASSIGNING FIELD-SYMBOL(<fs_so>).

                Insert value #( sales_doc_num = <fs_so>-vbeln
                                   %msg = lv_msg ) INTO TABLE reported-soheader.

               Insert value #( sales_doc_num = <fs_so>-vbeln ) INTO TABLE failed-soheader.

            ENDLOOP.

        else.

            Loop at lt_so_head ASSIGNING FIELD-SYMBOL(<fs_so_new>).

                Insert value #( sales_doc_num = <fs_so_new>-vbeln
                                   %msg = new_message(
                                  id = 'Z_RAP_U_SO_MSG'
                                  number = '002'
                                  v1 = 'Creating Sale Doc'
                                  v2 = <fs_so_new>-vbeln
                                  severity = if_abap_behv_message=>severity-success )

                                 ) INTO TABLE reported-soheader.


            ENDLOOP.

        endif.

  ENDMETHOD.

  METHOD update.

  Data: ls_SO_HEAD TYPE ZVBAK_02,
        lt_SO_HEAD TYPE STANDARD TABLE OF ZVBAK_02,
        ls_SO_control TYPE ZIF_SO_STRUCTURE=>ts_SO_control,
        lt_SO_control TYPE ZIF_SO_STRUCTURE=>tt_SO_control,
        lv_timestamp TYPE timestampl.


  GET TIME STAMP FIELD lv_timestamp.

  LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_so_head>).

   ls_SO_HEAD = CORRESPONDING #( <fs_so_head> MAPPING
                                    vbeln = sales_doc_num
                                    faksk = block_status
                                    vtweg = sales_dist
                                    spart = sales_div
                                    vkorg = sales_org
                                    netwr = total_cost
                                    waerk = cost_currency
                                    ernam = person_created
                                    erdat = date_created ).

    ls_SO_HEAD-last_changed_timestamp = lv_timestamp.

    APPEND ls_SO_HEAD to lt_SO_HEAD.



    ls_SO_control = CORRESPONDING #( <fs_so_head>-%control MAPPING
                                    vbeln = sales_doc_num
                                    faksk = block_status
                                    vtweg = sales_dist
                                    spart = sales_div
                                    vkorg = sales_org
                                    netwr = total_cost
                                    waerk = cost_currency
                                    ernam = person_created
                                    erdat = date_created ).

    ls_SO_control-vbeln_id = ls_SO_HEAD-vbeln.

    APPEND ls_SO_control to lt_SO_control.

  ENDLOOP.

    zcl_so_operation_u_01=>get_instance( )->buffer_so_header_update( EXPORTING it_so = lt_SO_HEAD
                                                                               it_so_control = lt_SO_control ).


  ENDMETHOD.

  METHOD delete.

    Data: ls_so_head TYPE ZVBAK_02,
          lt_so_head TYPE STANDARD TABLE OF ZVBAK_02.

    Loop at keys ASSIGNING FIELD-SYMBOL(<fs_so_delete>).

        ls_so_head-vbeln   = <fs_so_delete>-sales_doc_num.

        APPEND ls_so_head to lt_so_head.


    ENDLOOP.

    zcl_so_operation_u_01=>get_instance(  )->buffer_so_header_delete( EXPORTING it_so = lt_so_head ).

  ENDMETHOD.

  METHOD read.

  TYPES: Begin of ts_so_key,
        sales_doc_num TYPE zvbeln_va_02,
        End of ts_so_key.

  Data: lt_SO_keys TYPE TABLE OF ts_so_key,
        lt_so TYPE STANDARD TABLE OF ZVBAK_02.

  LOOP at keys ASSIGNING FIELD-SYMBOL(<fs_so>).

    APPEND VALUE #( sales_doc_num = <fs_so>-sales_doc_num ) TO lt_SO_keys.

  ENDLOOP.

  SELECT * from ZVBAK_02
  FOR ALL ENTRIES IN @lt_SO_keys
  WHERE vbeln = @lt_SO_keys-sales_doc_num
  INTO TABLE @lt_so.


  result = CORRESPONDING #( lt_so MAPPING
                            sales_doc_num  = vbeln
                            block_status   = faksk
                            sales_dist     = vtweg
                            sales_div      = spart
                            sales_org      = vkorg
                            total_cost     = netwr
                            cost_currency  = waerk
                            person_created = ernam
                            date_created   = erdat
                            last_changed   = last_changed_timestamp ).


  ENDMETHOD.



  METHOD blockOrder.

    Data: ls_so TYPE ZVBAK_02,
          lt_so TYPE STANDARD TABLE OF ZVBAK_02.

    Loop at keys ASSIGNING FIELD-SYMBOL(<fs_SO>).

        ls_so-vbeln = <fs_SO>-sales_doc_num.
        ls_so-faksk = block_code.

        APPEND ls_so to lt_so.

    ENDLOOP.

    zcl_so_operation_u_01=>get_instance(  )->buffer_so_block_unblock( EXPORTING it_so = lt_so
                                                                                lv_block = block_code ).

    result = VALUE #( FOR ls_so_temp IN lt_so ( sales_doc_num         = ls_so_temp-vbeln
                                                 %param-sales_doc_num = ls_so_temp-vbeln
                                                 %param-block_status  = ls_so_temp-faksk
                                                )
                                               ).



  ENDMETHOD.

  METHOD unBlockOrder.

   Data: ls_so TYPE ZVBAK_02,
          lt_so TYPE STANDARD TABLE OF ZVBAK_02.

    Loop at keys ASSIGNING FIELD-SYMBOL(<fs_SO>).

        ls_so-vbeln = <fs_SO>-sales_doc_num.
        ls_so-faksk = un_block_code.

        APPEND ls_so to lt_so.

    ENDLOOP.

    zcl_so_operation_u_01=>get_instance(  )->buffer_so_block_unblock( EXPORTING it_so    = lt_so
                                                                                lv_block = un_block_code ).

    result = VALUE #( FOR ls_so_temp IN lt_so ( sales_doc_num         = ls_so_temp-vbeln
                                                 %param-sales_doc_num = ls_so_temp-vbeln
                                                 %param-block_status  = ls_so_temp-faksk
                                                )
                                               ).

  ENDMETHOD.

  METHOD get_instance_features.

  Data:  lt_result LIKE LINE OF result.

  SELECT * FROM ZVBAK_02
  FOR ALL ENTRIES IN @keys
  WHERE vbeln = @keys-sales_doc_num
  INTO TABLE @DATA(lt_SO).

  LOOP at lt_SO ASSIGNING FIELD-SYMBOL(<fs_so>).

  lt_result = VALUE #(  sales_doc_num = <fs_so>-vbeln

                        %update = COND #( WHEN <fs_so>-faksk = ''
                                           THEN if_abap_behv=>fc-f-unrestricted
                                           ELSE  if_abap_behv=>fc-f-read_only )

                        %delete = COND #( WHEN <fs_so>-faksk = ''
                                           THEN if_abap_behv=>fc-f-unrestricted
                                           ELSE  if_abap_behv=>fc-f-read_only )

                        %assoc-_SItem_U_03 = COND #( WHEN <fs_so>-faksk = ''
                                           THEN if_abap_behv=>fc-f-unrestricted
                                           ELSE  if_abap_behv=>fc-f-read_only )



                         ).
    APPEND lt_result to result.

  ENDLOOP.



  ENDMETHOD.


  METHOD rba_Sitem_u_03.
  ENDMETHOD.

  METHOD cba_Sitem_u_03.

  Data: ls_so_item TYPE ZVBAP_02,
        lt_so_item TYPE STANDARD TABLE OF ZVBAP_02.


        READ TABLE entities_cba ASSIGNING FIELD-SYMBOL(<fs_so_item>) INDEX 1.
        if sy-subrc = 0.

                Select FROm ZVBAP_02 FIELDS MAX( posnr )
                WHERE vbeln = @<fs_so_item>-sales_doc_num
                INTO @DATA(lv_max_posnr).


              Loop at entities_cba ASSIGNING FIELD-SYMBOL(<fs_soi>).
              "Create a table of all Items
              "Pass this to the operation

               Loop at <fs_soi>-%target ASSIGNING FIELD-SYMBOL(<fs_soi_new>).

                  ls_so_item = CORRESPONDING #( <fs_soi_new> MAPPING
                                            waerk = cost_currency
                                            arktx = mat_desc
                                            matnr = mat_num
                                            kpein = quantity
                                            netpr = unit_cost
                                            kmein = unit
                                             ).
              "Check if the negative values of qty and unit is cost

              if ls_so_item-netpr < 0 or ls_so_item-kpein < 0.



                "REPORTED
                Append value #( sales_doc_num = <fs_soi>-sales_doc_num
                                %msg = new_message(
                                  id       = 'Z_RAP_U_SO_MSG'
                                  number   = '001'
                                  v1       = 'Create Item'
                                  v2       = 'Unit or Cost Cant be Negative'
                                  severity = if_abap_behv_message=>severity-error )
                                 ) TO reported-soitem.

              "Failed
                Append value #( sales_doc_num = <fs_soi>-sales_doc_num
                                item_position = <fs_soi_new>-item_position
                              ) TO failed-soitem.

                  RETURN.
              endif.

              ls_so_item-netwr = ls_so_item-netpr * ls_so_item-kpein.
              ls_so_item-posnr = lv_max_posnr + 10.
              lv_max_posnr     += 10.
              ls_so_item-vbeln = <fs_soi>-sales_doc_num.

              APPEND ls_so_item to lt_so_item.


            ENDLOOP.
          EndLoop.

          zcl_so_operation_u_01=>get_instance( )->buffer_soi_item_create( EXPORTING it_soi = lt_so_item ).

      endif.

  ENDMETHOD.

  METHOD GetFile.

*  DATA t_recipient type ref to IF_RECIPIENT_BCS.



*  zcl_abap_file_uploader=>if_http_service_extension( )->

  ENDMETHOD.

ENDCLASS.

CLASS lhc_SOItem DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE SOItem.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE SOItem.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE SOItem.

    METHODS read FOR READ
      IMPORTING keys FOR READ SOItem RESULT result.

ENDCLASS.

CLASS lhc_SOItem IMPLEMENTATION.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.

  Data: ls_soi type ZVBAP_02,
        lt_soi TYPE STANDARD TABLE OF ZVBAP_02.

  Loop at keys ASSIGNING FIELD-SYMBOL(<fs_soi>).

      ls_soi = CORRESPONDING #( <fs_soi> MAPPING
                                vbeln = sales_doc_num
                                posnr = item_position
                                ).

     APPEND ls_soi to lt_soi.

  ENDLOOP.

  zcl_so_operation_u_01=>get_instance(  )->buffer_soi_item_delete( EXPORTING it_soi = lt_soi ).

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_Z_I_SALES_HEADER_U_03 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_Z_I_SALES_HEADER_U_03 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

    zcl_so_operation_u_01=>get_instance(  )->save(  ).

  ENDMETHOD.

  METHOD cleanup.
    zcl_so_operation_u_01=>get_instance(  )->Reset( ).
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

*  METHOD finalize.
*  ENDMETHOD.
*
*  METHOD check_before_save.
*  ENDMETHOD.

*  METHOD save.
*    zcl_so_operation_u_01=>get_instance(  )->save( ).
*  ENDMETHOD.

*  METHOD cleanup.
*  zcl_so_operation_u_01=>get_instance(  )->reset( ).
*  ENDMETHOD.

*  METHOD cleanup_finalize.
*  ENDMETHOD.

*ENDCLASS.

CLASS zcl_rap_xyz_class_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES:
      tt_testcg_comp TYPE STANDARD TABLE OF zcg_rap_eza_comp WITH DEFAULT KEY,
      ts_testcg_comp TYPE zcg_rap_eza_comp,
      tt_customer    TYPE STANDARD TABLE OF /dmo/customer  WITH DEFAULT KEY,
      ts_customer    TYPE /dmo/customer,
      tt_testcg_head TYPE STANDARD TABLE OF zcg_rap_eza_head  WITH DEFAULT KEY,
      ts_testcg_head TYPE zcg_rap_eza_head,
      tt_testcg_item TYPE STANDARD TABLE OF zcg_rap_eza_item  WITH DEFAULT KEY,
      ts_testcg_item TYPE zcg_rap_eza_item.
    CONSTANTS:
      gc_comp_max  TYPE i VALUE 100, "Number of components in zcg_rap_eza_comp
      gc_docu_max  TYPE i VALUE 200, "Number of documents
      gc_max_items TYPE i VALUE 15, "Max. number of items per document
      gc_currency  TYPE /dmo/currency_code VALUE 'EUR',
      gc_uom       TYPE meins VALUE 'ST'.

    METHODS:
      zcg_rap_comp_gen,
      zcg_rap_docu_gen.
ENDCLASS.



CLASS zcl_rap_xyz_class_02 IMPLEMENTATION.

  METHOD zcg_rap_comp_gen.
    DATA: lt_testcg_comp TYPE tt_testcg_comp,
          ls_testcg_comp TYPE ts_testcg_comp,
          lv_counter     TYPE i,
          lv_buffer(10)  TYPE c,
          lv_matnr(10)   TYPE c.
    DATA(lv_random) = cl_abap_random_int=>create(
    seed = CONV i( cl_abap_context_info=>get_system_time( ) )
    min = 10
    max = 1000 ).
    GET TIME STAMP FIELD DATA(lv_time).
    CLEAR lt_testcg_comp.
    lv_counter = 0.
    WHILE lv_counter < gc_comp_max.
      lv_counter += 1.
      TRY.
          lv_buffer = |{ lv_counter } |.
          lv_matnr = |{ lv_buffer ALPHA = IN }|.
          ls_testcg_comp = VALUE #(
          uuid = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( )
          matnr = lv_matnr
          maktx = |Component { lv_counter }.|
          price = lv_random->get_next( ) / 10
          currency_code = gc_currency
          unit_of_measure = gc_uom
          created_by = sy-uname
          created_at = lv_time
          last_changed_by = sy-uname
          last_changed_at = lv_time
          ).
          APPEND ls_testcg_comp TO lt_testcg_comp.
        CATCH cx_uuid_error.
          CLEAR lt_testcg_comp.
          EXIT.
      ENDTRY.
    ENDWHILE.
    IF NOT lt_testcg_comp IS INITIAL.
      DELETE FROM zcg_rap_eza_comp.
      INSERT zcg_rap_eza_comp FROM TABLE @lt_testcg_comp.
      COMMIT WORK.
    ENDIF.
  ENDMETHOD.

  METHOD zcg_rap_docu_gen.
    DATA: lt_customer        TYPE tt_customer,
          lt_components      TYPE tt_testcg_comp,
          lt_headers         TYPE tt_testcg_head,
          ls_header          TYPE ts_testcg_head,
          lt_items           TYPE tt_testcg_item,
          ls_item            TYPE ts_testcg_item,
          lv_counter         TYPE i,
          lv_item_cnt        TYPE i,
          lv_item_max        TYPE i,
          lv_document_number TYPE zcg_rap_eza_docnum,
          lv_item_number     TYPE zcg_rap_eza_posnum.

    CLEAR: lt_customer,
    lt_components,
    lt_headers,
    lt_items.
    SELECT: * FROM /dmo/customer INTO TABLE @lt_customer
    UP TO 1000 ROWS,
  * FROM zcg_rap_eza_comp INTO TABLE @lt_components
    UP TO @gc_comp_max ROWS.
    GET TIME STAMP FIELD DATA(lv_time).
* Random generator for customer assignment:

    DATA(lv_random) = cl_abap_random_int=>create(
    seed = CONV i( cl_abap_context_info=>get_system_time( ) )
    min = 1
    max = lines( lt_customer ) ).
    lv_counter = 0.
    WHILE lv_counter < gc_docu_max.
      lv_counter += 1.
      lv_document_number = 900000 + lv_counter.
      TRY.
          READ TABLE lt_customer INDEX lv_random->get_next( )
          ASSIGNING FIELD-SYMBOL(<ls_customer>).
          IF sy-subrc EQ 0.
            ls_header = VALUE #(
            uuid = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( )
            document_number = |{ lv_document_number ALPHA = IN }|
            customer_id = <ls_customer>-customer_id
            created_by = sy-uname
            created_at = lv_time
            last_changed_by = sy-uname
            last_changed_at = lv_time
            ).
            APPEND ls_header TO lt_headers.
          ENDIF.
        CATCH cx_uuid_error.
          CLEAR lt_headers.
          EXIT.
      ENDTRY.
    ENDWHILE.
    IF NOT lt_headers IS INITIAL.
* Random generator for number of items for document:
      lv_random = cl_abap_random_int=>create(
      seed = CONV i( cl_abap_context_info=>get_system_time( ) )
      min = 2
      max = gc_max_items ).
* Random generator for item quantity:
      DATA(lv_random_q) = cl_abap_random_int=>create(
      seed = CONV i( cl_abap_context_info=>get_system_time( ) )
      min = 1
      max = 5 ).
* Random generator for item component assignment:
      DATA(lv_random_c) = cl_abap_random_int=>create(
      seed = CONV i( cl_abap_context_info=>get_system_time( ) )
      min = 1
      max = lines( lt_components ) ).
      LOOP AT lt_headers ASSIGNING FIELD-SYMBOL(<ls_header>).
        lv_item_max = lv_random->get_next( ).
        lv_item_cnt = 0.
        lv_item_number = 0.
        WHILE lv_item_cnt < lv_item_max.
          lv_item_cnt += 1.
          lv_item_number += 10.
          TRY.
              READ TABLE lt_components INDEX lv_random_c->get_next( )
              ASSIGNING FIELD-SYMBOL(<ls_component>).
              IF sy-subrc EQ 0.
                DATA: lv_quantity TYPE zcg_rap_eza_quant,
                      lv_value    TYPE zcg_rap_eza_value.
                lv_quantity = lv_random_q->get_next( ).
                lv_value = lv_quantity * <ls_component>-price.
                ls_item = VALUE #(
                uuid = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( )
                header_id = <ls_header>-uuid
                item_number = |{ lv_item_number ALPHA = IN }|
                component_id = <ls_component>-uuid
                quantity = lv_quantity
                value = lv_value
                created_by = sy-uname
                created_at = lv_time
                last_changed_by = sy-uname
                last_changed_at = lv_time
                ).
                APPEND ls_item TO lt_items.
              ENDIF.
            CATCH cx_uuid_error.
              CLEAR lt_items.
              EXIT.
          ENDTRY.
        ENDWHILE.
      ENDLOOP.
    ENDIF.
    IF NOT lt_items IS INITIAL.
      DELETE: FROM zcg_rap_eza_head,
      FROM zcg_rap_eza_item.
      INSERT: zcg_rap_eza_head FROM TABLE @lt_headers,
      zcg_rap_eza_item FROM TABLE @lt_items.
      COMMIT WORK.
    ENDIF.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    zcg_rap_comp_gen( ). "Components table update
    zcg_rap_docu_gen( ). "Header and item tables update
    out->write( 'Example data prepared.').
  ENDMETHOD.
ENDCLASS.

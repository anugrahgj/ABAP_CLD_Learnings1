CLASS zcl_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_data_generator.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS determine_db_table
      IMPORTING
                tabname               TYPE string
      RETURNING VALUE(db_table_index) TYPE zif_biz_sources_types~supported_tables.
    METHODS get_db_table_name
      IMPORTING
                supported_table   TYPE zif_biz_sources_types~supported_tables
      RETURNING VALUE(table_name) TYPE string.
    METHODS check_where_condition_basic
      IMPORTING
                where_condition TYPE zif_biz_sources_types~where_condition
      RETURNING VALUE(is_valid) TYPE abap_bool.
    METHODS check_where_cond_w_struct
      IMPORTING
                where_condition TYPE zif_biz_sources_types~where_condition
                db_table_name   TYPE char16
      RETURNING VALUE(is_valid) TYPE abap_bool.
    METHODS construct_where_cond
      IMPORTING
                where_condition               TYPE zif_biz_sources_types~where_condition
      RETURNING VALUE(where_condition_string) TYPE string.
    methods db_update_by_itab
      importing
        db_table type string
        where_condition type string
        data_to_update type table.

ENDCLASS.



CLASS zcl_data_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA:
          generator TYPE REF TO zcl_data_generator.
    generator = NEW zcl_data_generator( ).
    "generator->zif_data_generator~create_basic_sources_data( ).

"    generator->zif_data_generator~create_basic_agent_data( ).


*    DATA:
*          agent_data_to_update TYPE STANDARD TABLE OF zbiz_agent.
*    agent_data_to_update = VALUE #( ( created_by = 'FLORIANS' ) ).
*
*    generator->zif_data_generator~update_basic_sources_data(
*      db_table_to_update = 'zbiz_agent'
*      db_table_key_cond = VALUE #( ( key_field = 'agent_id' operator = '<>' key_condition_value = '1' ) )
*      db_table_data_to_update = agent_data_to_update
*      data_struct = value zbiz_agent( created_by = 'FLORIANS' )
*      ).
    data:
          update_data type STANDARD TABLE OF zbz_data_source.


    data(dao_inst) = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao( ).
    data(dao_util_inst) = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao_util( ).
    dao_util_inst->get_cds_field_name_from_db_str( tabname = 'zbz_data_source' db_structure_field = 'data_source_id' cds_view_name = 'Z_C_DATASRCSSUBS' ).
*    update_data = VALUE #( ( DATA_SOURCE_ID ='3' SOURCE_URL ='sec.gov' DISCOVERY_TIMESTAMP ='20211209104916 ' DESCRIPTION_TEXT ='sec' CREATED_BY ='CB9980000124' LAST_CHANGED_BY ='CB9980000124' LAST_CHANGED_AT ='20211209105250 ' LOCAL_LAST_CHANGED_AT =
*'20211209105250 '  )
* ).
*    dao_inst->execute_insert( tabname = zif_biz_dao=>zbz_data_source data_to_insert = update_data ).

    out->write( 'Done' ).
  ENDMETHOD.


  METHOD zif_data_generator~create_basic_sources_data.

    DATA:
      data_src             TYPE STANDARD TABLE OF zbz_data_source,
      subscription         TYPE STANDARD TABLE OF zbz_subscription,
      source_endpoint      TYPE STANDARD TABLE OF zpf_src_endpoint,
      source_subscriptions TYPE STANDARD TABLE OF zpf_data_src_sub.
    DATA: dummy_timestamp TYPE tzntstmps.

    GET TIME STAMP FIELD dummy_timestamp.
    subscription = VALUE #( (  data_source_subscription_id = 1 contact_email_used = 'test@test.com' login_user = 'A78F9D5222AC4B' login_password = 'F9D5222AC41D' valid_from = '20210101' valid_to = '20211231' )
                            (  data_source_subscription_id = 2 contact_email_used = 'test@test.com' login_user = 'A78F9D5222AC4B' login_password = 'F9D5222AC41D' valid_from = '20210101' valid_to = '20211231' )
                            (  data_source_subscription_id = 3 contact_email_used = 'test2@test2.com' login_user = 'B7A78F9D52AC4B' login_password = 'FF3A22D740D' valid_from = '20210101' valid_to = '20211231' )
                           ).

    data_src = VALUE #( (  data_source_id = 1 description_text = 'test' discovery_timestamp = dummy_timestamp source_url = 'kyberia.biz' )
                        (  data_source_id = 2 description_text = 'test' discovery_timestamp = dummy_timestamp source_url = 'hysteria.biz' )
                      ).

    source_endpoint = VALUE #( (  description = 'public, main endpoint' endpoint = '/v1/api/main' endpoint_id = 1 )
                               (  description = 'private, administration' endpoint = '/v1/api/admin' endpoint_id = 2 )
                               (  description = 'public, data' endpoint = '/v1/api/data' endpoint_id = 3 )
                             ).

    source_subscriptions = VALUE #( (  record_id = 1 data_source_id = 1 data_source_subscription_id = 1 )
                                    (  record_id = 2 data_source_id = 1 data_source_subscription_id = 2 )
                                    (  record_id = 3 data_source_id = 2 data_source_subscription_id = 3 )
                                  ).

    INSERT zbz_data_source FROM TABLE @data_src.
*    INSERT zpf_src_endpoint FROM TABLE @source_endpoint.
*    INSERT zbz_subscription FROM TABLE @subscription.
*    INSERT zpf_data_src_sub FROM TABLE @source_subscriptions.

  ENDMETHOD.


  METHOD zif_data_generator~create_basic_agent_data.

    DATA:
      agent_purpose        TYPE STANDARD TABLE OF zpf_agent_prps,
      programming_language TYPE STANDARD TABLE OF zpf_prog_lang,
      agent                TYPE STANDARD TABLE OF zbiz_agent,
      agent_source         TYPE STANDARD TABLE OF zpf_dt_src_agent.

    agent_purpose = VALUE #( ( purpose_id = 1 purpose_description = 'spider' )
                             ( purpose_id = 2 purpose_description = 'miner' )
                             ( purpose_id = 3 purpose_description = 'monitor' )
                           ).

    programming_language = VALUE #( ( programming_language_id = 1 language_name = 'python' runtime_env = 'python' version = '3.8.5' )
                                    ( programming_language_id = 2 language_name = 'bash' runtime_env = '/bin/bash' version = '4' )
                                    ( programming_language_id = 3 language_name = 'zsh' runtime_env = '/bin/zsh' version = '1' )
                                  ).
    agent = VALUE #( ( agent_id = 1 agent_name = 'bizland_explorer' programming_language_id = 1 purpose_id = 1 )
                     ( agent_id = 2 agent_name = 'sec_miner' programming_language_id = 1 purpose_id = 2 )
                    ).
    agent_source = VALUE #( ( agent_id = 1 data_source_agent_id = 1 data_source_id = 1 )
                            ( agent_id = 2 data_source_agent_id = 2 data_source_id = 1 )
                          ).
*    INSERT zpf_agent_prps FROM TABLE @agent_purpose.
*    INSERT zpf_prog_lang FROM TABLE @programming_language.
    INSERT zbiz_agent FROM TABLE @agent.
*    INSERT zpf_dt_src_agent FROM TABLE @agent_source.

  ENDMETHOD.


  METHOD zif_data_generator~update_basic_sources_data.
    DATA:
      table_name_descr TYPE REF TO cl_abap_typedescr,
      table_data       TYPE REF TO cl_abap_typedescr,
      struct_descr1 type ref to cl_abap_structdescr,
      struct_descr2 type ref to cl_abap_structdescr,
      struct_components1 type  cl_abap_structdescr=>component_table,
      struct_components2 type  cl_abap_structdescr=>component_table,
      object_to_update TYPE char16,
      where_condition_string type string.

    FIELD-SYMBOLS:
      <data_to_update> TYPE STANDARD TABLE.

    cl_abap_datadescr=>describe_by_name(
      EXPORTING
        p_name = db_table_to_update
      EXCEPTIONS
        type_not_found = 1
    ).
    CHECK sy-subrc IS INITIAL.
    table_name_descr = cl_abap_datadescr=>describe_by_name( db_table_to_update ).
    struct_descr1 ?= cl_abap_typedescr=>describe_by_data( data_struct ).
    struct_components1 = struct_descr1->get_components( ).

    struct_descr2 ?= cl_abap_typedescr=>describe_by_name( db_table_to_update ).
    struct_components2 = struct_descr2->get_components( ).
    if struct_descr2 = struct_descr1.
      data(nn) = 25.
    endif.

    CHECK table_name_descr->kind = cl_abap_datadescr=>kind_struct.
    CHECK table_name_descr->is_ddic_type( ) = abap_true.
    CHECK determine_db_table( table_name_descr->get_relative_name( ) ) IS NOT INITIAL.

    table_data = cl_abap_typedescr=>describe_by_data( db_table_data_to_update ).
    CHECK table_data->kind = cl_abap_typedescr=>kind_table.

    IF db_table_key_cond IS NOT INITIAL.
      CHECK check_where_condition_basic( db_table_key_cond ) = abap_true.
      CHECK check_where_cond_w_struct( db_table_name = db_table_to_update where_condition = db_table_key_cond ) = abap_true.
    ENDIF.

    where_condition_string = construct_where_cond( db_table_key_cond ).

  ENDMETHOD.


  METHOD determine_db_table.

    CASE tabname.
      WHEN zif_data_generator~zbiz_agent.
        db_table_index = zif_biz_sources_types~zbiz_agent.
        RETURN.
      WHEN zif_data_generator~zpf_agent_prps.
        db_table_index  = zif_biz_sources_types~zpf_agent_prps.
        RETURN.
      WHEN zif_data_generator~zbz_data_source.
        db_table_index = zif_biz_sources_types~zbz_data_source.
        RETURN.
      WHEN zif_data_generator~zpf_data_src_sub.
        db_table_index = zif_biz_sources_types~zpf_data_src_sub.
        RETURN.
      WHEN zif_data_generator~zpf_dt_src_agent.
        db_table_index = zif_biz_sources_types~zpf_dt_src_agent.
        RETURN.
      WHEN zif_data_generator~zpf_prog_lang.
        db_table_index = zif_biz_sources_types~zpf_prog_lang.
        RETURN.
      WHEN zif_data_generator~zpf_src_endpoint.
        db_table_index = zif_biz_sources_types~zpf_src_endpoint.
        RETURN.
      WHEN zif_data_generator~zbz_subscription.
        db_table_index = zif_biz_sources_types~zbz_subscription.
        RETURN.
      WHEN OTHERS.
        RETURN.
    ENDCASE.

  ENDMETHOD.


  METHOD get_db_table_name.

    CASE supported_table.
      WHEN zif_biz_sources_types~zbiz_agent.
        table_name = zif_data_generator~zbiz_agent.
        RETURN.
      WHEN zif_biz_sources_types~zpf_agent_prps.
        table_name = zif_data_generator~zpf_agent_prps.
        RETURN.
      WHEN zif_biz_sources_types~zbz_data_source.
        table_name = zif_data_generator~zbz_data_source.
        RETURN.
      WHEN zif_biz_sources_types~zpf_data_src_sub.
        table_name = zif_data_generator~zpf_data_src_sub.
        RETURN.
      WHEN zif_biz_sources_types~zpf_dt_src_agent.
        table_name = zif_data_generator~zpf_dt_src_agent.
        RETURN.
      WHEN zif_biz_sources_types~zpf_prog_lang.
        table_name = zif_data_generator~zpf_prog_lang.
        RETURN.
      WHEN zif_biz_sources_types~zpf_src_endpoint.
        table_name = zif_data_generator~zpf_src_endpoint.
        RETURN.
      WHEN zif_biz_sources_types~zbz_subscription.
        table_name = zif_data_generator~zbz_subscription.
        RETURN.
      WHEN OTHERS.
        RETURN.
    ENDCASE.

  ENDMETHOD.


  METHOD check_where_condition_basic.

    LOOP AT where_condition INTO DATA(condition).

      is_valid = abap_false.
      CHECK condition-key_field IS NOT INITIAL.
      CHECK condition-operator IS NOT INITIAL.
      CHECK condition-key_condition_value IS NOT INITIAL.
      FIND REGEX |^=\\s+$\|^(<>)\{1\}$| IN condition-operator.
      CHECK sy-subrc IS INITIAL.
      IF condition-binding_operator IS NOT INITIAL.
        FIND REGEX |^(OR)$\|^(AND)$| IN condition-binding_operator.
        CHECK sy-subrc IS INITIAL.
      ENDIF.
      is_valid = abap_true.

    ENDLOOP.

  ENDMETHOD.


  METHOD check_where_cond_w_struct.

    DATA:
      struct_descr      TYPE REF TO cl_abap_structdescr,
      components_db_tab TYPE cl_abap_structdescr=>component_table,
      key_field_buffer  TYPE string.

    struct_descr ?= cl_abap_structdescr=>describe_by_name( p_name = db_table_name ).
    components_db_tab = struct_descr->get_components( ).

    LOOP AT where_condition INTO DATA(condition).

      is_valid = abap_false.
      key_field_buffer = condition-key_field.
      TRANSLATE key_field_buffer TO UPPER CASE.
      CHECK line_exists( components_db_tab[ name = key_field_buffer ] ).
      is_valid = abap_true.

    ENDLOOP.

  ENDMETHOD.


  METHOD construct_where_cond.

    DATA:
      tmp_cond_string    TYPE string VALUE ''.

    LOOP AT where_condition INTO DATA(condition).
      tmp_cond_string = | { tmp_cond_string } { condition-key_field } { condition-operator } { condition-key_condition_value } { condition-binding_operator }|.
    ENDLOOP.
    condense tmp_cond_string.
    where_condition_string = tmp_cond_string.

  ENDMETHOD.


  method db_update_by_itab.

    field-symbols:
      <db_table> type string, <where_cond> type string.
    assign db_table to <db_table>.
    assign where_condition to <where_cond>.
    update (<db_table>)
     from table @data_to_update.

  endmethod.

ENDCLASS.

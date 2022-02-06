CLASS lhc_datasrcsubs DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    CONSTANTS:
               datasrcssubs_key_field TYPE char32 VALUE 'DataSourceId'.
    TYPES:
      BEGIN OF datasrcsubs_fail,
        cid          TYPE abp_behv_cid,
        BEGIN OF key,
          datasourceid TYPE zdata_src_id,
        END OF key,
        fail         TYPE if_abap_behv=>t_failinfo,
        datasourceid TYPE zdata_src_id,
        create       TYPE abp_behv_flag,
        update       TYPE abp_behv_flag,
        delete       TYPE abp_behv_flag,
      END OF datasrcsubs_fail,
      BEGIN OF datasrcsubs_entities,
        cid                TYPE abp_behv_cid,
        BEGIN OF key,
          datasourceid TYPE zdata_src_id,
        END OF key,
        BEGIN OF datasrcssubs_control,
          datasourceid       TYPE abp_behv_flag,
          sourceurl          TYPE abp_behv_flag,
          discoverytimestamp TYPE abp_behv_flag,
          descriptiontext    TYPE abp_behv_flag,
          createdby          TYPE abp_behv_flag,
          lastchangedby      TYPE abp_behv_flag,
          lastchangedat      TYPE abp_behv_flag,
          locallastchangedat TYPE abp_behv_flag,
        END OF datasrcssubs_control,
        datasourceid       TYPE zdata_src_id,
        sourceurl          TYPE string,
        discoverytimestamp TYPE tzntstmps,
        descriptiontext    TYPE string,
        createdby          TYPE char64,
        lastchangedby      TYPE char64,
        lastchangedat      TYPE tzntstmps,
        locallastchangedat TYPE tzntstmps,
      END OF datasrcsubs_entities,
      datasrcsubs_fail_tab     TYPE STANDARD TABLE OF datasrcsubs_fail WITH KEY key,
      datasrcsubs_entities_tab TYPE STANDARD TABLE OF datasrcsubs_entities WITH KEY key.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR datasrcsubs RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE datasrcsubs.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE datasrcsubs.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE datasrcsubs.

    METHODS read FOR READ
      IMPORTING keys FOR READ datasrcsubs RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK datasrcsubs.

    METHODS rba_Agent FOR READ
      IMPORTING keys_rba FOR READ datasrcsubs\_Agent FULL result_requested RESULT result LINK association_links.

    METHODS rba_Subscription FOR READ
      IMPORTING keys_rba FOR READ datasrcsubs\_Subscription FULL result_requested RESULT result LINK association_links.

    METHODS cba_Agent FOR MODIFY
      IMPORTING entities_cba FOR CREATE datasrcsubs\_Agent.

    METHODS cba_Subscription FOR MODIFY
      IMPORTING entities_cba FOR CREATE datasrcsubs\_Subscription.
    METHODS rba_Srcendpoint FOR READ
      IMPORTING keys_rba FOR READ datasrcsubs\_Srcendpoint FULL result_requested RESULT result LINK association_links.

    METHODS cba_Srcendpoint FOR MODIFY
      IMPORTING entities_cba FOR CREATE datasrcsubs\_Srcendpoint.

    METHODS write_failed
      IMPORTING
                entities_table        TYPE datasrcsubs_entities_tab
      RETURNING VALUE(failed_objects) TYPE datasrcsubs_fail_tab.

    METHODS update_single
      IMPORTING
                entities_table       TYPE datasrcsubs_entities_tab
      RETURNING VALUE(return_status) TYPE zif_biz_sources_types=>update_error_statuses.

    METHODS update_multiple
      IMPORTING
                entities_table       TYPE datasrcsubs_entities_tab
      RETURNING VALUE(return_status) TYPE abap_bool.

    METHODS construct_where_cond_id
      IMPORTING
                entities          TYPE datasrcsubs_entities_tab
      RETURNING VALUE(where_cond) TYPE zif_biz_sources_types=>where_condition.
ENDCLASS.

CLASS lhc_datasrcsubs IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.

    DATA:
      data_to_insert      TYPE STANDARD TABLE OF zbz_data_source,
      data_line_to_insert LIKE LINE OF data_to_insert,
      id_counter          TYPE i,
      current_data        TYPE STANDARD TABLE OF zbz_data_source,
      op_status           TYPE abap_bool,
      failed_line         LIKE LINE OF failed-datasrcsubs,
      mapped_line         LIKE LINE OF mapped-datasrcsubs,
      create_exception    TYPE REF TO zcx_bizland_bp_datasrcsubs_exc.
    id_counter = 1.

    TRY.
        op_status = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao( )->execute_select(
                                                                                                EXPORTING
                                                                                                  tabname = zif_biz_sources_constants=>zbz_data_source
                                                                                                IMPORTING
                                                                                                  result_set = current_data ).
      CATCH zcx_bizland_bp_datasrcsubs_exc INTO create_exception.
    ENDTRY.

    IF op_status = abap_false OR create_exception IS NOT INITIAL.
      failed-datasrcsubs = CORRESPONDING #( write_failed(
                                              entities_table = CORRESPONDING #(
                                                  entities MAPPING
                                                    cid = %cid
                                                    key = %key
                                                    createdby = CreatedBy
                                                    datasourceid = DataSourceId
                                                    descriptiontext = DescriptionText
                                                    discoverytimestamp = DiscoveryTimestamp
                                                    lastchangedat = LastChangedAt
                                                    lastchangedby = LastChangedBy
                                                    locallastchangedat = LocalLastChangedAt
                                                    sourceurl = SourceUrl
                                                    ) ) MAPPING
                                           %cid = cid
                                           %create = create
                                           %delete = delete
                                           %update = update
                                           DataSourceId = datasourceid
                                           %fail = fail
                                           %key = key
                                    ).
      RETURN.
    ENDIF.
    " this is so we can create a new ID
    SORT current_data BY data_source_id.
    id_counter = current_data[ lines( current_data ) ]-data_source_id + 1.
    LOOP AT entities INTO DATA(entity).
      data_line_to_insert = CORRESPONDING #( entity MAPPING
                                               description_text = DescriptionText
                                               discovery_timestamp = DiscoveryTimestamp
                                               source_url = SourceUrl
                                           ).
      data_line_to_insert-created_by = sy-uname.
      GET TIME STAMP FIELD data_line_to_insert-last_changed_at.
      data_line_to_insert-last_changed_by = sy-uname.
      data_line_to_insert-local_last_changed_at = data_line_to_insert-last_changed_at.
      data_line_to_insert-data_source_id = id_counter.

      mapped_line-%key-DataSourceId = id_counter.
      mapped_line-%cid = entity-%cid.
      mapped_line-DataSourceId = id_counter.

      APPEND mapped_line TO mapped-datasrcsubs.
      APPEND data_line_to_insert TO data_to_insert.

      id_counter += 1.
      CLEAR mapped_line.
    ENDLOOP.
    TRY.
        op_status = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao( )->execute_insert( data_to_insert = data_to_insert tabname = zif_biz_sources_constants=>zbz_data_source ).
      CATCH zcx_bizland_bp_datasrcsubs_exc INTO create_exception.
    ENDTRY.
    IF op_status = abap_true OR create_exception IS NOT INITIAL.
      failed-datasrcsubs = CORRESPONDING #( write_failed(
                                              entities_table = CORRESPONDING #(
                                                  entities MAPPING
                                                    cid = %cid
                                                    key = %key
                                                    createdby = CreatedBy
                                                    datasourceid = DataSourceId
                                                    descriptiontext = DescriptionText
                                                    discoverytimestamp = DiscoveryTimestamp
                                                    lastchangedat = LastChangedAt
                                                    lastchangedby = LastChangedBy
                                                    locallastchangedat = LocalLastChangedAt
                                                    sourceurl = SourceUrl
                                                    ) ) MAPPING
                                           %cid = cid
                                           %create = create
                                           %delete = delete
                                           %update = update
                                           DataSourceId = datasourceid
                                           %fail = fail
                                           %key = key
                                    ).
    ENDIF.
*    MODIFY ENTITIES OF z_i_datasrcssubs IN LOCAL MODE
*      ENTITY
*        datasrcsubs
*        CREATE
*          AUTO FILL CID FIELDS ( CreatedBy DescriptionText DiscoveryTimestamp LastChangedAt LastChangedBy LocalLastChangedAt SourceUrl )
*            WITH data_to_insert
*      mapped mapped
*      reported reported
*      failed failed.

  ENDMETHOD.

  METHOD update.

    DATA:
      data_to_update TYPE STANDARD TABLE OF zbz_data_source,
      return_status  TYPE abap_bool,
      failed_line    LIKE LINE OF failed-datasrcsubs,
      mapped_line    LIKE LINE OF mapped-datasrcsubs.


    IF lines( entities ) = 1.
      return_status = update_single( entities_table = CORRESPONDING #( entities MAPPING
                                                            cid = %cid_ref
                                                            createdby = CreatedBy
                                                            datasourceid = DataSourceId
                                                            descriptiontext = DescriptionText
                                                            discoverytimestamp = DiscoveryTimestamp
                                                            key = %key
                                                            lastchangedat = LastChangedAt
                                                            lastchangedby = LastChangedBy
                                                            locallastchangedat = LocalLastChangedAt
                                                            sourceurl = SourceUrl
                                                           ) ).
    ELSE.
      return_status = update_multiple( entities_table = CORRESPONDING #( entities MAPPING
                                                            cid = %cid_ref
                                                            createdby = CreatedBy
                                                            datasourceid = DataSourceId
                                                            descriptiontext = DescriptionText
                                                            discoverytimestamp = DiscoveryTimestamp
                                                            key = %key
                                                            lastchangedat = LastChangedAt
                                                            lastchangedby = LastChangedBy
                                                            locallastchangedat = LocalLastChangedAt
                                                            sourceurl = SourceUrl
                                                           ) ).
    ENDIF.
    IF return_status = abap_false.
      failed-datasrcsubs = CORRESPONDING #( write_failed(
                                            entities_table = CORRESPONDING #(
                                                entities MAPPING
                                                  cid = %cid_ref
                                                  key = %key
                                                  createdby = CreatedBy
                                                  datasourceid = DataSourceId
                                                  descriptiontext = DescriptionText
                                                  discoverytimestamp = DiscoveryTimestamp
                                                  lastchangedat = LastChangedAt
                                                  lastchangedby = LastChangedBy
                                                  locallastchangedat = LocalLastChangedAt
                                                  sourceurl = SourceUrl
                                                  ) ) MAPPING
                                         %cid = cid
                                         %create = create
                                         %delete = delete
                                         %update = update
                                         DataSourceId = datasourceid
                                         %fail = fail
                                         %key = key
                                  ).
    ENDIF.

  ENDMETHOD.

  METHOD delete.

    DATA:
      op_status        TYPE abap_bool,
      delete_exception TYPE REF TO zcx_bizland_bp_datasrcsubs_exc,
      current_data     TYPE STANDARD TABLE OF zbz_data_source,
      where_condition  TYPE zif_biz_sources_types=>where_condition.

    where_condition = construct_where_cond_id( entities = CORRESPONDING #(
                                                  keys MAPPING
                                                    key = %key
                                                  )
                                              ).
    IF where_condition IS INITIAL.
      failed-datasrcsubs = CORRESPONDING #( write_failed(
                                            entities_table = CORRESPONDING #(
                                                keys MAPPING
                                                  key = %key
                                                  ) ) MAPPING
                                                       %create = create
                                                       %delete = delete
                                                       %update = update
                                                       DataSourceId = datasourceid
                                                       %fail = fail
                                                       %key = key ).
    ENDIF.
    TRY.
        op_status = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao( )->execute_delete( tabname = zif_biz_sources_constants=>zbz_data_source
                                                                                                  where_cond = where_condition ).
      CATCH zcx_bizland_bp_datasrcsubs_exc INTO delete_exception.
    ENDTRY.

    IF op_status IS INITIAL.
      failed-datasrcsubs = CORRESPONDING #( write_failed(
                                            entities_table = CORRESPONDING #(
                                                keys MAPPING
                                                  key = %key
                                                  ) ) MAPPING
                                                       %create = create
                                                       %delete = delete
                                                       %update = update
                                                       DataSourceId = datasourceid
                                                       %fail = fail
                                                       %key = key ).
    ENDIF.

  ENDMETHOD.

  METHOD read.

    DATA:
      op_status       TYPE abap_bool,
      read_exception  TYPE REF TO zcx_bizland_bp_datasrcsubs_exc,
      current_data    TYPE STANDARD TABLE OF zbz_data_source,
      where_condition TYPE zif_biz_sources_types=>where_condition.

    IF lines( keys ) >= 1.
      where_condition = construct_where_cond_id( entities = CORRESPONDING #(
                                                    keys MAPPING
                                                      key = %key
                                                    datasrcssubs_control = %control
                                                  )
                                                ).
    ENDIF.
    TRY.
        op_status = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao( )->execute_select(
                                                                                                EXPORTING
                                                                                                  tabname = zif_biz_sources_constants=>zbz_data_source
                                                                                                  where_cond = where_condition
                                                                                                IMPORTING
                                                                                                  result_set = current_data ).
      CATCH zcx_bizland_bp_datasrcsubs_exc INTO read_exception.
    ENDTRY.
    IF op_status = abap_false OR current_data IS INITIAL.
      failed-datasrcsubs = CORRESPONDING #( write_failed(
                                            entities_table = CORRESPONDING #(
                                                keys MAPPING
                                                  key = %key
                                                  ) ) MAPPING
                                                       %create = create
                                                       %delete = delete
                                                       %update = update
                                                       DataSourceId = datasourceid
                                                       %fail = fail
                                                       %key = key ).
    ENDIF.

  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Agent.
  ENDMETHOD.

  METHOD rba_Subscription.
  ENDMETHOD.

  METHOD cba_Agent.
  ENDMETHOD.

  METHOD cba_Subscription.
  ENDMETHOD.

  METHOD rba_Srcendpoint.
  ENDMETHOD.

  METHOD cba_Srcendpoint.
  ENDMETHOD.


  METHOD write_failed.

    DATA:
          failed_line LIKE LINE OF failed_objects.

    LOOP AT entities_table INTO DATA(ent).
      failed_line-cid = ent-cid.
      failed_line-key = ent-key.
      failed_line-datasourceid = ent-DataSourceId.
      failed_line-fail-cause = if_abap_behv=>cause-unspecific.
      failed_line-create = 'X'.
      APPEND failed_line TO failed_objects.
    ENDLOOP.

  ENDMETHOD.


  METHOD update_single.

    DATA:
      data_line_to_update   TYPE zbz_data_source,
      previous_data         TYPE STANDARD TABLE OF zbz_data_source,
      update_data           TYPE REF TO data,
      update_exception      TYPE REF TO zcx_bizland_bp_datasrcsubs_exc,
      unknown_exception     TYPE REF TO cx_root,
      entity                LIKE LINE OF entities_table,
      old_record            TYPE zbz_data_source,
      operation_status      TYPE abap_bool,
      updating_entity       TYPE zbz_data_source,
      struct_descriptor     TYPE REF TO cl_abap_structdescr,
      structural_components TYPE cl_abap_structdescr=>component_table.

    "we know for a fact that there is exactly 1 record
    entity = entities_table[ 1 ].
    return_status = zif_biz_sources_types=>ok_status.
    CREATE DATA update_data TYPE zbz_data_source.
    TRY.
        "select existing data first
        operation_status = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao( )->execute_select(
          EXPORTING
            tabname = zif_biz_sources_constants=>zbz_data_source
            where_cond = VALUE #( (
                                      key_field = zif_biz_sources_constants=>data_source_id
                                      operator = zif_biz_sources_constants=>equals
                                      key_condition_value = entity-key-datasourceid ) )
          IMPORTING
            result_set = previous_data
        ).
      CATCH zcx_bizland_bp_datasrcsubs_exc INTO update_exception.
        return_status = zif_biz_sources_types=>exception_in_select.
        RETURN.
      CATCH cx_root INTO unknown_exception.
        return_status = zif_biz_sources_types=>unknown_exception.
        RETURN.
    ENDTRY.
    IF operation_status = abap_false.
      return_status = zif_biz_sources_types=>error_in_select.
      RETURN.
    ENDIF.

    return_status = zif_biz_sources_types=>too_many_lines.
    CHECK lines( previous_data ) = zif_biz_sources_constants=>single_line.
    return_status = zif_biz_sources_types=>ok_status.

    MOVE-CORRESPONDING previous_data[ 1 ] TO data_line_to_update.

    TRY.
        struct_descriptor ?= cl_abap_typedescr=>describe_by_data( updating_entity ).
      CATCH cx_sy_move_cast_error.
        return_status = zif_biz_sources_types=>casting_exception.
        RETURN.
    ENDTRY.
    structural_components = struct_descriptor->get_components( ).

    updating_entity = CORRESPONDING #( entity MAPPING
                                          description_text = descriptiontext
                                          discovery_timestamp = discoverytimestamp
                                          source_url = sourceurl
                                     ).
    updating_entity-data_source_id = entity-key-datasourceid.

    LOOP AT structural_components INTO DATA(component).

      ASSIGN COMPONENT component-name OF STRUCTURE updating_entity TO FIELD-SYMBOL(<fs_updating_entity_comp>).
      ASSIGN COMPONENT component-name OF STRUCTURE data_line_to_update TO FIELD-SYMBOL(<fs_data_line_comp>).

      IF <fs_updating_entity_comp> <> <fs_data_line_comp> AND <fs_updating_entity_comp> IS NOT INITIAL.
        <fs_data_line_comp> = <fs_updating_entity_comp>.
      ENDIF.

    ENDLOOP.

    GET TIME STAMP FIELD data_line_to_update-last_changed_at.
    data_line_to_update-last_changed_by = sy-uname.
    IF data_line_to_update-local_last_changed_at IS INITIAL.
      data_line_to_update-local_last_changed_at = data_line_to_update-last_changed_at.
    ENDIF.

    update_data->* = data_line_to_update.
    TRY.
        operation_status = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao( )->execute_update_by_struct( tabname = zif_biz_sources_constants=>zbz_data_source
                                                                                                                data_to_update = update_data ).
      CATCH zcx_bizland_bp_datasrcsubs_exc INTO update_exception.
        return_status = zif_biz_sources_types=>exception_in_update.
        RETURN.
      CATCH cx_root INTO unknown_exception.
        return_status = zif_biz_sources_types=>unknown_exception.
        RETURN.
    ENDTRY.
    IF operation_status = abap_false.
      return_status = zif_biz_sources_types=>error_in_update.
      RETURN.
    ENDIF.
    CLEAR update_data->*.
    CLEAR data_line_to_update.

  ENDMETHOD.


  METHOD update_multiple.

    DATA:
      data_table_to_update TYPE STANDARD TABLE OF zbz_data_source,
      data_line_to_update  TYPE zbz_data_source,
      update_exception     TYPE REF TO zcx_bizland_bp_datasrcsubs_exc,
      unknown_exception    TYPE REF TO cx_root,
      where_condition      TYPE zif_biz_sources_types=>where_condition,
      where_condition_line LIKE LINE OF where_condition,
      iterator             TYPE i,
      operation_status     TYPE abap_bool,
      previous_data        TYPE STANDARD TABLE OF zbz_data_source.

    iterator = 1.
    LOOP AT entities_table INTO DATA(entity).

      IF iterator < lines( entities_table ) - 1.
        where_condition_line = VALUE #( key_field = zif_biz_sources_constants=>data_source_id
                                        operator = zif_biz_sources_constants=>equals
                                        key_condition_value = entity-key-datasourceid
                                        binding_operator = zif_biz_sources_constants=>operator_and ).
      ELSEIF iterator = lines( entities_table ).
        where_condition_line = VALUE #( key_field = zif_biz_sources_constants=>data_source_id
                                        operator = zif_biz_sources_constants=>equals
                                        key_condition_value = entity-key-datasourceid ).
      ENDIF.
      iterator += 1.
      CHECK where_condition_line IS NOT INITIAL.
      APPEND where_condition_line TO where_condition.

    ENDLOOP.

    TRY.
        "select existing data first
        operation_status = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao( )->execute_select(
          EXPORTING
            tabname = zif_biz_sources_constants=>zbz_data_source
            where_cond = where_condition
          IMPORTING
            result_set = previous_data
        ).
      CATCH zcx_bizland_bp_datasrcsubs_exc INTO update_exception.
        return_status = zif_biz_sources_types=>exception_in_select.
        RETURN.
      CATCH cx_root INTO unknown_exception.
        return_status = zif_biz_sources_types=>unknown_exception.
        RETURN.
    ENDTRY.
    IF operation_status = abap_false.
      return_status = zif_biz_sources_types=>error_in_select.
      RETURN.
    ENDIF.

    TRY.
        return_status = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao( )->execute_update_by_table( tabname = zif_biz_sources_constants=>zbz_data_source
          data_to_update = data_table_to_update ).
      CATCH zcx_bizland_bp_datasrcsubs_exc INTO update_exception.
        return_status = 1.
      CATCH cx_root INTO unknown_exception.
        return_status = 1.
    ENDTRY.

  ENDMETHOD.


  METHOD construct_where_cond_id.

    DATA:
          condition_line LIKE LINE OF where_cond.

    LOOP AT entities INTO DATA(entity).
      condition_line-key_field = zif_biz_sources_constants=>data_source_id.
      condition_line-operator = zif_biz_sources_constants=>equals.
      condition_line-key_condition_value = entity-key-datasourceid.
      condense condition_line-key_condition_value no-gaps.
      condition_line-binding_operator = zif_biz_sources_constants=>operator_and.
      APPEND condition_line TO where_cond.
    ENDLOOP.
    "makes no sense for the last condition to have a binding operator, that is syntactically incorrect
    where_cond[ lines( where_cond ) ]-binding_operator = abap_false.
  ENDMETHOD.
ENDCLASS.

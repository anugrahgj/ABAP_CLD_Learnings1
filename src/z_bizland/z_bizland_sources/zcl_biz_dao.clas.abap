CLASS zcl_biz_dao DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_bizland_sources_factory.

  PUBLIC SECTION.
    INTERFACES zif_biz_sources_types.
    INTERFACES zif_biz_dao.
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS check_where_condition_basic
      IMPORTING
                where_condition TYPE zif_biz_sources_types~where_condition
      RETURNING VALUE(is_valid) TYPE abap_bool.
    METHODS check_where_cond_w_struct
      IMPORTING
                where_condition TYPE zif_biz_sources_types~where_condition
                db_table_name   TYPE string
      RETURNING VALUE(is_valid) TYPE abap_bool.
    METHODS construct_where_cond
      IMPORTING
                where_condition               TYPE zif_biz_sources_types~where_condition
      RETURNING VALUE(where_condition_string) TYPE string.
    METHODS check_attributes_in_struct
      IMPORTING
                table_structure TYPE REF TO cl_abap_structdescr
                data_to_set     TYPE zif_biz_sources_types~generic_data_attributes
      RETURNING VALUE(is_valid) TYPE abap_bool.
    METHODS construct_set_string
      IMPORTING
                data_to_set       TYPE zif_biz_sources_types~generic_data_attributes
      RETURNING VALUE(set_string) TYPE string.
    METHODS initial_checks
      IMPORTING
                tabname         TYPE string
                operation       TYPE char8
      RETURNING VALUE(is_valid) TYPE abap_bool
      RAISING   zcx_bizland_dao_exception.
    METHODS structural_checks_given_table
      IMPORTING
                tabname         TYPE string
                operation       TYPE char8
                data_table      TYPE STANDARD TABLE
      RETURNING VALUE(is_valid) TYPE abap_bool
      RAISING   zcx_bizland_dao_exception.
    METHODS structural_checks_given_struct
      IMPORTING
                tabname         TYPE string
                operation       TYPE char8
                data_structure  TYPE REF TO data
      RETURNING VALUE(is_valid) TYPE abap_bool
      RAISING   zcx_bizland_dao_exception.
    METHODS check_order_by
      IMPORTING
                order_by        TYPE char128
      RETURNING VALUE(is_valid) TYPE abap_bool.
ENDCLASS.



CLASS zcl_biz_dao IMPLEMENTATION.


  METHOD zif_biz_dao~execute_insert.

    operation_ok = abap_false.
    TRY.
        CHECK initial_checks( tabname = tabname operation = zif_biz_dao=>zif_biz_sources_constants~insert_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(initial_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_create
            previous   = initial_checks_exception
            short_text = initial_checks_exception->get_text( ).
    ENDTRY.
    TRY.
        CHECK structural_checks_given_table( tabname = tabname data_table = data_to_insert operation = zif_biz_dao=>zif_biz_sources_constants~insert_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(structural_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_create
            previous   = structural_checks_exception
            short_text = structural_checks_exception->get_text( ).
    ENDTRY.

    TRY.
        INSERT (tabname) FROM TABLE @data_to_insert.
      CATCH BEFORE UNWIND cx_root INTO DATA(insert_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_create
            previous   = insert_exception
            short_text = insert_exception->get_text( ).
    ENDTRY.
    CHECK sy-subrc IS INITIAL.
    operation_ok = abap_true.

  ENDMETHOD.


  METHOD zif_biz_dao~execute_delete.

    DATA:
      where_condition_string TYPE string.

    operation_ok = abap_false.
    TRY.
        CHECK initial_checks( tabname = tabname operation = zif_biz_dao=>zif_biz_sources_constants~delete_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(initial_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_create
            previous   = initial_checks_exception
            short_text = initial_checks_exception->get_text( ).
    ENDTRY.

    CHECK where_cond IS NOT INITIAL.
    CHECK check_where_condition_basic( where_cond ) = abap_true.
    CHECK check_where_cond_w_struct( db_table_name = tabname where_condition = where_cond ) = abap_true.
    where_condition_string = construct_where_cond( where_cond ).

    DELETE FROM (tabname) WHERE (where_condition_string).
    CHECK sy-subrc IS INITIAL.
    operation_ok = abap_true.

  ENDMETHOD.


  METHOD zif_biz_dao~execute_select.

    DATA:
      where_condition_string TYPE string.

    operation_ok = abap_false.
    TRY.
        CHECK initial_checks( tabname = tabname operation = zif_biz_dao=>zif_biz_sources_constants~select_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(initial_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_create
            previous   = initial_checks_exception
            short_text = initial_checks_exception->get_text( ).
    ENDTRY.

    IF order_by IS NOT INITIAL.
      CHECK check_order_by( order_by ) = abap_true.
    ENDIF.
    IF where_cond IS NOT INITIAL.
      CHECK check_where_condition_basic( where_cond ) = abap_true.
      CHECK check_where_cond_w_struct( db_table_name = tabname where_condition = where_cond ) = abap_true.
      where_condition_string = construct_where_cond( where_cond ).
    ENDIF.

    IF where_condition_string IS NOT INITIAL.
      SELECT * FROM (tabname)
        WHERE (where_condition_string) INTO TABLE @result_set.
    ELSE.
      SELECT * FROM (tabname) INTO TABLE @result_set.
    ENDIF.
    CHECK sy-subrc IS INITIAL.
    operation_ok = abap_true.

  ENDMETHOD.


  METHOD zif_biz_dao~execute_update_by_table.
    DATA:
          db_table_to_update TYPE string.

    operation_ok = abap_false.
    TRY.
        CHECK initial_checks( tabname = tabname operation = zif_biz_dao=>zif_biz_sources_constants~update_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(initial_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_create
            previous   = initial_checks_exception
            short_text = initial_checks_exception->get_text( ).
    ENDTRY.
    TRY.
        CHECK structural_checks_given_table( tabname = tabname data_table = data_to_update operation = zif_biz_dao=>zif_biz_sources_constants~update_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(structural_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_update
            previous   = structural_checks_exception
            short_text = structural_checks_exception->get_text( ).
    ENDTRY.

    db_table_to_update = tabname.
    db_table_to_update = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao_util( )->get_db_table_name( supported_table =
                            zcl_bizland_sources_factory=>get_instance( )->get_biz_dao_util( )->determine_db_table( db_table_to_update ) ).

    "the update itself
    UPDATE (db_table_to_update) FROM TABLE @data_to_update.
    CHECK sy-subrc IS INITIAL.
    operation_ok = abap_true.

  ENDMETHOD.


  METHOD zif_biz_dao~execute_update_by_struct.

    DATA:
      db_table_to_update     TYPE string.

    operation_ok = abap_false.
    TRY.
        CHECK initial_checks( tabname = tabname operation = zif_biz_dao=>zif_biz_sources_constants~update_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(initial_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_create
            previous   = initial_checks_exception
            short_text = initial_checks_exception->get_text( ).
    ENDTRY.
    TRY.
        CHECK structural_checks_given_struct( tabname = tabname data_structure = data_to_update operation = zif_biz_dao=>zif_biz_sources_constants~update_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(structural_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_create
            previous   = structural_checks_exception
            short_text = structural_checks_exception->get_text( ).
    ENDTRY.

    db_table_to_update = tabname.
    db_table_to_update = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao_util( )->get_db_table_name( supported_table =
                            zcl_bizland_sources_factory=>get_instance( )->get_biz_dao_util( )->determine_db_table( db_table_to_update ) ).

    "finally do update
    UPDATE (db_table_to_update) FROM @data_to_update->*.
    CHECK sy-subrc IS INITIAL.
    operation_ok = abap_true.

  ENDMETHOD.


  METHOD zif_biz_dao~execute_update_by_condition.

    DATA:
      where_condition_string TYPE string,
      set_string             TYPE string,
      db_table_to_update     TYPE string..

    operation_ok = abap_false.
    TRY.
        CHECK initial_checks( tabname = tabname operation = zif_biz_dao=>zif_biz_sources_constants~update_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(initial_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_create
            previous   = initial_checks_exception
            short_text = initial_checks_exception->get_text( ).
    ENDTRY.
    TRY.
        CHECK structural_checks_given_table( tabname = tabname data_table = data_to_update operation = zif_biz_dao=>zif_biz_sources_constants~update_op ) = abap_true.
      CATCH zcx_bizland_dao_exception INTO DATA(structural_checks_exception).
        RAISE EXCEPTION TYPE zcx_bizland_bp_datasrcsubs_exc
          EXPORTING
            textid     = zif_bizland_bp_datasrcsubs_exc=>zcx_biz_error_behav_update
            previous   = structural_checks_exception
            short_text = structural_checks_exception->get_text( ).
    ENDTRY.

    IF where_cond IS NOT INITIAL.
      CHECK check_where_condition_basic( where_cond ) = abap_true.
      CHECK check_where_cond_w_struct( db_table_name = tabname where_condition = where_cond ) = abap_true.
      where_condition_string = construct_where_cond( where_cond ).
    ENDIF.

    set_string = construct_set_string( data_to_set = data_to_update ).
    db_table_to_update = tabname.
    db_table_to_update = zcl_bizland_sources_factory=>get_instance( )->get_biz_dao_util( )->get_db_table_name( supported_table =
                            zcl_bizland_sources_factory=>get_instance( )->get_biz_dao_util( )->determine_db_table( db_table_to_update ) ).

    "update can be either with or without condition
    IF where_condition_string IS NOT INITIAL.
      UPDATE (db_table_to_update)
       SET (set_string)
      WHERE (where_condition_string).
    ELSE.
      UPDATE (db_table_to_update)
       SET (set_string).
    ENDIF.
    CHECK sy-subrc IS INITIAL.
    operation_ok = abap_true.

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

    CONDENSE tmp_cond_string.
    where_condition_string = tmp_cond_string.

  ENDMETHOD.


  METHOD check_attributes_in_struct.

    DATA:
      components_to_compare_to TYPE cl_abap_structdescr=>component_table,
      attribute_name           TYPE string.
    is_valid = abap_false.
    components_to_compare_to = table_structure->get_components( ).
    LOOP AT data_to_set INTO DATA(attr).
      TRANSLATE attr-attribute TO UPPER CASE.
      IF NOT line_exists( components_to_compare_to[ name = attr-attribute ] ).
        RETURN.
      ENDIF.
    ENDLOOP.
    is_valid = abap_true.

  ENDMETHOD.


  METHOD construct_set_string.

    set_string = ''.
    LOOP AT data_to_set INTO DATA(attr).
      set_string = |{ set_string }{ attr-attribute } = { attr-value } |.
    ENDLOOP.
    CONDENSE set_string.

  ENDMETHOD.


  METHOD initial_checks.

    DATA:
          table_name_descr       TYPE REF TO cl_abap_typedescr.

    is_valid = abap_false.
    "initial checks
    cl_abap_datadescr=>describe_by_name(
      EXPORTING
        p_name = tabname
      EXCEPTIONS
        type_not_found = 1
    ).

    IF sy-subrc IS NOT INITIAL.
      RAISE EXCEPTION TYPE zcx_bizland_dao_exception
        EXPORTING
          textid = zif_bizland_dao_exception=>zcx_biz_error_initial_checks
          opcode = operation.
    ENDIF.

    table_name_descr = cl_abap_datadescr=>describe_by_name( tabname ).

    CHECK table_name_descr->kind = cl_abap_datadescr=>kind_struct.
    CHECK table_name_descr->is_ddic_type( ) = abap_true.
    CHECK zcl_bizland_sources_factory=>get_instance( )->get_biz_dao_util( )->determine_db_table( table_name_descr->get_relative_name( ) ) IS NOT INITIAL.
    is_valid = abap_true.

  ENDMETHOD.


  METHOD structural_checks_given_table.

    DATA:
      table_data         TYPE REF TO cl_abap_typedescr,
      table_struct_descr TYPE REF TO cl_abap_structdescr,
      table_descriptor   TYPE REF TO cl_abap_tabledescr,
      table_line_type    TYPE REF TO cl_abap_structdescr.

    is_valid = abap_false.
    table_struct_descr ?= cl_abap_typedescr=>describe_by_name( tabname ).

    table_data = cl_abap_typedescr=>describe_by_data( data_table ).
    CHECK table_data->kind = cl_abap_typedescr=>kind_table.

    TRY.
        "obtains the descriptor for table and then a descriptor for table's line
        table_descriptor ?= cl_abap_typedescr=>describe_by_data( data_table ).
        table_line_type ?= table_descriptor->get_table_line_type( ).
      CATCH cx_sy_move_cast_error INTO DATA(cast_exception).
        RAISE EXCEPTION TYPE zcx_bizland_dao_exception
          EXPORTING
            textid   = zif_bizland_dao_exception=>zcx_biz_error_struct_checks
            previous = cast_exception
            opcode   = operation.
    ENDTRY.

    "checks that structure of data is valid
    CHECK table_line_type IS NOT INITIAL.
    CHECK table_line_type = table_struct_descr.
    CHECK table_descriptor->kind = cl_abap_typedescr=>kind_table.
    "CHECK check_attributes_in_struct( table_structure = table_struct_descr data_to_set = data_table ) = abap_true.

    is_valid = abap_true.

  ENDMETHOD.


  METHOD structural_checks_given_struct.

    DATA:
      table_name_descr         TYPE REF TO cl_abap_typedescr,
      table_data               TYPE REF TO cl_abap_typedescr,
      table_struct_descr       TYPE REF TO cl_abap_structdescr,
      structural_descr_of_data TYPE REF TO cl_abap_structdescr.

    is_valid = abap_false.
    table_name_descr = cl_abap_datadescr=>describe_by_name( tabname ).

    TRY.
        "this is needed to make sure the structural components are of the right type
        table_struct_descr ?= cl_abap_typedescr=>describe_by_name( tabname ).
        structural_descr_of_data ?= cl_abap_typedescr=>describe_by_data( data_structure->* ).
      CATCH cx_sy_move_cast_error INTO DATA(cast_exception).
        RAISE EXCEPTION TYPE zcx_bizland_dao_exception
          EXPORTING
            textid   = zif_bizland_dao_exception=>zcx_biz_error_struct_checks
            previous = cast_exception
            opcode   = operation.
    ENDTRY.
    CHECK structural_descr_of_data IS NOT INITIAL.
    CHECK structural_descr_of_data = table_struct_descr.
    CHECK structural_descr_of_data->kind = cl_abap_typedescr=>kind_struct.

    is_valid = abap_true.

  ENDMETHOD.


  METHOD check_order_by.

    DATA:
          inp TYPE string.
    is_valid = abap_false.
    inp = order_by.
    TRANSLATE inp TO UPPER CASE.
    IF inp CP 'ASC' OR inp CP 'DESC'.
      is_valid = abap_true.
    ENDIF.

  ENDMETHOD.
ENDCLASS.

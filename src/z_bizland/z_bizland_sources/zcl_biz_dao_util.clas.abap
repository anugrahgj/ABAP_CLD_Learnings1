CLASS zcl_biz_dao_util DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_bizland_sources_factory .

  PUBLIC SECTION.

    INTERFACES zif_biz_dao_util .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_biz_dao_util IMPLEMENTATION.

  METHOD zif_biz_dao_util~get_cds_field_name_from_db_str.

    DATA:
      db_table_structure_descr TYPE REF TO cl_abap_structdescr,
      db_table_components      TYPE  cl_abap_structdescr=>component_table,
      cds_view_structure_descr TYPE REF TO cl_abap_structdescr,
      cds_view_components      TYPE cl_abap_structdescr=>component_table,
      field_name_parts         TYPE STANDARD TABLE OF string WITH EMPTY KEY,
      iterator                 TYPE i,
      db_table                 TYPE string,
      cds_view                 TYPE string,
      db_table_field           TYPE string.

    db_table = tabname.
    cds_view = cds_view_name.
    db_table_field = db_structure_field.
    TRANSLATE db_table TO UPPER CASE.
    TRANSLATE cds_view TO UPPER CASE.
    TRANSLATE db_table_field TO UPPER CASE.

    IF zif_biz_dao_util~determine_db_table( tabname = db_table ) IS NOT INITIAL AND zif_biz_dao_util~determine_cds_view( cds_view_name = cds_view ) IS NOT INITIAL.
      TRY.
          db_table_structure_descr ?= cl_abap_typedescr=>describe_by_name( db_table ).
        CATCH cx_sy_move_cast_error INTO DATA(cast_error_table).
          RAISE EXCEPTION TYPE zcx_bizland_dao_util_exception
            EXPORTING
              objname  = tabname
              previous = cast_error_table
              textid   = zif_bizland_dao_util_exception=>zcx_biz_error_db_table_name.
      ENDTRY.
      TRY.
          cds_view_structure_descr ?= cl_abap_typedescr=>describe_by_name( cds_view ).
        CATCH cx_sy_move_cast_error INTO DATA(cast_error_cds).
          RAISE EXCEPTION TYPE zcx_bizland_dao_util_exception
            EXPORTING
              objname  = cds_view_name
              textid   = zif_bizland_dao_util_exception=>zcx_biz_error_cds_view_name
              previous = cast_error_cds.
      ENDTRY.
      db_table_components = db_table_structure_descr->get_components( ).
      cds_view_components = cds_view_structure_descr->get_components( ).

      IF line_exists( db_table_components[ name = db_table_field ] ).
        SPLIT db_table_components[ name = db_table_field ]-name AT '_' INTO TABLE field_name_parts.
        LOOP AT cds_view_components INTO DATA(cds_component).
          iterator = 1.
          WHILE iterator <= lines( field_name_parts ).
            FIND REGEX |{ field_name_parts[ iterator ] }| IN cds_component-name.
            IF sy-subrc <> 0.
              iterator = -1.
              EXIT.
            ENDIF.
            iterator += 1.
          ENDWHILE.
          "it was found
          IF iterator >= lines( field_name_parts ).
            cds_structure_field = cds_component-name.
            RETURN.
          ENDIF.
        ENDLOOP.
        "if we are here it means it wasn't found cds label could be different or it's simply not there
        RAISE EXCEPTION TYPE zcx_bizland_dao_util_exception
          EXPORTING
            component_name = db_table_field
            textid         = zif_bizland_dao_util_exception=>zcx_biz_error_component_nf.
      ELSE.
        RAISE EXCEPTION TYPE zcx_bizland_dao_util_exception
          EXPORTING
            component_name = db_table_field
            textid         = zif_bizland_dao_util_exception=>zcx_biz_error_db_component.
      ENDIF.

    ELSE.
      RAISE EXCEPTION TYPE zcx_bizland_dao_util_exception
        EXPORTING
          textid = zif_bizland_dao_util_exception=>zcx_biz_error_unkwn_table.
    ENDIF.

  ENDMETHOD.


  METHOD zif_biz_dao_util~determine_db_table.

    CASE tabname.
      WHEN zif_biz_dao=>zif_biz_sources_constants~zbiz_agent.
        db_table_index = zif_biz_sources_types~zbiz_agent.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~zpf_agent_prps.
        db_table_index  = zif_biz_sources_types~zpf_agent_prps.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~zbz_data_source.
        db_table_index = zif_biz_sources_types~zbz_data_source.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~zpf_data_src_sub.
        db_table_index = zif_biz_sources_types~zpf_data_src_sub.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~zpf_dt_src_agent.
        db_table_index = zif_biz_sources_types~zpf_dt_src_agent.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~zpf_prog_lang.
        db_table_index = zif_biz_sources_types~zpf_prog_lang.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~zpf_src_endpoint.
        db_table_index = zif_biz_sources_types~zpf_src_endpoint.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~zbz_subscription.
        db_table_index = zif_biz_sources_types~zbz_subscription.
        RETURN.
      WHEN OTHERS.
        RETURN.
    ENDCASE.

  ENDMETHOD.


  METHOD zif_biz_dao_util~get_db_table_name.

    CASE supported_table.
      WHEN zif_biz_sources_types~zbiz_agent.
        table_name = zif_biz_dao=>zif_biz_sources_constants~zbiz_agent.
        RETURN.
      WHEN zif_biz_sources_types~zpf_agent_prps.
        table_name = zif_biz_dao=>zif_biz_sources_constants~zpf_agent_prps.
        RETURN.
      WHEN zif_biz_sources_types~zbz_data_source.
        table_name = zif_biz_dao=>zif_biz_sources_constants~zbz_data_source.
        RETURN.
      WHEN zif_biz_sources_types~zpf_data_src_sub.
        table_name = zif_biz_dao=>zif_biz_sources_constants~zpf_data_src_sub.
        RETURN.
      WHEN zif_biz_sources_types~zpf_dt_src_agent.
        table_name = zif_biz_dao=>zif_biz_sources_constants~zpf_dt_src_agent.
        RETURN.
      WHEN zif_biz_sources_types~zpf_prog_lang.
        table_name = zif_biz_dao=>zif_biz_sources_constants~zpf_prog_lang.
        RETURN.
      WHEN zif_biz_sources_types~zpf_src_endpoint.
        table_name = zif_biz_dao=>zif_biz_sources_constants~zpf_src_endpoint.
        RETURN.
      WHEN zif_biz_sources_types~zbz_subscription.
        table_name = zif_biz_dao=>zif_biz_sources_constants~zbz_subscription.
        RETURN.
      WHEN OTHERS.
        RETURN.
    ENDCASE.

  ENDMETHOD.

  METHOD zif_biz_dao_util~determine_cds_view.

    CASE cds_view_name.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_c_agent.
        cds_view_index = zif_biz_sources_types~z_c_agent.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_c_datasrcssubs.
        cds_view_index = zif_biz_sources_types~z_c_datasrcssubs.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_c_endpoints.
        cds_view_index = zif_biz_sources_types~z_c_endpoints.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_c_subscription.
        cds_view_index = zif_biz_sources_types~z_c_subscription.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_i_agent.
        cds_view_index = zif_biz_sources_types~z_i_agent.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_i_agent_purpose.
        cds_view_index = zif_biz_sources_types~z_i_agent_purpose.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_i_datasrcssubs.
        cds_view_index = zif_biz_sources_types~z_i_datasrcssubs.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_i_prog_lang.
        cds_view_index = zif_biz_sources_types~z_i_prog_lang.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_i_srcendpoint.
        cds_view_index = zif_biz_sources_types~z_i_srcendpoint.
        RETURN.
      WHEN zif_biz_dao=>zif_biz_sources_constants~z_i_subscription.
        cds_view_index = zif_biz_sources_types~z_i_subscription.
        RETURN.
      WHEN OTHERS.
        RETURN.
    ENDCASE.

  ENDMETHOD.

  METHOD zif_biz_dao_util~get_cds_view_name.


    CASE supported_view.
      WHEN zif_biz_sources_types~z_c_agent.
        view_name = zif_biz_dao=>zif_biz_sources_constants~z_c_agent.
        RETURN.
      WHEN zif_biz_sources_types~z_c_datasrcssubs.
        view_name = zif_biz_dao=>zif_biz_sources_constants~z_c_datasrcssubs.
        RETURN.
      WHEN zif_biz_sources_types~z_c_endpoints.
        view_name = zif_biz_dao=>zif_biz_sources_constants~z_c_endpoints.
        RETURN.
      WHEN zif_biz_sources_types~z_i_agent.
        view_name = zif_biz_dao=>zif_biz_sources_constants~z_i_agent.
        RETURN.
      WHEN zif_biz_sources_types~z_i_agent_purpose.
        view_name = zif_biz_dao=>zif_biz_sources_constants~z_i_agent_purpose.
        RETURN.
      WHEN zif_biz_sources_types~z_i_datasrcssubs.
        view_name = zif_biz_dao=>zif_biz_sources_constants~z_i_datasrcssubs.
        RETURN.
      WHEN zif_biz_sources_types~z_i_prog_lang.
        view_name = zif_biz_dao=>zif_biz_sources_constants~z_i_prog_lang.
        RETURN.
      WHEN zif_biz_sources_types~z_i_srcendpoint.
        view_name = zif_biz_dao=>zif_biz_sources_constants~z_i_srcendpoint.
        RETURN.
      WHEN zif_biz_sources_types~z_i_subscription.
        view_name = zif_biz_dao=>zif_biz_sources_constants~z_i_subscription.
        RETURN.
      WHEN OTHERS.
        RETURN.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.

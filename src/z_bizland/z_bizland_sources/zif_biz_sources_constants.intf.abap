INTERFACE zif_biz_sources_constants
  PUBLIC .

  "db_tables
  CONSTANTS:
    zpf_agent_prps   TYPE string VALUE 'ZPF_AGENT_PRPS',
    zbiz_agent       TYPE string VALUE 'ZBIZ_AGENT',
    zbz_data_source  TYPE string VALUE 'ZBZ_DATA_SOURCE',
    zpf_data_src_sub TYPE string VALUE 'ZPF_DATA_SRC_SUB',
    zpf_dt_src_agent TYPE string VALUE 'ZPF_DT_SRC_AGENT',
    zpf_prog_lang    TYPE string VALUE 'ZPF_PROG_LANG',
    zpf_src_endpoint TYPE string VALUE 'ZPF_SRC_ENDPOINT',
    zbz_subscription TYPE string VALUE 'ZBZ_SUBSCRIPTION'.

  "db table keys
  CONSTANTS:
    data_source_id       TYPE string VALUE 'DATA_SOURCE_ID',
    agent_id             TYPE string VALUE 'AGENT_ID',
    subscription_id      TYPE string VALUE 'SUBSCRIPTION_ID',
    purpose_id           TYPE string VALUE 'PURPOSE_ID',
    data_src_sub_id      TYPE string VALUE 'RECORD_ID',
    data_source_agent_id TYPE string VALUE 'DATA_SOURCE_AGENT_ID',
    prog_lang_id         TYPE string VALUE 'PROGRAMMING_LANGUAGE_ID',
    endpoint_id          TYPE string value 'ENDPOINT_ID'.

  "CDS views
  CONSTANTS:
    z_c_agent         TYPE string VALUE 'Z_C_AGENT',
    z_c_datasrcssubs  TYPE string VALUE 'Z_C_DATASRCSSUBS',
    z_c_endpoints     TYPE string VALUE 'Z_C_ENDPOINTS',
    z_c_subscription  TYPE string VALUE 'Z_C_SUBSCRIPTION',
    z_i_agent_purpose TYPE string VALUE 'Z_I_AGENT_PURPOSE',
    z_i_agent         TYPE string VALUE 'Z_I_AGENT',
    z_i_datasrcssubs  TYPE string VALUE 'Z_I_DATASRCSSUBS',
    z_i_prog_lang     TYPE string VALUE 'Z_I_PROG_LANG',
    z_i_srcendpoint   TYPE string VALUE 'Z_I_SRCENDPOINT',
    z_i_subscription  TYPE string VALUE 'Z_I_SUBSCRIPTION'.

  "operations constants
  CONSTANTS:
    select_op TYPE char8 VALUE 'select',
    update_op TYPE char8 VALUE 'update',
    insert_op TYPE char8 VALUE 'insert',
    delete_op TYPE char8 VALUE 'delete'.

  "general constants
  CONSTANTS:
    equals                TYPE char1 VALUE '=',
    not_equals            TYPE char2 VALUE '<>',
    asc                   TYPE char16 VALUE 'ascending',
    desc                  TYPE char16 VALUE 'descending',
    operator_and          TYPE char4 VALUE 'AND',
    operator_or           TYPE char4 VALUE 'OR',
    common_name_separator TYPE char1 VALUE '_',
    single_line           TYPE i VALUE 1.


ENDINTERFACE.

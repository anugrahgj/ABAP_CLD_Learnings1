INTERFACE zif_data_generator
  PUBLIC .
  INTERFACES zif_biz_sources_types.
  CONSTANTS:
    zpf_agent_prps   TYPE char16 VALUE 'ZPF_AGENT_PRPS',
    zbiz_agent       TYPE char16 VALUE 'ZBIZ_AGENT',
    zbz_data_source  TYPE char16 VALUE 'ZBZ_DATA_SOURCE',
    zpf_data_src_sub TYPE char16 VALUE 'ZPF_DATA_SRC_SUB',
    zpf_dt_src_agent TYPE char16 VALUE 'ZPF_DT_SRC_AGENT',
    zpf_prog_lang    TYPE char16 VALUE 'ZPF_PROG_LANG',
    zpf_src_endpoint TYPE char16 VALUE 'ZPF_SRC_ENDPOINT',
    zbz_subscription TYPE char16 VALUE 'ZBZ_SUBSCRIPTION'.

  METHODS create_basic_sources_data.
  METHODS update_basic_sources_data
    IMPORTING
      db_table_to_update      TYPE char16
      db_table_key_cond       TYPE zif_biz_sources_types~where_condition OPTIONAL
      db_table_data_to_update TYPE table
      data_struct type data optional.
  METHODS create_basic_agent_data.
ENDINTERFACE.

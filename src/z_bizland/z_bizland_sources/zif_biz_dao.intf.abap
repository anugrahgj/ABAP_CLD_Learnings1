INTERFACE zif_biz_dao
  PUBLIC .

  INTERFACES zif_biz_sources_types .
interfaces zif_biz_sources_constants.
  METHODS execute_select
    IMPORTING
              tabname             TYPE string
              where_cond          TYPE zif_biz_sources_types~where_condition OPTIONAL
              order_by            TYPE char128 OPTIONAL
    EXPORTING
              result_set          TYPE STANDARD TABLE
    RETURNING VALUE(operation_ok) TYPE abap_bool
    RAISING   zcx_bizland_bp_datasrcsubs_exc.

  METHODS execute_update_by_table
    IMPORTING
              tabname             TYPE string
              data_to_update      TYPE STANDARD TABLE
    RETURNING VALUE(operation_ok) TYPE abap_bool
    RAISING   zcx_bizland_bp_datasrcsubs_exc.

  METHODS execute_update_by_struct
    IMPORTING
              tabname             TYPE string
              data_to_update      TYPE REF TO data
    RETURNING VALUE(operation_ok) TYPE abap_bool
    RAISING   zcx_bizland_bp_datasrcsubs_exc.

  METHODS execute_update_by_condition
    IMPORTING
              tabname             TYPE string
              data_to_update      TYPE zif_biz_sources_types~generic_data_attributes
              where_cond          TYPE zif_biz_sources_types~where_condition
    RETURNING VALUE(operation_ok) TYPE abap_bool
    RAISING   zcx_bizland_bp_datasrcsubs_exc.

  METHODS execute_delete
    IMPORTING
              tabname             TYPE string
              where_cond          TYPE zif_biz_sources_types~where_condition
    RETURNING VALUE(operation_ok) TYPE abap_bool
    RAISING   zcx_bizland_bp_datasrcsubs_exc.

  METHODS execute_insert
    IMPORTING
              tabname             TYPE string
              data_to_insert      TYPE STANDARD TABLE
    RETURNING VALUE(operation_ok) TYPE abap_bool
    RAISING   zcx_bizland_bp_datasrcsubs_exc.
ENDINTERFACE.

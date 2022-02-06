INTERFACE zif_biz_dao_util
  PUBLIC .

  INTERFACES zif_biz_sources_constants.
  INTERFACES zif_biz_sources_types.

  "take field of DB table and determine the CDSs field
  "this only works if we assume that cds fields are at least somewhat relatable to those of DB
  METHODS get_cds_field_name_from_db_str
    IMPORTING
              tabname                    TYPE string
              db_structure_field         TYPE string
              cds_view_name              TYPE string
    RETURNING VALUE(cds_structure_field) TYPE string
    RAISING   zcx_bizland_dao_util_exception.

  METHODS determine_db_table
    IMPORTING tabname               TYPE string
    RETURNING VALUE(db_table_index) TYPE zif_biz_sources_types=>supported_tables.

  METHODS get_db_table_name
    IMPORTING supported_table   TYPE zif_biz_sources_types=>supported_tables
    RETURNING VALUE(table_name) TYPE string.

  METHODS determine_cds_view
    IMPORTING
              cds_view_name         TYPE string
    RETURNING VALUE(cds_view_index) TYPE zif_biz_sources_types=>supported_views.

  METHODS get_cds_view_name
    IMPORTING supported_view   TYPE zif_biz_sources_types=>supported_views
    RETURNING VALUE(view_name) TYPE string.

ENDINTERFACE.

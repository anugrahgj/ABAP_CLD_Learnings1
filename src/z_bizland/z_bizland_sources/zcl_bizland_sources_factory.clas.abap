CLASS zcl_bizland_sources_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS get_instance
      RETURNING VALUE(inst) TYPE REF TO zcl_bizland_sources_factory.

    METHODS get_biz_dao
      RETURNING VALUE(biz_dao_inst) TYPE REF TO zif_biz_dao.
    METHODS get_biz_dao_util
      RETURNING VALUE(biz_dao_util_inst) TYPE REF TO zif_biz_dao_util.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA:
      biz_dao_instance      TYPE REF TO zif_biz_dao,
      instance              TYPE REF TO zcl_bizland_sources_factory,
      biz_dao_util_instance TYPE REF TO zif_biz_dao_util.
ENDCLASS.



CLASS zcl_bizland_sources_factory IMPLEMENTATION.

  METHOD get_biz_dao.
    IF biz_dao_instance IS INITIAL.
      biz_dao_instance = NEW zcl_biz_dao( ).
    ENDIF.
    biz_dao_inst = biz_dao_instance.
  ENDMETHOD.

  METHOD get_biz_dao_util.
    IF biz_dao_util_instance IS INITIAL.
      biz_dao_util_instance = NEW zcl_biz_dao_util( ).
    ENDIF.
    biz_dao_util_inst = biz_dao_util_instance.
  ENDMETHOD.

  METHOD get_instance.
    IF instance IS INITIAL.
      instance = NEW zcl_bizland_sources_factory( ).
    ENDIF.
    inst ?= instance.
  ENDMETHOD.

ENDCLASS.

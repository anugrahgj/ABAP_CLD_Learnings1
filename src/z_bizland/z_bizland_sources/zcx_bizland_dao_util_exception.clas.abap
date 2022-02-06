CLASS zcx_bizland_dao_util_exception DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_bizland_dao_util_exception .
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    METHODS constructor
      IMPORTING
        !textid         LIKE if_t100_message=>t100key OPTIONAL
        !previous       LIKE previous OPTIONAL
        !objname        TYPE string OPTIONAL
        !component_name TYPE string OPTIONAL
        !cds_view       TYPE string OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_bizland_dao_util_exception IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    zif_bizland_dao_util_exception~objname = objname.
    zif_bizland_dao_util_exception~component_name = component_name.
    zif_bizland_dao_util_exception~cds_view = cds_view.

    IF textid IS NOT INITIAL.
      if_t100_message~t100key = textid.
    ELSE.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

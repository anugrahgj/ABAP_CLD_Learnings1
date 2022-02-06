CLASS zcx_bizland_dao_exception DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .
    INTERFACES zif_bizland_dao_exception .

    METHODS constructor
      IMPORTING
        !textid      LIKE if_t100_message=>t100key OPTIONAL
        !previous    LIKE previous OPTIONAL
        !opcode type char8.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_bizland_dao_exception IMPLEMENTATION.

  method constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    me->zif_bizland_dao_exception~opcode = opcode.

    IF textid IS NOT INITIAL.
      if_t100_message~t100key = textid.
    ELSE.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ENDIF.
  endmethod.

ENDCLASS.

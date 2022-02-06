CLASS zcx_bizland_bp_datasrcsubs_exc DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .
    INTERFACES zif_bizland_bp_datasrcsubs_exc .

    METHODS constructor
      IMPORTING
        !textid     LIKE if_t100_message=>t100key OPTIONAL
        !previous   LIKE previous OPTIONAL
        !short_text TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_bizland_bp_datasrcsubs_exc IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    zif_bizland_bp_datasrcsubs_exc~short_text = short_text.

    IF textid IS NOT INITIAL.
      if_t100_message~t100key = textid.
    ELSE.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

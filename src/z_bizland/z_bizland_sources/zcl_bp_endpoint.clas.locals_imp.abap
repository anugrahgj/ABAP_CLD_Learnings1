CLASS lhc_endpoints DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE endpoints.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE endpoints.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE endpoints.

    METHODS read FOR READ
      IMPORTING keys FOR READ endpoints RESULT result.

    METHODS rba_Datasrcssubs FOR READ
      IMPORTING keys_rba FOR READ endpoints\_Datasrcssubs FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_endpoints IMPLEMENTATION.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Datasrcssubs.
  ENDMETHOD.

ENDCLASS.

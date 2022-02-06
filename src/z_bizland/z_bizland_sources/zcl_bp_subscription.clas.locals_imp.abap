CLASS lhc_srcendpoint DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE srcendpoint.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE srcendpoint.

    METHODS read FOR READ
      IMPORTING keys FOR READ srcendpoint RESULT result.

    METHODS rba_Datasrcssubs FOR READ
      IMPORTING keys_rba FOR READ srcendpoint\_Datasrcssubs FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_srcendpoint IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Datasrcssubs.
  ENDMETHOD.

ENDCLASS.

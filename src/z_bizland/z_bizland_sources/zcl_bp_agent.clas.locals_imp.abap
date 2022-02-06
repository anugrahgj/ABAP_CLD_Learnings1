CLASS lhc_agent DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE agent.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE agent.

    METHODS read FOR READ
      IMPORTING keys FOR READ agent RESULT result.

    METHODS rba_Datasrcsubs FOR READ
      IMPORTING keys_rba FOR READ agent\_Datasrcsubs FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_agent IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Datasrcsubs.
  ENDMETHOD.

ENDCLASS.

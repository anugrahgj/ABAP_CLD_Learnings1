CLASS zcl_abap_cds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS get_instance
      returning value(ro_singleton) type ref to zcl_abap_cds.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA so_run TYPE REF TO zcl_abap_cds.
ENDCLASS.



CLASS zcl_abap_cds IMPLEMENTATION.
  METHOD get_instance.
    so_run = cond #( when so_run is bound then so_run else new zcl_abap_cds( ) ).
    ro_singleton = so_run.
  ENDMETHOD.

ENDCLASS.

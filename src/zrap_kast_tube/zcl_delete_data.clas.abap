CLASS zcl_delete_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS go_regex.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_delete_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
DATA: go_regex   TYPE REF TO cl_abap_regex,
      go_matcher TYPE REF TO cl_abap_matcher,
      go_match   TYPE c LENGTH 1,
      gv_msg     TYPE string,
      p_email     TYPE string VALUE 'yauheni.kastsiukou@leverx.com'.


CREATE OBJECT go_regex
    EXPORTING
      pattern     = '\w+(\.\w+)*@(\w+\.)+(\w{2,4})'
      ignore_case = abap_true.

      go_matcher = go_regex->create_matcher( text = p_email ).


      IF go_matcher->match( ) IS INITIAL.
    gv_msg = 'Email address is invalid'.
  ELSE.
    gv_msg = 'Email address is valid'.
  ENDIF.
  ENDMETHOD.


  METHOD go_regex.

DATA: go_regex   TYPE REF TO cl_abap_regex,
      go_matcher TYPE REF TO cl_abap_matcher,
      go_match   TYPE c LENGTH 1,
      gv_msg     TYPE string,
      p_email     TYPE string VALUE 'yauheni.kastsiukou@leverx.com'.


CREATE OBJECT go_regex
    EXPORTING
      pattern     = '\w+(\.\w+)*@(\w+\.)+(\w{2,4})'
      ignore_case = abap_true.

      go_matcher = go_regex->create_matcher( text = p_email ).


      IF go_matcher->match( ) IS INITIAL.
    gv_msg = 'Email address is invalid'.
  ELSE.
    gv_msg = 'Email address is valid'.
  ENDIF.

  ENDMETHOD.

ENDCLASS.

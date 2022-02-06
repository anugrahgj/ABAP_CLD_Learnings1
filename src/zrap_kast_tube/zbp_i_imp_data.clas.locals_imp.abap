CLASS lhc_impdata DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS calculateEmployeeID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR ImpData~calculateEmployeeID.

    METHODS validateEmail FOR VALIDATE ON SAVE
      IMPORTING keys FOR ImpData~validateEmail.

    METHODS validateAge FOR VALIDATE ON SAVE
      IMPORTING keys FOR ImpData~validateAge.

ENDCLASS.

CLASS lhc_impdata IMPLEMENTATION.

  METHOD calculateEmployeeID.

    DATA: update TYPE TABLE FOR UPDATE zi_ux_team\\ImpData.

    READ ENTITIES OF zi_ux_team IN LOCAL MODE
    ENTITY ImpData BY \_Team
      FIELDS ( Uuid )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    LOOP AT travels INTO DATA(travel).
      READ ENTITIES OF zi_ux_team IN LOCAL MODE
      ENTITY UXTeam BY \_ImpData
      FIELDS ( EmployeeId )
          WITH VALUE #( ( %tky = travel-%tky ) )
          RESULT DATA(res_emp_id).


      SELECT SINGLE
           FROM  zrap_emp_data1
           FIELDS MAX( employee_id ) AS EmployeeId
           INTO @DATA(max_employee_id).


      LOOP AT res_emp_id INTO DATA(str_res_emp_id).

        max_employee_id += 1.
        str_res_emp_id-EmployeeId = max_employee_id.

        APPEND VALUE #( %tky      = str_res_emp_id-%tky
                        EmployeeId = max_employee_id
                      ) TO update.
      ENDLOOP.
    ENDLOOP.


    MODIFY ENTITIES OF zi_ux_team IN LOCAL MODE
   ENTITY ImpData
     UPDATE FIELDS ( EmployeeId ) WITH update
   REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).

  ENDMETHOD.


  METHOD validateEmail.

    DATA: go_regex   TYPE REF TO cl_abap_regex,
          go_matcher TYPE REF TO cl_abap_matcher,
          go_match   TYPE c LENGTH 1,
          gv_msg     TYPE string,
          p_email    TYPE string VALUE 'yauheni@leverx.com',
          p_email_1  TYPE string.

    READ ENTITIES OF zi_ux_team IN LOCAL MODE
  ENTITY ImpData
    FIELDS ( EmailAddress )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_emp_res).

    LOOP AT lt_emp_res INTO DATA(ls_emp_res).



      p_email_1 =  ls_emp_res-EmailAddress.

      CREATE OBJECT go_regex
        EXPORTING
          pattern     = '\w+(\.\w+)*@(\w+\.)+(\w{2,4})'
          ignore_case = abap_true.

      go_matcher = go_regex->create_matcher( text = p_email_1 ).

*  IF go_matcher->match( ) IS INITIAL.
*    gv_msg = 'Email address is invalid'.
*  ELSE.
*    gv_msg = 'Email address is valid'.
*  ENDIF.

      IF go_matcher->match( ) IS INITIAL.


        APPEND VALUE #(  %tky = ls_emp_res-%tky ) TO failed-ImpData.
        APPEND VALUE #(  %key = ls_emp_res-%key
                         %msg = NEW zcm_zkast_rap(
                         textid = zcm_zkast_rap=>email_incorrect
         EmailAddress = ls_emp_res-EmailAddress
         severity = if_abap_behv_message=>severity-error )
         %element-EmailAddress = if_abap_behv=>mk-on
         %path = VALUE #( UXTeam-Uuid =
        ls_emp_res-TeamUUID ) ) TO reported-ImpData.

      ENDIF.


    ENDLOOP.
ENDMETHOD.


METHOD validateAge.

  READ ENTITIES OF zi_ux_team IN LOCAL MODE
  ENTITY ImpData
  FIELDS ( Age )
  WITH CORRESPONDING #( keys )
  RESULT DATA(lt_emp_res).

  LOOP AT lt_emp_res INTO DATA(ls_emp_res).
    CASE ls_emp_res-Age.
      WHEN 1.
      WHEN 2.
      WHEN OTHERS.
        APPEND VALUE #(  %tky = ls_emp_res-%tky ) TO failed-ImpData.
        APPEND VALUE #(  %key = ls_emp_res-%key
                         %msg = NEW zcm_zkast_rap(
                         textid = zcm_zkast_rap=>check_age
         age = ls_emp_res-Age
         severity = if_abap_behv_message=>severity-error )
         %element-Age = if_abap_behv=>mk-on
         %path = VALUE #( UXTeam-Uuid =
        ls_emp_res-TeamUUID ) ) TO reported-ImpData.
    ENDCASE.

  ENDLOOP.

ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

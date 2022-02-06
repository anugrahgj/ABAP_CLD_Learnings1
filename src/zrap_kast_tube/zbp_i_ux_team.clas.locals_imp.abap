CLASS lhc_UXTeam DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR UXTeam RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR UXTeam RESULT result.

    METHODS setActive FOR MODIFY
      IMPORTING keys FOR ACTION UXTeam~setActive RESULT result.

    METHODS setInactive FOR MODIFY
      IMPORTING keys FOR ACTION UXTeam~setInactive RESULT result.

    METHODS changeSalary FOR DETERMINE ON SAVE
      IMPORTING keys FOR UXTeam~changeSalary.

    METHODS calculateEmployeeID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR UXTeam~calculateEmployeeID.

    METHODS validateAge FOR VALIDATE ON SAVE
      IMPORTING keys FOR UXTeam~validateAge.



ENDCLASS.

CLASS lhc_UXTeam IMPLEMENTATION.

  METHOD get_instance_features.
    " Read the active flag of the existing members
    READ ENTITIES OF zi_ux_team IN LOCAL MODE
        ENTITY UXTeam
          FIELDS ( Active ) WITH CORRESPONDING #( keys )
        RESULT DATA(res_active)
        FAILED failed.

    result =
      VALUE #(
        FOR up_to_you IN res_active

 LET is_active =   COND #( WHEN up_to_you-Active = abap_true
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled  )
     is_inactive =   COND #( WHEN up_to_you-Active = abap_false
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled  )
                                      IN
            ( %tky              = up_to_you-%tky
              %action-setActive = is_active
              %action-setInactive = is_inactive
             ) ).
  ENDMETHOD.


  METHOD get_instance_authorizations.

  ENDMETHOD.


  METHOD setActive.

    MODIFY ENTITIES OF zi_ux_team IN LOCAL MODE
        ENTITY UXTeam
          UPDATE FIELDS (  Active )
            WITH VALUE #( FOR key IN keys
                           ( %tky   = key-%tky
                             Active = abap_true ) )
       FAILED failed
       REPORTED reported.

    " Fill the response table
    READ ENTITIES OF zi_ux_team IN LOCAL MODE
      ENTITY UXTeam
        ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(res_all_fields).

    result = VALUE #( FOR member IN res_all_fields
                        ( %tky   = member-%tky
                          %param = member ) ).

  ENDMETHOD.


  METHOD setInactive.
    MODIFY ENTITIES OF zi_ux_team IN LOCAL MODE
        ENTITY UXTeam
          UPDATE FIELDS (  Active )
            WITH VALUE #( FOR key IN keys
                           ( %tky   = key-%tky
                             Active = abap_false ) )
       FAILED failed
       REPORTED reported.

    " Fill the response table
    READ ENTITIES OF zi_ux_team IN LOCAL MODE
      ENTITY UXTeam
        ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(res_all_fields).

    result = VALUE #( FOR member IN res_all_fields
                        ( %tky   = member-%tky
                          %param = member ) ).
  ENDMETHOD.


  METHOD changeSalary.
    READ ENTITIES OF zi_ux_team IN LOCAL MODE
    ENTITY UXTeam
    FIELDS ( Role ) WITH CORRESPONDING #( keys )
    RESULT DATA(result_role).

    LOOP AT result_role INTO DATA(str_result_role).

      IF str_result_role-Role = 'Developer'.

        MODIFY ENTITIES OF zi_ux_team IN LOCAL MODE
        ENTITY UXTeam
        UPDATE FIELDS ( Salary )
        WITH VALUE #( ( %tky = str_result_role-%tky
                      Salary = 1111 ) ).

      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD calculateEmployeeID.

    DATA lt_ZRAP_UX_TEAM TYPE STANDARD TABLE OF zrap_ux_team.

    READ ENTITIES OF zi_ux_team IN LOCAL MODE
    ENTITY UXTeam
    FIELDS ( EmployeeID ) WITH CORRESPONDING #( keys )
    RESULT DATA(res_emp_id).

    SELECT SINGLE
         FROM  zrap_ux_team
         FIELDS MAX( employee_id ) AS EmployeeID
         INTO @DATA(max_employee_id).

    MODIFY ENTITIES OF zi_ux_team IN LOCAL MODE
    ENTITY UXTeam
    UPDATE FROM VALUE #( FOR Employee IN res_emp_id   INDEX INTO i (
    %tky = Employee-%tky
    EmployeeID = max_employee_id + i
    %control-EmployeeID = if_abap_behv=>mk-on ) )
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).

  ENDMETHOD.



  METHOD validateAge.

    READ ENTITIES OF  zi_ux_team IN LOCAL MODE
    ENTITY UXTeam
    FIELDS ( Age ) WITH CORRESPONDING #( keys )
    RESULT DATA(rersult_age).

    LOOP AT rersult_age INTO DATA(travel).
*      " Clear state messages that might exist
      APPEND VALUE #(  %tky        = travel-%tky
                       %state_area = 'VALIDATE_CUSTOMER1' )
        TO reported-uxteam.

      IF travel-Age IS INITIAL  OR travel-Age < 21 .
*        APPEND VALUE #(  %tky = travel-%tky ) TO failed-uxteam.

        APPEND VALUE #(  %tky        = travel-%tky
                         %state_area = 'VALIDATE_CUSTOMER1'
                         %msg        = NEW zcm_zkast_rap(
                                           severity   = if_abap_behv_message=>severity-error
                                           textid     = zcm_zkast_rap=>check_age
                                           age = travel-Age )
                         %element-Age = if_abap_behv=>mk-on )
          TO reported-uxteam.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.



ENDCLASS.

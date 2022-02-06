CLASS lhc_ZKAST_I_Park_U DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF travel_status,
        open     TYPE c LENGTH 1  VALUE 'O', " Open
        accepted TYPE c LENGTH 1  VALUE 'A', " Accepted
        canceled TYPE c LENGTH 1  VALUE 'X', " Cancelled
      END OF travel_status.

    DATA : lt_zkast_a_park_u TYPE TABLE OF zkast_a_park_u,
           ls_zkast_a_park_u TYPE  zkast_a_park_u.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Park RESULT result.

    METHODS create FOR MODIFY
      IMPORTING it_park_create_entities FOR CREATE Park.

    METHODS update FOR MODIFY
      IMPORTING it_park_update_entities FOR UPDATE Park.

    METHODS delete FOR MODIFY
      IMPORTING it_park_delete_keys FOR DELETE Park.

    METHODS read FOR READ
      IMPORTING keys FOR READ Park RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Park.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING it_get_inst_ftrs_keys REQUEST requested_features FOR Park RESULT result.

    METHODS StatusOpen FOR MODIFY
      IMPORTING it_status_open_keys FOR ACTION Park~StatusOpen RESULT et_action_result.

ENDCLASS.

CLASS lhc_ZKAST_I_Park_U IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.


  METHOD create.

    IF it_park_create_entities IS NOT INITIAL.

      TRY.
          DATA(lv_uuid_x16) = cl_system_uuid=>create_uuid_x16_static( ).
        CATCH cx_uuid_error INTO DATA(e_text).
      ENDTRY.

      LOOP  AT it_park_create_entities ASSIGNING FIELD-SYMBOL(<fs_park_create>).
        ls_zkast_a_park_u = CORRESPONDING #( <fs_park_create> MAPPING FROM ENTITY ).
        ls_zkast_a_park_u-park_uuid = lv_uuid_x16.
        INSERT ls_zkast_a_park_u INTO TABLE lt_zkast_a_park_u.
      ENDLOOP.
      INSERT  zkast_a_park_u FROM TABLE @lt_zkast_a_park_u.
    ENDIF.



*    IF it_park_create_entities IS NOT INITIAL.
*
*      TRY.
*          DATA(lv_uuid_x16) = cl_system_uuid=>create_uuid_x16_static( ).
*        CATCH cx_uuid_error INTO DATA(e_text).
*      ENDTRY.

*      READ TABLE it_park_create_entities ASSIGNING FIELD-SYMBOL(<fs_park_create>) INDEX 1.
*      LOOP  AT it_park_create_entities ASSIGNING FIELD-SYMBOL(<fs_park_create>).

*" step 7 - MODIFY Create
*      MODIFY ENTITIES OF zkast_i_park_u IN LOCAL MODE
*        ENTITY Park
*          CREATE
*            SET FIELDS WITH VALUE
*              #( ( %cid        = 'My_content'"<fs_park_create>-%cid
*                   ParkUuid    = lv_uuid_x16
*                   ParkId  = '6'"<fs_park_create>-ParkId
*                   ParkName   = '7'"<fs_park_create>-ParkName
*                   Capacity     = 8"<fs_park_create>-Capacity
*                   Createdby = sy-uname
*                   Createdat = cl_abap_context_info=>get_system_date( ) ) )
*
*   MAPPED DATA(mapped1)
*   FAILED DATA(failed1)
*   REPORTED DATA(reported1).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF zkast_i_park_u
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

*      ENDLOOP.
*    ENDIF.



  ENDMETHOD.


  METHOD update.

    IF it_park_update_entities IS NOT INITIAL.

      DATA(ls_hdr) = it_park_update_entities[ 1 ].

      SELECT SINGLE *
      FROM zkast_a_park_u
      WHERE park_uuid = @ls_hdr-ParkUuid
      INTO @DATA(ls_park).

      LOOP AT it_park_update_entities ASSIGNING FIELD-SYMBOL(<fs_park_update>).

        ls_zkast_a_park_u = CORRESPONDING #( <fs_park_update> MAPPING FROM ENTITY ).

        IF ls_zkast_a_park_u-park_id IS NOT INITIAL.
          ls_park-park_id = ls_zkast_a_park_u-park_id.
        ENDIF.

        IF ls_zkast_a_park_u-park_name IS NOT INITIAL.
          ls_park-park_name = ls_zkast_a_park_u-park_name.
        ENDIF.

        IF ls_zkast_a_park_u-capacity IS NOT INITIAL.
          ls_park-capacity = ls_zkast_a_park_u-capacity.
        ENDIF.

        UPDATE zkast_a_park_u FROM @ls_park.

      ENDLOOP.

    ENDIF.

  ENDMETHOD.


*      IF sy-subrc EQ 0.
*
*        DATA(lv_park_uuid) = lt_zkast_a_park_u[ 1 ]-park_uuid.
*
*        IF  lv_park_uuid IS NOT INITIAL.
*
*          DELETE FROM zkast_a_park_u WHERE park_uuid EQ @lv_park_uuid.
*
*        ENDIF.
*
*      ENDIF.
*

  METHOD delete.

    IF it_park_delete_keys IS NOT INITIAL.

      LOOP AT it_park_delete_keys ASSIGNING FIELD-SYMBOL(<fs_park_delete>).
        ls_zkast_a_park_u = CORRESPONDING #( <fs_park_delete> MAPPING FROM ENTITY ).
      ENDLOOP.

      DATA(lv_park_uuid) = ls_zkast_a_park_u-park_uuid.

      DELETE FROM  zkast_a_park_u WHERE park_uuid = @lv_park_uuid.

    ENDIF.


  ENDMETHOD.


  METHOD read.
  ENDMETHOD.


  METHOD lock.
  ENDMETHOD.


  METHOD get_instance_features.

  ENDMETHOD.


  METHOD StatusOpen.

*   " Set the open status
*    MODIFY ENTITIES OF ZKAST_I_Park_U IN LOCAL MODE
*      ENTITY Park
*         UPDATE
*           FIELDS ( ParkStatus )
*           WITH VALUE #( FOR key IN it_status_open_keys
*                           ( %tky         = key-%tky
*                             ParkStatus = 'Open' ) )
*      FAILED failed
*      REPORTED reported.
*
*    " Fill the response table
*    READ ENTITIES OF ZKAST_I_Park_U IN LOCAL MODE
*      ENTITY Park
*        ALL FIELDS WITH CORRESPONDING #( it_status_open_keys )
*      RESULT DATA(lt_status_result).
*
*    result = VALUE #( FOR status IN lt_status_result
*                        ( %tky   = status-%tky
*                          %param = status ) ).

**********************************************************************
*    MODIFY ENTITIES OF ZKAST_I_Park_U IN LOCAL MODE
*        ENTITY Park
*          UPDATE FIELDS (  ParkStatus )
*            WITH VALUE #( FOR key IN it_status_open_keys
*                           ( %tky   = key-%tky
*                             ParkStatus = travel_status-accepted ) )
*       FAILED failed
*       REPORTED reported.
*
*    " Fill the response table
*    READ ENTITIES OF ZKAST_I_Park_U IN LOCAL MODE
*      ENTITY Park
*        ALL FIELDS WITH CORRESPONDING #( it_status_open_keys )
*      RESULT DATA(res_all_fields).
*
*    result = VALUE #( FOR member IN res_all_fields
*                        ( %tky   = member-%tky
*                          %param = member ) ).


    IF it_status_open_keys IS NOT INITIAL.

      DATA(ls_park_uuid) = it_status_open_keys[ 1 ].

      UPDATE zkast_a_park_u SET park_status = 'O' WHERE park_uuid = @ls_park_uuid-ParkUuid.

      SELECT * FROM zkast_a_park_u  WHERE park_uuid = @ls_park_uuid-ParkUuid
      INTO TABLE @DATA(lt_db_result).

*     LOOP AT et_action_result ASSIGNING FIELD-SYMBOL(<fs_action_result>).
*     LOOP AT lt_db_result ASSIGNING FIELD-SYMBOL(<fs_db_result>).
*
*     <fs_action_result>-ParkUuid = <fs_db_result>-park_uuid.
*
*      <fs_action_result>-%param-ParkUuid = <fs_db_result>-park_uuid.
*     <fs_action_result>-%param-ParkId = <fs_db_result>-park_id.
*     <fs_action_result>-%param-ParkName = <fs_db_result>-park_name.
*     <fs_action_result>-%param-Capacity = <fs_db_result>-capacity.
*     <fs_action_result>-%param-ParkStatus = <fs_db_result>-park_status.
*
*     ENDLOOP.
*     ENDLOOP.


*      IF sy-subrc EQ 0.
*

*
*      ENDIF.



    ENDIF.




  ENDMETHOD.

ENDCLASS.


CLASS lsc_ZKAST_I_PARK_U DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.


CLASS lsc_ZKAST_I_PARK_U IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.


  METHOD check_before_save.
  ENDMETHOD.


  METHOD save.
  ENDMETHOD.


  METHOD cleanup.
  ENDMETHOD.


  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

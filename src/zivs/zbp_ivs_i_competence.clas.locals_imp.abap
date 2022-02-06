CLASS lsc_zivs_i_competence DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zivs_i_competence IMPLEMENTATION.

  METHOD save_modified.
    IF create-receiver IS NOT INITIAL.
      DATA(dummy_create) = 1 + 1.
    ENDIF.
    IF update-receiver IS NOT INITIAL.
      DATA(dummy_update) = 1 + 1.
    ENDIF.
    IF delete-receiver IS NOT INITIAL.
      DATA(dummy_delete) = 1 + 1.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zivs_i_receiver DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
    TYPES: BEGIN OF ty_recv_name_val,
             recv_name TYPE zivs_de_recv_name,
           END OF ty_recv_name_val,
           tty_recv_name TYPE STANDARD TABLE OF ty_recv_name_val WITH EMPTY KEY.


    METHODS validateReceiverName FOR VALIDATE ON SAVE
      IMPORTING keys FOR Receiver~validateReceiverName.

    "! method returns valid 'receiver name'-values.
    "! @parameter rt_recv_names  | table of receiver names
    METHODS getReceiverNames RETURNING VALUE(rt_recv_names) TYPE tty_recv_name.

ENDCLASS.

CLASS lhc_zivs_i_receiver IMPLEMENTATION.

  METHOD validateReceiverName.

    "! determines all 'Receiver'-entries which match 'keys'-values.
    "! Variable 'keys' is a table with columns 'COMPI_ID' and 'RECV_ID' (i.e. key elements of 'Receiver'-entity).
    "! Here table has one line with e.g. COMP_ID = 00004140' and 'RECV_ID = 0020'.
    "! Note: method 'earlynumbering_cba_receiver' was processed before this method. So new ID of 'RECV_ID' is already determined and filled.
    READ ENTITIES OF ZIVS_I_Competence IN LOCAL MODE
       ENTITY Receiver
       FIELDS ( ReceiverName )
*       all FIELDS
       WITH CORRESPONDING #( keys )
       RESULT DATA(lt_receiver_cur)
       FAILED DATA(lt_failed).

    failed = CORRESPONDING #( DEEP lt_failed ).

    "! determines key of all competences current receiver(s) are linked to
    "! Variable 'lt_receiver_cur' is a table with e.g. one line  (e.g. 'COMP_ID = 00004140' and 'RECV_ID = 0020').
    "!   'COMP_ID' is key element of entity 'Receiver' and entity 'Competence'. So parent-'Competences' may be identified via 'COMP_ID'.
    "! Variable 'lt_link' is a table with column 'SOURCE' (e.g. value '000041400020') and column 'TARGET' (e.g. value '00004140')
    "!   and contains - after read - all competences to which current 'Receiver'-entry is linked.
    READ ENTITIES OF ZIVS_I_Competence IN LOCAL MODE
      ENTITY Receiver BY \_Competence
      FROM CORRESPONDING #( lt_receiver_cur )
      LINK DATA(lt_link).

    DATA(lt_recv_names) = me->getreceivernames( ) .
    LOOP AT lt_receiver_cur ASSIGNING FIELD-SYMBOL(<ls_receiver_cur>).

      "! '<ls_receiver_cur>-%tky' contains concatenated key of 'Receiver'-entry, e.g. '000041400020',
      "! i.e. all key elements of 'Receiver'-entity. Potential memory hook: %tky - 'total key elements'
      APPEND VALUE #( %tky = <ls_receiver_cur>-%tky
        %state_area = 'VALIDATE_RECEIVER' ) TO reported-receiver.

      IF NOT line_exists( lt_recv_names[ recv_name = <ls_receiver_cur>-ReceiverName ] ).

        "! use 'failed-receiver' to signal that something is wrong (i.e. 'ReceiverName' is not valid)
        APPEND VALUE #( %tky = <ls_receiver_cur>-%tky ) TO failed-receiver.

        "! signals error and concrete details of error:
        "! - %msg: detailed error message as an instance of an exception class
        "! - %path: provide key (i.e. COMP_ID) of parent-'Competence'.
        "! - %element: provide responsible field
        APPEND VALUE #( %tky = <ls_receiver_cur>-%tky
           %state_area = 'VALIDATE_RECEIVER'
           %msg = NEW zivs_messages(
              textid = zivs_messages=>receiver_name_unkown
              severity = if_abap_behv_message=>severity-error )
            %path = VALUE #( zivs_i_competence-%tky = lt_link[ source-%tky = <ls_receiver_cur>-%tky ]-target-%tky )
            %element-ReceiverName = if_abap_behv=>mk-on
            ) TO reported-receiver.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD getreceivernames.
    rt_recv_names = VALUE #(
    ( recv_name = 'AM' )
    ( recv_name = 'AW' )
    ( recv_name = 'QM')
    ( recv_name = 'QW' )
    ).
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZIVS_I_Competence DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZIVS_I_Competence RESULT result.
    METHODS createcompetencebytemplate FOR MODIFY
      IMPORTING keys FOR ACTION zivs_i_competence~createCompetenceByTemplate RESULT result.

    "! Must be implemented due to option 'early numbering' in behavior-definition (BDEF).
    "! Method determines next ID for newly created 'competence'-instance.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE ZIVS_I_Competence.

    "! Must be implemented due to option 'early numbering' in behavior-definition (BDEF).
    "! Method determines next ID for newly created 'receiver'-instance.
    METHODS earlynumbering_cba_receiver FOR NUMBERING
      IMPORTING entities FOR CREATE ZIVS_I_Competence\_Receiver.
ENDCLASS.

CLASS lhc_ZIVS_I_Competence IMPLEMENTATION.

  METHOD get_instance_authorizations.

  ENDMETHOD.

  METHOD earlynumbering_create.

    DATA:
      entity      TYPE STRUCTURE FOR CREATE zivs_i_competence,
      comp_id_max TYPE zivs_de_compid.

    " Ensure CompID is not set yet (idempotent)- must be checked when BO is draft-enabled
    LOOP AT entities INTO entity WHERE comp_id IS NOT INITIAL.
      APPEND CORRESPONDING #( entity ) TO mapped-zivs_i_competence.
    ENDLOOP.

    DATA(entities_wo_compid) = entities.

    "determine all 'Competence'-lines with empty 'COMP_ID' (i.e. newly created 'Competence'-lines').
    DELETE entities_wo_compid WHERE comp_id IS NOT INITIAL.

    "get next numbers to be applied as 'COMP_IDs'
    TRY.
        cl_numberrange_runtime=>number_get(
          EXPORTING
            nr_range_nr       = '01'
            object            = '/DMO/TRV_M'
            quantity          = CONV #( lines( entities_wo_compid ) )
          IMPORTING
            number            = DATA(number_range_key)
            returncode        = DATA(number_range_return_code)
            returned_quantity = DATA(number_range_returned_quantity)
        ).
      CATCH cx_number_ranges INTO DATA(lx_number_ranges).
        LOOP AT entities_wo_compid INTO entity.
          APPEND VALUE #(
                %cid = entity-%cid
                %key = entity-%key
                %msg = lx_number_ranges
            ) TO reported-zivs_i_competence.
          APPEND VALUE #(
                %cid        = entity-%cid
                %key        = entity-%key
            ) TO failed-zivs_i_competence.
        ENDLOOP.
        EXIT.
    ENDTRY.

    CASE number_range_return_code.
      WHEN '1'.
        " 1 - the returned number is in a critical range (specified under “percentage warning” in the object definition)
        LOOP AT entities_wo_compid INTO entity.
          APPEND VALUE #(
                %cid      = entity-%cid
                %key      = entity-%key
                %msg      = NEW /dmo/cm_flight_messages(
                                textid = /dmo/cm_flight_messages=>number_range_depleted
                                severity = if_abap_behv_message=>severity-warning
                       )
            ) TO reported-zivs_i_competence.
        ENDLOOP.

      WHEN '2' OR '3'.
        " 2 - the last number of the interval was returned
        " 3 - if fewer numbers are available than requested,  the return code is 3
        LOOP AT entities_wo_compid INTO entity.
          APPEND VALUE #(
                %cid      = entity-%cid
                %key      = entity-%key
                %msg      = NEW /dmo/cm_flight_messages(
                                textid = /dmo/cm_flight_messages=>not_sufficient_numbers
                                severity = if_abap_behv_message=>severity-error )
            ) TO reported-zivs_i_competence.
          APPEND VALUE #(
                %cid        = entity-%cid
                %key        = entity-%key
                %fail-cause = if_abap_behv=>cause-conflict
            ) TO failed-zivs_i_competence.
        ENDLOOP.
        EXIT.
    ENDCASE.

    " At this point ALL entities get a number!
    ASSERT number_range_returned_quantity = lines( entities_wo_compid ).

    comp_id_max = number_range_key - number_range_returned_quantity.

    "setup 'mapped'-table, i.e. mapping of 'CID' (system generated, temporary content-ID) and new real 'COMP_ID'.
    "Table 'mapped-zivs_i_competence' has columns '%CID' and 'COMP_ID'. '%key' is system synonym for 'COMP_ID'.
    "Example values: entity-%CID = 'id-1639993223243-320', value '00004140' is assigned to 'entity-comp_id'. So 'entity-%key' is '00004140'.
    LOOP AT entities_wo_compid INTO entity.
      comp_id_max += 1.
      entity-comp_id = comp_id_max .

      APPEND VALUE #(
          %cid      = entity-%cid
          %key      = entity-%key
        ) TO mapped-zivs_i_competence.
    ENDLOOP.

  ENDMETHOD.

  METHOD earlynumbering_cba_receiver.
    DATA: max_receiver_id TYPE zivs_de_recv_id.

    READ ENTITIES OF zivs_i_competence IN LOCAL MODE
      ENTITY zivs_i_Competence BY \_Receiver
        FROM CORRESPONDING #( entities )
        LINK DATA(receivers)
      FAILED failed.

    " Loop over all unique TravelIDs
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<competence_group>) GROUP BY <competence_group>-comp_id.

      " Get highest booking_id from bookings belonging to travel
      max_receiver_id = REDUCE #( INIT max = CONV zivs_de_recv_id( '0' )
                                 FOR  receiver IN receivers USING KEY entity WHERE ( source-comp_id  = <competence_group>-comp_id )
                                 NEXT max = COND zivs_de_recv_id( WHEN receiver-target-recv_id > max
                                                                    THEN receiver-target-recv_id
                                                                    ELSE max )
                               ).
      " Get highest assigned booking_id from incoming entities
      max_receiver_id = REDUCE #( INIT max = max_receiver_id
                                 FOR  entity IN entities USING KEY entity WHERE ( comp_id  = <competence_group>-comp_id )
                                 FOR  target IN entity-%target
                                 NEXT max = COND zivs_de_recv_id( WHEN   target-recv_id > max
                                                                    THEN target-recv_id
                                                                    ELSE max )
                               ).

      " Loop over all entries in entities with the same TravelID
      LOOP AT entities ASSIGNING FIELD-SYMBOL(<travel>) USING KEY entity WHERE comp_id = <competence_group>-comp_id.

        " Assign new booking-ids if not already assigned
        LOOP AT <travel>-%target ASSIGNING FIELD-SYMBOL(<receiver_wo_numbers>).
          APPEND CORRESPONDING #( <receiver_wo_numbers> ) TO mapped-receiver ASSIGNING FIELD-SYMBOL(<mapped_receiver>).
          IF <receiver_wo_numbers>-recv_id IS INITIAL.
            max_receiver_id += 10 .
            <mapped_receiver>-recv_id = max_receiver_id .
          ENDIF.
        ENDLOOP.

      ENDLOOP.

    ENDLOOP.
  ENDMETHOD.

  METHOD createCompetenceByTemplate.
    SELECT MAX( comp_id ) FROM ZIVS_Competence INTO @DATA(lv_comp_id).
    READ ENTITIES OF zivs_i_competence IN LOCAL MODE
    ENTITY zivs_i_competence
    FIELDS ( comp_id
      FromDate
      ToDate
      Description )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_read_result)
    FAILED failed
    REPORTED reported.

    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).

*    DATA lt_create TYPE TABLE FOR CREATE ZIVS_I_Competence\\zivs_competence.
    DATA lt_create TYPE TABLE FOR CREATE ZIVS_I_Competence.

    GET TIME STAMP FIELD DATA(lf_datetime).
    lt_create = VALUE #( FOR row IN lt_read_result INDEX INTO idx
    (
    comp_id = lv_comp_id + idx
    FromDate = row-FromDate
    ToDate = row-ToDate
    Description = row-Description
*    CreatedBy = cl_abap_context_info=>get_user_alias(  )
*    CreatedAt = cl_abap_context_info=>get_system_date(  )
*    LastChangedBy = cl_abap_context_info=>get_user_alias(  )
    CreatedBy = cl_abap_context_info=>get_user_business_partner_id( )
    CreatedAt = lf_datetime
    LastChangedBy = 'GENSLWLT'

 ) ).
    MODIFY ENTITIES OF zivs_i_competence IN LOCAL MODE
    ENTITY zivs_i_competence
    CREATE FIELDS (
      FromDate
      ToDate
      Description
      CreatedBy
      CreatedAt
      LastChangedBy
       )

    WITH lt_create
    MAPPED mapped
    FAILED failed
    REPORTED reported.

    result = VALUE #( FOR create IN lt_create INDEX INTO idx
    ( %cid_ref = keys[ idx ]-%cid_ref
    %key = keys[ idx ]-comp_id
    %param = CORRESPONDING #( create ) ) ) .

    DATA: lf_dummy TYPE i.
    lf_dummy = lf_dummy + 1.
  ENDMETHOD.

ENDCLASS.

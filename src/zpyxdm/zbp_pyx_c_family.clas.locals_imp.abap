CLASS lhc_family DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS augment FOR MODIFY
      IMPORTING entities_create FOR CREATE Family
                entities_update FOR UPDATE Family.

ENDCLASS.

CLASS lhc_family IMPLEMENTATION.

  METHOD augment.

    DATA: lt_text_fornew TYPE TABLE FOR CREATE zpyx_i_family\_Text,
          lt_text_forcba TYPE TABLE FOR CREATE zpyx_i_family\_Text,
          lt_text_forupd TYPE TABLE FOR UPDATE zpyx_i_family_t.

    DATA: ls_text_tky_link TYPE STRUCTURE FOR READ LINK zpyx_i_family\_Text,
          ls_text_tky      LIKE ls_text_tky_link-target.

    DATA: relates_create TYPE abp_behv_relating_tab,
          relates_update TYPE abp_behv_relating_tab,
          relates_cba    TYPE abp_behv_relating_tab.

*   Create new text for new Family
    LOOP AT entities_create ASSIGNING FIELD-SYMBOL(<ls_entity_create>).
      INSERT sy-tabix INTO TABLE relates_create.


      INSERT VALUE #( %cid_ref    = <ls_entity_create>-%cid
                      %is_draft   = <ls_entity_create>-%is_draft
                      %key-guid   = <ls_entity_create>-%key-guid
                      %target     = VALUE #( ( %cid         = |CREATETEXTCID{ sy-tabix }|
                                               %is_draft    = <ls_entity_create>-%is_draft
                                               %key-guid    = <ls_entity_create>-guid
                                               langu        = sy-langu
                                               descr        = <ls_entity_create>-descr
                                               %control     = VALUE #( guid = if_abap_behv=>mk-off
                                                                       langu = if_abap_behv=>mk-on
                                                                       descr  = <ls_entity_create>-%control-descr ) ) )
      ) INTO TABLE lt_text_fornew.
    ENDLOOP.

    MODIFY AUGMENTING ENTITIES OF zpyx_i_family
      ENTITY Family
        CREATE BY \_Text
        FROM lt_text_fornew
        RELATING TO entities_create BY relates_create.

    IF entities_update IS NOT INITIAL.
      READ ENTITIES OF zpyx_i_family
       ENTITY Family BY \_Text
       FROM CORRESPONDING #( entities_update )
       LINK DATA(lt_link).

      LOOP AT entities_update ASSIGNING FIELD-SYMBOL(<ls_update_entity>).
        DATA(lv_tabix) = sy-tabix.

        ls_text_tky = CORRESPONDING #( <ls_update_entity>-%tky ).
        ls_text_tky-Langu = sy-langu.

        IF line_exists( lt_link[ KEY draft source-%tky  = CORRESPONDING #( <ls_update_entity>-%tky )
                                     target-%tky  = CORRESPONDING #( ls_text_tky ) ] ).
*       Modify an existing text created in previous request
          INSERT lv_tabix INTO TABLE relates_update.

          INSERT VALUE #( %tky             = ls_text_tky
                          %cid_ref         = <ls_update_entity>-%cid_ref
                          descr            = <ls_update_entity>-Descr
                          %control         = VALUE #( descr = <ls_update_entity>-%control-descr )
                        ) INTO TABLE lt_text_forupd.
        ELSEIF line_exists(  lt_text_fornew[ KEY cid %is_draft = <ls_update_entity>-%is_draft
                                                     %cid_ref  = <ls_update_entity>-%cid_ref ] ).
*       Modifiy an existing Text created in current Request
          INSERT lv_tabix INTO TABLE relates_update.
          INSERT VALUE #( %tky              = ls_text_tky
                          %cid_ref          = lt_text_fornew[ %is_draft = <ls_update_entity>-%is_draft
                                                             %cid_ref  = <ls_update_entity>-%cid_ref ]-%target[ 1 ]-%cid
                          descr             = <ls_update_entity>-descr
                          %control          = VALUE #( descr = <ls_update_entity>-%control-descr )
                        ) INTO TABLE lt_text_forupd.
        ELSE.
*       add new text created by association
          INSERT lv_tabix INTO TABLE relates_cba.
          INSERT VALUE #( %tky     = CORRESPONDING #( <ls_update_entity>-%tky )
                                    %cid_ref = <ls_update_entity>-%cid_ref
                                    %target  = VALUE #( ( %cid          = |UPDATETEXTCID{ lv_tabix }|
                                                          langu     = sy-langu
                                                          %is_draft = ls_text_tky-%is_draft
                                                          descr     = <ls_update_entity>-descr
                                                          %control  = VALUE #( langu = if_abap_behv=>mk-on
                                                                                   descr   = <ls_update_entity>-%control-descr )
                                                       ) )
                                   ) INTO TABLE lt_text_forcba.
        ENDIF.


      ENDLOOP.
    ENDIF.

    MODIFY AUGMENTING ENTITIES OF zpyx_i_family
      ENTITY FamilyText
        UPDATE FROM lt_text_forupd
        RELATING TO entities_update BY relates_update
      ENTITY Family
        CREATE BY \_Text
        FROM lt_text_forcba
        RELATING TO entities_update BY relates_cba.

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

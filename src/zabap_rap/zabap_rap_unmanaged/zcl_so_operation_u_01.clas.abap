CLASS zcl_so_operation_u_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
         types tt_tables_SOH TYPE STANDARD TABLE OF ZVBAK_02.
         types tt_tables_SOI TYPE STANDARD TABLE OF ZVBAP_02.

         CLASS-METHODS: get_instance RETURNING VALUE(ro_instance) TYPE REF TO zcl_so_operation_u_01.
         METHODS buffer_SO_Header_delete IMPORTING it_so TYPE tt_tables_SOH.
         METHODS buffer_SO_Header_create IMPORTING it_so TYPE tt_tables_SOH
                                         returning value(OBJ_MSG) type ref to IF_ABAP_BEHV_MESSAGE.
         METHODS buffer_SO_Header_update IMPORTING it_so TYPE tt_tables_SOH
                                              it_so_control TYPE ZIF_SO_STRUCTURE=>tt_SO_control.
         METHODS buffer_so_block_unblock IMPORTING it_so TYPE tt_tables_SOH
                                              lv_block TYPE ZVBAK_02-faksk.

        METHODS buffer_SOI_Item_create IMPORTING it_soi TYPE tt_tables_SOI.
        METHODS buffer_SOI_Item_delete IMPORTING it_soi TYPE tt_tables_SOI.


         METHODS Save.
         METHODS Reset.

         methods NEW_MESSAGE
            importing
              !ID type SYMSGID
              !NUMBER type SYMSGNO
              !SEVERITY type IF_ABAP_BEHV_MESSAGE=>T_SEVERITY
              !V1 type SIMPLE optional
              !V2 type SIMPLE optional
              !V3 type SIMPLE optional
              !V4 type SIMPLE optional
            returning
              value(OBJ) type ref to IF_ABAP_BEHV_MESSAGE .

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: go_intance TYPE REF TO zcl_so_operation_u_01.
ENDCLASS.



CLASS zcl_so_operation_u_01 IMPLEMENTATION.

 METHOD get_instance.

    go_intance = COND #( WHEN go_intance IS BOUND THEN go_intance ELSE NEW #(  ) ).
    ro_instance = go_intance.

  ENDMETHOD.

  METHOD buffer_so_header_delete.

    lcl_so_buffer=>get_instance(  )->buffer_so_header_delete( EXPORTING it_so = it_so ).

  ENDMETHOD.

  METHOD Reset.
    lcl_so_buffer=>get_instance(  )->Reset(  ).
  ENDMETHOD.

  METHOD save.

    lcl_so_buffer=>get_instance(  )->save( ).

  ENDMETHOD.

  METHOD buffer_so_header_create.

    OBJ_MSG = lcl_so_buffer=>get_instance(  )->buffer_so_header_create( EXPORTING it_so = it_so ).

  ENDMETHOD.

  METHOD buffer_so_header_update.
    lcl_so_buffer=>get_instance(  )->buffer_so_header_update( EXPORTING it_so = it_so
                                                                        it_so_control = it_so_control ).

  ENDMETHOD.

  METHOD buffer_so_block_unblock.

    lcl_so_buffer=>get_instance(  )->buffer_so_block_unblock( EXPORTING it_so = it_so
                                                                        lv_block = lv_block ).

  ENDMETHOD.

  METHOD buffer_SOI_Item_create.

    lcl_so_buffer=>get_instance(  )->buffer_soi_item_create( EXPORTING it_soi = it_soi ).

  ENDMETHOD.

  METHOD buffer_soi_item_delete.

  lcl_so_buffer=>get_instance(  )->buffer_soi_item_delete( EXPORTING it_soi = it_soi ).

  ENDMETHOD.

  METHOD NEW_MESSAGE.

  constants MS like IF_ABAP_BEHV_MESSAGE=>SEVERITY value IF_ABAP_BEHV_MESSAGE=>SEVERITY ##NO_TEXT.

      obj = new lcl_abap_behv_msg(
        textid = value #(
                   msgid = id
                   msgno = number
                   attr1 = cond #( when v1 is not initial then 'IF_T100_DYN_MSG~MSGV1' )
                   attr2 = cond #( when v2 is not initial then 'IF_T100_DYN_MSG~MSGV2' )
                   attr3 = cond #( when v3 is not initial then 'IF_T100_DYN_MSG~MSGV3' )
                   attr4 = cond #( when v4 is not initial then 'IF_T100_DYN_MSG~MSGV4' )
        )
        msgty = switch #( severity
                  when ms-ERROR       then 'E'
                  when ms-WARNING     then 'W'
                  when ms-INFORMATION then 'I'
                  when ms-SUCCESS     then 'S' )
        msgv1 = |{ v1 }|
        msgv2 = |{ v2 }|
        msgv3 = |{ v3 }|
        msgv4 = |{ v4 }|
      ).

      obj->m_severity = severity.

  ENDMETHOD.

ENDCLASS.

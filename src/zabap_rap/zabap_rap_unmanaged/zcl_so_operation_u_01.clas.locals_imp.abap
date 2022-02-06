*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_so_buffer DEFINITION FINAL  CREATE PRIVATE.

  PUBLIC SECTION.
    types tt_tables_SOH TYPE STANDARD TABLE OF ZVBAK_02.
    types tt_tables_SOI TYPE STANDARD TABLE OF ZVBAP_02.
    CLASS-METHODS: get_instance RETURNING VALUE(ro_instance) TYPE REF TO lcl_so_buffer.
    "Headers
    METHODS buffer_SO_Header_delete IMPORTING it_so TYPE tt_tables_SOH.
    METHODS buffer_SO_Header_create IMPORTING it_so TYPE tt_tables_SOH
                                    returning value(OBJ_MSG) type ref to IF_ABAP_BEHV_MESSAGE.
    METHODS buffer_SO_Header_update IMPORTING it_so TYPE tt_tables_SOH
                                              it_so_control TYPE ZIF_SO_STRUCTURE=>tt_SO_control.
    METHODS buffer_so_block_unblock IMPORTING it_so TYPE tt_tables_SOH
                                              lv_block TYPE ZVBAK_02-faksk.
    "Items
    METHODS buffer_SOI_Item_create IMPORTING it_soi TYPE tt_tables_SOI.
    METHODS buffer_SOI_Item_delete IMPORTING it_soi TYPE tt_tables_SOI.
*                                   RAISING cx_bcs_send.
    METHODS Save.
    METHODS Reset.

    Data: "Header
          tSOH_Update_Buffer TYPE STANDARD TABLE OF ZVBAK_02,
          tSOH_Delete_Buffer TYPE STANDARD TABLE OF ZVBAK_02,
          tSOH_Create_Buffer TYPE STANDARD TABLE OF ZVBAK_02,
          "Item
          tSOI_Delete_Buffer TYPE STANDARD TABLE OF ZVBAP_02,
          tSOI_Create_Buffer TYPE STANDARD TABLE OF ZVBAP_02.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: go_intance TYPE REF TO lcl_so_buffer.
ENDCLASS.



CLASS lcl_so_buffer IMPLEMENTATION.



  METHOD get_instance.

    go_intance = COND #( WHEN go_intance IS BOUND THEN go_intance ELSE NEW #(  ) ).
    ro_instance = go_intance.

  ENDMETHOD.

  METHOD buffer_so_header_delete.
  "Main Code for adding Business Logic tSOH_Update to DB

    Move-CORRESPONDING it_so to tSOH_Delete_Buffer.

    Select * from ZVBAP_02
    FOR All ENTRIES IN @it_so
    WHERE vbeln = @it_so-vbeln
    INTO TABLE @tSOI_Delete_Buffer.

  ENDMETHOD.

  METHOD buffer_SO_Header_create.
    "Also TODO: Check if the Currency Values are inserted Properly

    Loop at it_so ASSIGNING FIELD-SYMBOL(<fs_so>).

        if <fs_so>-vkorg < 0.

            OBJ_MSG = zcl_so_operation_u_01=>get_instance(  )->new_message(
                          id = 'Z_RAP_U_SO_MSG'
                          number = '001'
                          v1 = 'Header Creation'
                          v2 = 'Org Cant be Negative'
                          severity = if_abap_behv_message=>severity-error ).

        Return.

        ENDIF.

    ENDLOOP.

    MOVE-CORRESPONDING it_so to tSOH_Create_Buffer.


  ENDMETHOD.



  METHOD buffer_so_header_update.
  "Consider Both Control table and fill the missing data which do not need to be updated
  "From the DB Table

  Data: lt_so_data_all TYPE STANDARD TABLE OF ZVBAK_02,
        lv_flag_control TYPE i VALUE 2,
        lr_structure_desc TYPE REF TO cl_abap_structdescr,
        lt_structure_desc TYPE  ABAP_COMPONENT_TAB,
        l_component TYPE LINE OF ABAP_COMPONENT_TAB,
        lv_new_timestamp TYPE timestampl.


        GET TIME STAMP FIELD lv_new_timestamp.

  SELECT * from ZVBAK_02
  FOR ALL ENTRIES IN @it_so
  WHERE vbeln = @it_so-vbeln
  into table @lt_so_data_all.



  Loop at lt_so_data_all ASSIGNING FIELD-SYMBOL(<fs_so_line>).


    READ TABLE it_so ASSIGNING FIELD-SYMBOL(<fs_ls_so_new>) WITH Key vbeln = <fs_so_line>-vbeln.
    if sy-subrc = 0.

        READ TABLE it_so_control ASSIGNING FIELD-SYMBOL(<fs_so_control>) With Key vbeln_id = <fs_so_line>-vbeln.


        IF lt_structure_desc is INITIAL.
            lr_structure_desc ?= cl_abap_typedescr=>describe_by_data( <fs_so_control> ).
            lt_structure_desc = lr_structure_desc->get_components( ).
        ENDIF.

        Do.

        Assign COMPONENT lv_flag_control of STRUCTURE <fs_so_control> TO FIELD-SYMBOL(<v_flag>).
        if sy-subrc <> 0.
            exit.
        ENDIF.

        if <v_flag> eq '01' or <v_flag> eq '1'.

            "Col name? of the index
            READ Table lt_structure_desc into l_component INDEX lv_flag_control.

            ASSIGN COMPONENT l_component-name of STRUCTURE <fs_so_line> to FIELD-SYMBOL(<fs_db_data>).
            ASSIGN COMPONENT l_component-name of STRUCTURE <fs_ls_so_new> to FIELD-SYMBOL(<fs_updated>).

        <fs_db_data> = <fs_updated>.
        <fs_so_line>-last_changed_timestamp = lv_new_timestamp.

        endif.


        lv_flag_control = lv_flag_control + 1.
        ENDDO.

    endif.

    APPEND <fs_so_line> TO tSOH_Update_Buffer.

  ENDLOOP.

  ENDMETHOD.






  METHOD buffer_so_block_unblock.

    Data: lt_so TYPE STANDARD TABLE OF ZVBAK_02.

          "Block Status
          "Key

          SELECT * From ZVBAK_02
          FOR ALL ENTRIES IN @it_so
          where vbeln = @it_so-vbeln
          INTO TABLE @lt_so.

          Loop at lt_so ASSIGNING FIELD-SYMBOL(<fs_so>).

            <fs_so>-faksk = lv_block.

            APPEND <fs_so> to tSOH_Update_Buffer.

          ENDLOOP.


  ENDMETHOD.

  METHOD buffer_SOI_Item_create.

  Data: lt_so Type STANDARD TABLE OF ZVBAK_02,
        lv_total TYPE ZVBAK_02-netwr VALUE 0.

    "tSOH_Update_Buffer
    READ TABLE it_soi ASSIGNING FIELD-SYMBOL(<fs_it_so>) INDEX 1.

    Select * from ZVBAK_02
    WHERE vbeln = @<fs_it_so>-vbeln
    into TABLE @lt_so.

    LOOP at it_soi ASSIGNING FIELD-SYMBOL(<fs_soi>).

        lv_total += <fs_soi>-netwr.

    ENDLOOP.

    READ TABLE lt_so ASSIGNING FIELD-SYMBOL(<fs_so>) INDEX 1.

    ASSIGN COMPONENT 'netwr' OF STRUCTURE <fs_so> TO FIELD-SYMBOL(<fs_netwr>).
    <fs_netwr> = <fs_so>-netwr + lv_total.

    MOVE-CORRESPONDING lt_so to tsoh_update_buffer.
    MOVE-CORRESPONDING it_soi to tSOI_Create_Buffer.
    "Header New Total Sum of all Item Total





  ENDMETHOD.


  METHOD buffer_soi_item_delete.

    Data: lt_so Type STANDARD TABLE OF ZVBAK_02,
        lv_total TYPE ZVBAK_02-netwr VALUE 0.


    "tSOH_Update_Buffer
    READ TABLE it_soi ASSIGNING FIELD-SYMBOL(<fs_it_so>) INDEX 1.

    Select * from ZVBAK_02
    WHERE vbeln = @<fs_it_so>-vbeln
    into TABLE @lt_so.

    SELECT * from ZVBAP_02
    WHERE vbeln = @<fs_it_so>-vbeln and posnr = @<fs_it_so>-posnr
    INTO TABLE @DATA(it_soi_all_val).

    LOOP at it_soi_all_val ASSIGNING FIELD-SYMBOL(<fs_soi>).

        lv_total += <fs_soi>-netwr.

    ENDLOOP.

    READ TABLE lt_so ASSIGNING FIELD-SYMBOL(<fs_so>) INDEX 1.

    ASSIGN COMPONENT 'netwr' OF STRUCTURE <fs_so> TO FIELD-SYMBOL(<fs_netwr>).
    <fs_netwr> = <fs_so>-netwr - lv_total.

    MOVE-CORRESPONDING lt_so to tsoh_update_buffer.

    MOVE-CORRESPONDING it_soi to tSOI_Delete_Buffer.
    "Header New Total Sum of all Item Total

    DATA ev_updated_sender type string.
    DATA(msg) = cl_bcs_mail_message=>create_instance( ).
*    data(lo_mail) = new cl_bcs_message( ).
    msg->set_subject( 'My test email'  ).
    msg->add_recipient(
      exporting
        iv_address      = 'eboci@alteanet.it'
*        iv_commtype     = iv_commtype    " Communication Type
*         iv_visible_name = 'WRITE Yours'    " Display Name of an Address
*        iv_copy         = iv_copy    " Copy Recipients (None, CC, BCC)
*        iv_fax_country  = iv_fax_country    " Country for Telephone/Fax Number
    ).
   msg->set_sender(
     exporting
       iv_address      = 'eboci@alteanet.it'    " Communication Address (for INT, FAX, SMS, and so on)
*       iv_commtype     = iv_commtype    " Communication Type
*        iv_visible_name = 'Do not reply '    " Display Name of an Address
*       iv_fax_country  = iv_fax_country    " Country for Telephone/Fax Number
   ).
*   msg->set_main(
*     exporting
*       iv_contents_txt = |<html><head></head><body><br/><b>TEST MESSAGE</b><br/><br/>|
*                        && |sample from <a href='http://ABAPblog.com'>ABAPblog.com</a></body></html>|
*       iv_contents_bin = iv_contents_bin    " Main Document, First Body Part (Binary)
*       iv_role     = 'htm'    " Document Category
*       iv_codepage     = iv_codepage    " Character Set of a Document
*   ).
*   msg->send( importing ev_updated_sender = iv_address ).
   msg->send( ).


  ENDMETHOD.


   METHOD Reset.
  "Reset all the variable like tSOH_Update
    Clear: "Header
           tSOH_Update_Buffer,
           tSOH_Delete_Buffer,
           tSOH_Create_Buffer,

           "Item
           tSOI_Delete_Buffer,
           tSOI_Create_Buffer.

  ENDMETHOD.

  METHOD save.

  "SQL Logic to write the temp variable like
   "Header
   DELETE ZVBAK_02 FROM TABLE @( Corresponding #( tSOH_Delete_Buffer ) ).
   INSERT ZVBAK_02 FROM TABLE @tSOH_Create_Buffer.
   UPDATE ZVBAK_02 FROM TABLE @tSOH_Update_Buffer.

    "Items
   DELETE ZVBAP_02 FROM TABLE @( Corresponding #( tSOI_Delete_Buffer ) ).
   INSERT ZVBAP_02 FROM TABLE @tSOI_Create_Buffer.

  ENDMETHOD.



ENDCLASS.


" Inheritance from CX_ROOT gives implementation of GET_TEXT, GET_LONGTEXT
class lcl_abap_behv_msg definition create public inheriting from cx_no_check.
  public section.

  interfaces IF_ABAP_BEHV_MESSAGE .

  aliases MSGTY
    for IF_T100_DYN_MSG~MSGTY .
  aliases MSGV1
    for IF_T100_DYN_MSG~MSGV1 .
  aliases MSGV2
    for IF_T100_DYN_MSG~MSGV2 .
  aliases MSGV3
    for IF_T100_DYN_MSG~MSGV3 .
  aliases MSGV4
    for IF_T100_DYN_MSG~MSGV4 .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !MSGTY type symsgty optional
      !MSGV1 type simple optional
      !MSGV2 type simple optional
      !MSGV3 type simple optional
      !MSGV4 type simple optional .

endclass.

class lcl_abap_behv_msg implementation.

method constructor.
  call method super->constructor exporting previous = previous.
  me->msgty = msgty .
  me->msgv1 = msgv1 .
  me->msgv2 = msgv2 .
  me->msgv3 = msgv3 .
  me->msgv4 = msgv4 .
  clear me->textid.
  if textid is initial.
    if_t100_message~t100key = if_t100_message=>default_textid.
  else.
    if_t100_message~t100key = textid.
  endif.
endmethod.

endclass.

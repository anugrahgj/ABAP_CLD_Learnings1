INTERFACE zif_bizland_bp_datasrcsubs_exc
  PUBLIC .
  data:
        short_text type string.
 CONSTANTS:
    BEGIN OF zcx_biz_error_behav_create,
      msgid TYPE symsgid VALUE 'ZBIZ_BP_DATASRCSSUBS',
      msgno TYPE symsgno VALUE '001',
      attr1 TYPE scx_attrname VALUE 'SHORT_TEXT',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_behav_create.

  CONSTANTS:
    BEGIN OF zcx_biz_error_behav_update,
      msgid TYPE symsgid VALUE 'ZBIZ_BP_DATASRCSSUBS',
      msgno TYPE symsgno VALUE '002',
      attr1 TYPE scx_attrname VALUE 'SHORT_TEXT',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_behav_update.
ENDINTERFACE.

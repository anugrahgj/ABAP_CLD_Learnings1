INTERFACE zif_bizland_dao_util_exception
  PUBLIC .
  data:
        objname type string,
        component_name type string,
        cds_view type string.
  CONSTANTS:
    BEGIN OF zcx_biz_error_unkwn_table,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO_UTIL',
      msgno TYPE symsgno VALUE '001',
      attr1 TYPE scx_attrname VALUE '',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_unkwn_table.

  CONSTANTS:
    BEGIN OF zcx_biz_error_db_table_name,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO_UTIL',
      msgno TYPE symsgno VALUE '002',
      attr1 TYPE scx_attrname VALUE 'OBJNAME',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_db_table_name.

  CONSTANTS:
    BEGIN OF zcx_biz_error_cds_view_name,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO_UTIL',
      msgno TYPE symsgno VALUE '003',
      attr1 TYPE scx_attrname VALUE 'OBJNAME',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_cds_view_name.

  CONSTANTS:
    BEGIN OF zcx_biz_error_db_component,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO_UTIL',
      msgno TYPE symsgno VALUE '004',
      attr1 TYPE scx_attrname VALUE 'COMPONENT_NAME',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_db_component.

  CONSTANTS:
    BEGIN OF zcx_biz_error_cds_component,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO_UTIL',
      msgno TYPE symsgno VALUE '005',
      attr1 TYPE scx_attrname VALUE 'COMPONENT_NAME',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_cds_component.

    CONSTANTS:
    BEGIN OF zcx_biz_error_component_nf,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO_UTIL',
      msgno TYPE symsgno VALUE '006',
      attr1 TYPE scx_attrname VALUE 'COMPONENT_NAME',
      attr2 TYPE scx_attrname VALUE 'CDS_VIEW',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_component_nf.

ENDINTERFACE.

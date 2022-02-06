INTERFACE zif_bizland_dao_exception
  PUBLIC .
  DATA:
        opcode TYPE char8.
  CONSTANTS:
    BEGIN OF zcx_biz_error_initial_checks,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO',
      msgno TYPE symsgno VALUE '001',
      attr1 TYPE scx_attrname VALUE 'OPCODE',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_initial_checks.

  CONSTANTS:
    BEGIN OF zcx_biz_error_struct_checks,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO',
      msgno TYPE symsgno VALUE '002',
      attr1 TYPE scx_attrname VALUE 'OPCODE',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_struct_checks.

  CONSTANTS:
    BEGIN OF zcx_biz_error_where_cond_chk,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO',
      msgno TYPE symsgno VALUE '003',
      attr1 TYPE scx_attrname VALUE 'OPCODE',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_where_cond_chk.

  CONSTANTS:
    BEGIN OF zcx_biz_error_order_by_chk,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO',
      msgno TYPE symsgno VALUE '004',
      attr1 TYPE scx_attrname VALUE 'OPCODE',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_order_by_chk.

  CONSTANTS:
    BEGIN OF zcx_biz_error_structural_chk,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO',
      msgno TYPE symsgno VALUE '005',
      attr1 TYPE scx_attrname VALUE '',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_structural_chk.

  CONSTANTS:
    BEGIN OF zcx_biz_error_tabular_chk,
      msgid TYPE symsgid VALUE 'ZBIZ_DAO',
      msgno TYPE symsgno VALUE '006',
      attr1 TYPE scx_attrname VALUE '',
      attr2 TYPE scx_attrname VALUE '',
      attr3 TYPE scx_attrname VALUE '',
      attr4 TYPE scx_attrname VALUE '',
    END OF zcx_biz_error_tabular_chk.


ENDINTERFACE.

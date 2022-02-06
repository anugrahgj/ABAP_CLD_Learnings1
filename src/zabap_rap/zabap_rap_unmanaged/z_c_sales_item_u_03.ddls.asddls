//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sale Order Projection View'
define view entity z_c_sales_item_u_03 as projection on Z_I_Sales_Item_U_03 
{
    key sales_doc_num,
    key item_position,
    mat_num,
    mat_desc,
    unit_cost,
    total_item_cost,
    cost_currency,
    quantity,
    unit,
    last_changed,
    /* Associations */
    _SHead_U_03 : redirected to parent z_c_sales_doc_u_03
}

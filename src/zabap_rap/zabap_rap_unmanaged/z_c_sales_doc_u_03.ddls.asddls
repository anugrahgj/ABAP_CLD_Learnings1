//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sale Order Projection View'
define root view entity z_c_sales_doc_u_03 as projection on z_i_sales_header_u_03 
{
    key sales_doc_num,
    date_created,
    person_created,
    sales_org,
    sales_dist,
    sales_div,
    total_cost,
    cost_currency,
    block_status,
    block_status_msg,
    last_changed,
    /* Associations */
    _SItem_U_03 : redirected to composition child z_c_sales_item_u_03
}

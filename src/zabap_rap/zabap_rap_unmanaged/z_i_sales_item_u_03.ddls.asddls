@AbapCatalog.sqlViewName: 'ZSITEMM_03'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sale Order Item CDS View'

define view Z_I_Sales_Item_U_03 as select from Z_I_Sales_Item_02
association to parent Z_I_Sales_Header_U_03 as _SHead_U_03
    on $projection.sales_doc_num = _SHead_U_03.sales_doc_num {
    
    //Z_I_Sales_Item_02
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
    //Z_I_Sales_Item_02
    _SHead_U_03
    
    
}



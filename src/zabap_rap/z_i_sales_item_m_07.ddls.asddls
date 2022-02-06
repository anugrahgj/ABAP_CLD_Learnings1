@AbapCatalog.sqlViewName: 'ZSITEM_07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Item Composite View'
define view Z_I_Sales_Item_M_07 as select from Z_I_Sales_Item_07
association to parent Z_I_Sales_Header_M_07 as _SHeadM_07
    on $projection.sales_doc_num = _SHeadM_07.sales_doc_num
 {

        key sales_doc_num,
        key item_position,
        mat_num,
        mat_desc,
        unit_cost,
        total_item_cost,
        cost_currency,
        quanity,
        unit,
        last_changed,
        /* Associations */
       // _SD_Head_07
       _SHeadM_07
    
}



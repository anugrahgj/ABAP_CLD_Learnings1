@AbapCatalog.sqlViewName: 'ZISOHEAD_7'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Doc Basic View'
@ObjectModel.representativeKey: 'sales_doc_num'
@ObjectModel.semanticKey: ['sales_doc_num']

define view Z_I_Sales_Header_07 as select from zvbak_07
    association [0..*] to Z_I_Sales_Item_07 as _SD_Item_07
    on $projection.sales_doc_num = _SD_Item_07.sales_doc_num

 {

    key vbeln as sales_doc_num,
    erdat as date_created,
    
    @Semantics.user.createdBy: true
    ernam as person_created,
    vkorg as sales_org,
    vtweg as sales_dist,
    spart as sales_div,
    @Semantics.amount.currencyCode: 'cost_currency'
    netwr as total_cost,
    waerk as cost_currency,
    faksk as block_status,
    
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_timestamp as last_changed,
    
    _SD_Item_07
    
}



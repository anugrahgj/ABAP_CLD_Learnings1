@AbapCatalog.sqlViewName: 'ZISOITEM_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Sales Item'

define view Z_I_Sales_Item_02 as select from zvbap_02
association [1..1] to Z_I_Sales_Header_02 as _SD_Head_03
    on $projection.sales_doc_num = _SD_Head_03.sales_doc_num {
    
   //ZVBAP_02
   @ObjectModel.foreignKey.association: '_SD_Head_03'
   key vbeln as sales_doc_num,
   key posnr as item_position,
   matnr    as mat_num,
   @Semantics.text: true
   arktx    as mat_desc,
   @Semantics.amount.currencyCode:'cost_currency'
   netpr    as unit_cost,
   @Semantics.amount.currencyCode:'cost_currency'
   netwr    as total_item_cost,
   @Semantics.currencyCode: true
   waerk    as cost_currency,
   @Semantics.quantity.unitOfMeasure: 'unit'
   kpein    as quantity,
   @Semantics.unitOfMeasure: true
   kmein    as unit,
   @Semantics.systemDateTime.createdAt: true    
   last_changed_timestamp as last_changed,
   
   _SD_Head_03
}


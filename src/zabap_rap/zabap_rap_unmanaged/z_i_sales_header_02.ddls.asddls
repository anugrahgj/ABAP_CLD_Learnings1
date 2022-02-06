@AbapCatalog.sqlViewName: 'ZISOHEAD_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Doc'
@ObjectModel.representativeKey: 'sales_doc_num'
@ObjectModel.semanticKey: ['sales_doc_num']

define view Z_I_Sales_Header_02 as select from zvbak_02
     association [0..*] to Z_I_Sales_Item_02 as _SD_Item_03
     on $projection.sales_doc_num = _SD_Item_03.sales_doc_num
    
 {
 
   //zvbak_02
   
   key vbeln as sales_doc_num,
   
   //Create Date Created manually at the time of new record created
   erdat    as date_created,
   
   @Semantics.user.createdBy: true
   ernam    as person_created,
   
   vkorg    as sales_org,
   vtweg    as sales_dist,
   spart    as sales_div,
   @Semantics.amount.currencyCode:'cost_currency'
   netwr    as total_cost,
   @Semantics.currencyCode: true
   waerk    as cost_currency,
   faksk    as block_status,
   @Semantics.systemDateTime.lastChangedAt: true
   last_changed_timestamp as last_changed,
   
   _SD_Item_03
   
}


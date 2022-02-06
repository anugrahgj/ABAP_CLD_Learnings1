@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo'
define view entity ZCDS_DEMO
  as select from Z_I_Sales_Header_07
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
 last_changed,
 /* Associations */
 _SD_Item_07
}

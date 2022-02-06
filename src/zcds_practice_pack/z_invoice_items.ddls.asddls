@AbapCatalog.sqlViewName: 'Z_ITEM_INVOICE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Invoice Items'
define view Z_INVOICE_ITEMS 
//with parameters s_agentid : abap.char( 6 )
as select from zfe_atrav_000022

{
key travel_uuid as TravelUuid,
 travel_id as TravelId,
 agency_id as AgencyId,
 customer_id as CustomerId,
 begin_date as BeginDate,
 end_date as EndDate,
 booking_fee as BookingFee,
 total_price as TotalPrice,
 end_date,
 
 (booking_fee - total_price) as commission


}

//where agency_id = '070041' and customer_id = '000202'
//where agency_id = $parameters.s_agentid

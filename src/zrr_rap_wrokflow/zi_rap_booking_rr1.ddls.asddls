@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forBooking'
define root view entity ZI_RAP_BOOKING_RR1
  as select from ZRAP_BOOK

{
  key BOOKING_UUID as BookingUUID,
  TRAVEL_UUID as TravelUUID,
  BOOKING_ID as BookingID,
  BOOKING_DATE as BookingDate,
  CUSTOMER_ID as CustomerID,
  CARRIER_ID as CarrierID,
  CONNECTION_ID as ConnectionID,
  FLIGHT_DATE as FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  FLIGHT_PRICE as FlightPrice,
  CURRENCY_CODE as CurrencyCode,
  @Semantics.user.createdBy: true
  CREATED_BY as CreatedBy,
  @Semantics.user.lastChangedBy: true
  LAST_CHANGED_BY as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt

  
}

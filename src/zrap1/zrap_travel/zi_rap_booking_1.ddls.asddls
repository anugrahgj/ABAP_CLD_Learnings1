@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking View'
define view entity ZI_RAP_Booking_1
  as select from zrap_abook_1 as Booking
  
  association to parent ZI_RAP_TRAVEL_1   as _Travel     on  $projection.TravelUUID = _Travel.TravelUUID

  association [1..1] to /DMO/I_Customer   as _Customer   on  $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier    as _Carrier    on  $projection.CarrierID = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection as _Connection on  $projection.CarrierID    = _Connection.AirlineID
                                                         and $projection.ConnectionID = _Connection.ConnectionID
  association [1..1] to /DMO/I_Flight     as _Flight     on  $projection.CarrierID    = _Flight.AirlineID
                                                         and $projection.ConnectionID = _Flight.ConnectionID
                                                         and $projection.FlightDate   = _Flight.FlightDate
  association [0..1] to I_Currency        as _Currency   on  $projection.CurrencyCode = _Currency.Currency
{
  key BOOKING_UUID          as BookingUUID,
      TRAVEL_UUID           as TravelUUID,
      BOOKING_ID            as BookingID,
      BOOKING_DATE          as BookingDate,
      CUSTOMER_ID           as CustomerID,
      CARRIER_ID            as CarrierID,
      CONNECTION_ID         as ConnectionID,
      FLIGHT_DATE           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FLIGHT_PRICE          as FlightPrice,
      CURRENCY_CODE         as CurrencyCode,
      @Semantics.user.createdBy: true
      CREATED_BY            as CreatedBy,
      @Semantics.user.lastChangedBy: true
      LAST_CHANGED_BY       as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
      _Travel,
      _Connection,
      _Flight,
      _Carrier,
      _Currency,
      _Customer
}

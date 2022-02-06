@AbapCatalog.sqlViewName: 'ZCBOOKINGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zkast_c_booking_r'
define view zkast_c_booking_r
  as select from /dmo/booking as Booking
  association [1..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID

{
  key travel_id                         as TravelId,
  key booking_id                        as BookingId,
      booking_date                      as BookingDate,
      customer_id                       as CustomerId,
      carrier_id                        as CarrierId,
      connection_id                     as ConnectionId,
      flight_date                       as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price                      as FlightPrice,
      currency_code                     as CurrencyCode,


      @Semantics.amount.currencyCode: 'CurrencyCode'
      @Aggregation.default: #SUM
      CURRENCY_CONVERSION(
      amount => Booking.flight_price,
      source_currency => Booking.currency_code,
      target_currency => cast( 'EUR' as abap.cuky ),
      exchange_rate_date => cast( '20200420' as abap.dats ),
      error_handling => 'SET_TO_NULL' ) as ConvertedFlightPrice,

      _Customer.CountryCode             as CountryCode,

      @Aggregation.referenceElement: ['BookingID']
      @Aggregation.default: #COUNT_DISTINCT
      cast( 1 as abap.int4 )            as DistinctBookings

}

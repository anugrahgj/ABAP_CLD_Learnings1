@EndUserText.label: 'Booking consumption'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity zc_booking
  as projection on zi_booking_tp
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _BookSupl : redirected to composition child zc_booksupl,
      _Travel: redirected to parent zc_travel
}

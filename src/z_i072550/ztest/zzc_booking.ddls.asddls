@EndUserText.label: 'Booking Consumption View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true

define view entity zzc_booking
  as projection on zzi_booking_tp
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
      _BookSupplement: redirected to composition child zzc_booksuppl,
      _Travel : redirected to parent zzc_travel
}

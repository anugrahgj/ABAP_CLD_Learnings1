@EndUserText.label: 'booking suppl consumption'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity zc_booksupl
  as projection on zi_booksupl_tp
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking: redirected to parent zc_booking,
      _Travel: redirected to zc_travel
}

@EndUserText.label: 'Booking Supplement Consumption View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true

define view entity zzc_booksuppl
  as projection on zzi_booksuppl_tp
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking: redirected to parent zzc_booking,
      _Travel: redirected to zzc_travel
}

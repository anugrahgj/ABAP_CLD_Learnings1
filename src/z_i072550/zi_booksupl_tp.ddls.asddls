@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'booking suppl tp'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity zi_booksupl_tp
  as select from zi_booksupl
  association        to parent zi_booking_tp as _Booking on  $projection.BookingId = _Booking.BookingId
                                                         and $projection.TravelId  = _Booking.TravelId
  association [1..1] to zi_travel_tp            as _Travel  on  $projection.TravelId = _Travel.TravelId
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,

      _Travel,
      _Booking
}

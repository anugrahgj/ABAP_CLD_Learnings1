@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking Supplement Interface View TP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity zzi_booksuppl_tp
  as select from zzi_booksuppl
  association        to parent zzi_booking_tp as _Booking on  $projection.TravelId  = _Booking.TravelId
                                                          and $projection.BookingId = _Booking.BookingId
  association [1..1] to zzi_travel_tp         as _Travel  on  $projection.TravelId = _Travel.TravelId
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,

      _Booking,
      _Travel
}

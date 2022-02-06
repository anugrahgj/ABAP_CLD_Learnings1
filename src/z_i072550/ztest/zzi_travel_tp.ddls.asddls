@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel Interface View TP'
define root view entity zzi_travel_tp
  as select from zzi_travel
  composition [0..*] of zzi_booking_tp as _Booking
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      @Semantics.user.createdBy: true
      CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      CreatedAt,
      @Semantics.user.lastChangedBy: true
      LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LastChangedAt,

      _Booking // Make association public
}

@EndUserText.label: 'travel consumption'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity zc_travel
  as projection on zi_travel_tp
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Booking: redirected to composition child zc_booking
}

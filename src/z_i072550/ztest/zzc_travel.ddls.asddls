@EndUserText.label: 'Travel Consumption View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true

define root view entity zzc_travel
  as projection on zzi_travel_tp
{
  key     TravelId,
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

          @Semantics.amount.currencyCode: 'CurrencyCode'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_NEWPRICE_CALC'
          @UI.identification: [{ position: 100, importance: #HIGH }]
          @EndUserText.label: 'New fee '
  virtual NewPrice : ztotal_price,
          /* Associations */
          _Booking : redirected to composition child zzc_booking
}

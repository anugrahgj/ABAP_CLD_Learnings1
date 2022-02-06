@EndUserText.label: 'Projection View of Travel DATA'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_RAP_TRAVEL_U_123
  as projection on ZI_RAP_TRAVEL_U_123
{

  key TravelId,

      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Agency', element: 'AgencyID' } } ]
      AgencyId,

      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Customer', element: 'CustomerID' } } ]
      CustomerId,

      BeginDate,

      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]
      CurrencyCode,
      
      Description,
      
      Status,
      
      Createdby,
      
      Createdat,
      Lastchangedby,
      
      Lastchangedat,
      /* Associations */
      _agency,
      
      _Booking : redirected to composition child ZC_RAP_Booking_U_123,
      
      _Currency,
      
      _Customer
}

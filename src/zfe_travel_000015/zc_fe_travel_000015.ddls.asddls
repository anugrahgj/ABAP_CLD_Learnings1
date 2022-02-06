@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZC_FE_TRAVEL_000015
  as projection on ZI_FE_TRAVEL_000015
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.10
      @EndUserText.label: 'Travel'
      @ObjectModel.text.element: ['Description']
      TravelID,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]

      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: ['AgencyName']
      AgencyID,
      _Agency.Name       as AgencyName,

      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: ['LastName']
      @Consumption.valueHelpDefinition: [{
        entity:{
            name: '/DMO/I_Customer',
            element: 'CustomerID'
        }
      }]
      CustomerID,
      _Customer.LastName as LastName,

      @EndUserText.label: 'Start Date'
      BeginDate,

      @EndUserText.label: 'End Date'
      EndDate,

      @EndUserText.label: 'Booking Fee'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @EndUserText.label: 'Total Price'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,
      Description,

      @EndUserText.label: 'Status'
      @ObjectModel.text.element: ['TravelStatus']
      @Consumption.valueHelpDefinition: [{
       entity:{
           name: 'ZI_FE_STAT_000015',
           element: 'TravelStatusId'
       }
     }]
      OverallStatus,
      _TravelStatus.TravelStatusText as TravelStatus,
      
      OverAllStatusCriticality,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      _Booking : redirected to composition child ZC_FE_BOOKING_000015,
      _Agency,
      _Currency,
      _Customer,
      _TravelStatus

}

@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZC_FE_TRAVEL_000017
  as projection on ZI_FE_TRAVEL_000017
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @EndUserText.label: 'Voyage'
      @ObjectModel.text.element: ['Description']
      TravelID,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]
      @EndUserText.label: 'Agence'
      @ObjectModel.text.element: ['AgencyName']
      AgencyID,
      _Agency.Name       as AgencyName,
      @EndUserText.label: 'Client'
      @ObjectModel.text.element: ['LastName']
      @Consumption.valueHelpDefinition: [ {
      entity: {
        name: '/DMO/I_Customer',
        element: 'CustomerID'
      }
      } ]
      CustomerID,
      _Customer.LastName as LastName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
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
        @Consumption.valueHelpDefinition: [ {
      entity: {
        name: '/DMO/I_Overall_Status_VH',
        element: 'OverallStatus'
      }
      } ]
      @ObjectModel.text.element: ['statusText']
      @UI.textArrangement: #TEXT_ONLY
      OverallStatus,
      _TravelStatus.TravelStatusText as statusText,
      
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      _Booking : redirected to composition child ZC_FE_BOOKING_000017,
      _Agency,
      _Currency,
      _Customer,
      _TravelStatus

}

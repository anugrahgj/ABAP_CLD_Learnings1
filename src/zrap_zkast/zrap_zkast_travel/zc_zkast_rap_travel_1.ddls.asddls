@EndUserText.label: 'Travel BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_ZKAST_RAP_Travel_1
 provider contract transactional_query
  as projection on ZI_ZKAST_RAP_Travel as Travel
{
  key     TravelUUID,
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 1
          TravelID,
          //@Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID'}  }]
          @Consumption.valueHelpDefinition: [{ entity : {name: 'zce_rap_agency_1', element: 'AgencyId' } }]
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.7
          AgencyID,
          //_Agency.Name       as AgencyName,
          @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'}  }]
          @ObjectModel.text.element: ['CustomerName']
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 1
          CustomerID,
          _Customer.LastName as CustomerName,
          BeginDate,
          EndDate,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          BookingFee,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          TotalPrice,
          @Consumption.valueHelpDefinition: [{ entity : {name: 'I_Currency', element: 'Currency'}  }]
          CurrencyCode,
          Description,
          TravelStatus,
          CreatedBy,
          CreatedAt,
          LastChangedBy,
          LastChangedAt,
          LocalLastChangedAt,
          @Consumption.valueHelpDefinition: [{ entity : {name: 'zkast_i_travel_sts_m', element: 'TrvSttsDesc'}  }]
          _TrvStatus.TrvSttsDesc as TrvStts,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_CUST_INITIAL'
  virtual CustImageURL      : abap.string( 256 ),

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_STATUS_CRTCLT'
  virtual StatusCriticality : abap.int1,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:Z_SHOWFIELD'
  virtual testField         : abap_boolean,

          /* Associations */
          _Agency,
          @Search.defaultSearchElement: true
          _Booking : redirected to composition child ZC_ZKAST_RAP_Booking,
          _Currency,
          _Customer,
          _TrvStatus
}

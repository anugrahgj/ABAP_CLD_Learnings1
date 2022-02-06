@EndUserText.label: 'Booking BO projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

define view entity ZC_ZKAST_RAP_Booking
  as projection on ZI_ZKAST_RAP_Booking as Booking

{
  key     BookingUUID,
          TravelUUID,
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.7
          BookingID,
          BookingDate,
          @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
          @ObjectModel.text.element: ['CustomerName']
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.7
          CustomerID,
          _Customer.LastName                as CustomerName,
          @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Carrier', element: 'AirlineID' }}]
          @ObjectModel.text.element: ['CarrierName']
          CarrierID,
          _Carrier.Name                     as CarrierName,
          @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                                               additionalBinding: [ { localElement: 'CarrierID',    element: 'AirlineID' },
                                                                    { localElement: 'FlightDate',   element: 'FlightDate',   usage: #RESULT},
                                                                    { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT },
                                                                    { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
          ConnectionID,
          FlightDate,
          @Semantics.amount.currencyCode: 'CurrencyCode'
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 1
          FlightPrice,
          @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
          CurrencyCode,
          LocalLastChangedAt,
          @Consumption.valueHelpDefinition: [{entity: {name: 'zkast_i_gender_m', element: 'Gender' }}]
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 1
          Gender,
          
         _Carrier.AirlineID as AirlineID,
          
//          ConvertedFlightPrice,
//          DistinctBookings,


          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_CUST_INITIAL'
  virtual CustImageURL1 : abap.string( 256 ),
  
            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_CUST_INITIAL'
  virtual dummy1 : abap.int8,
  
              @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_CUST_INITIAL'
  virtual dummy2 : abap.int8,
  
  
          /* associations */
          //       @Search.fuzzinessThreshold: 1
          _Travel : redirected to parent ZC_ZKAST_RAP_Travel_1,
          _Customer,
          _Carrier,
          _Connection,
          _Flight
}

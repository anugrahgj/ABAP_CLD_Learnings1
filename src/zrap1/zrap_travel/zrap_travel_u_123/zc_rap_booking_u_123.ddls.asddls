@EndUserText.label: 'Projection View of Booking DATA'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_RAP_BOOKING_U_123
  as projection on ZI_RAP_Booking_U_123
{
      @Search.defaultSearchElement: true
  key TravelId,
  
      @Search.defaultSearchElement: true
  key BookingId,
  
      BookingDate,
      
      @Consumption.valueHelpDefinition: [ { entity: { name:     '/DMO/I_Customer',
                                                   element:     'CustomerID' } } ]
      CustomerId,
      
      @Consumption.valueHelpDefinition: [ { entity: { name:     '/DMO/I_Carrier',
                                                   element:     'AirlineID' } } ]
      CarrierId,
      
      @Consumption.valueHelpDefinition: [ { entity: { name:    '/DMO/I_Flight',
                                                      element: 'ConnectionID' },
                                            additionalBinding: [ { localElement: 'FlightDate',
                                                                   element:      'FlightDate',
                                                                   usage: #RESULT },
                                                                 { localElement: 'CarrierID',
                                                                        element: 'AirlineID',
                                                                          usage: #RESULT },
                                                                 { localElement: 'FlightPrice',
                                                                        element: 'Price',
                                                                          usage: #RESULT },
                                                                 { localElement: 'CurrencyCode',
                                                                        element: 'CurrencyCode',
                                                                          usage: #RESULT } ]
                                            } ]
      ConnectionId,
      
      FlightDate,
      
      FlightPrice,

      @Consumption.valueHelpDefinition: [ {entity: { name:    'I_Currency',
                                                     element: 'Currency' } } ]
      CurrencyCode,

      /* Associations */
      _Carrier,
      
      _Customer,
      
      _Travel : redirected to parent ZC_RAP_TRAVEL_U_123
}

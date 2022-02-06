@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Defintion for Table Connection'

@UI.headerInfo.typeName: 'Connection'
@UI.headerInfo.typeNamePlural: 'Connections'

define view entity ZRK_RAP_I_CONNECTION as select from zrk_connection as Connection {

        @UI.facet: [{ id: 'Connection',
                      purpose: #STANDARD,
                      type: #IDENTIFICATION_REFERENCE,
                      label: 'Connection'
                   }]
                                            
        @UI.lineItem: [{position: 10, label: 'Airling' }]
        @UI.identification: [{position: 10, label: 'Airline' }]        
    key carrier_id      as CarrierId,
            
        @UI.lineItem: [{position: 20, label: 'Connection Number' }]
        @UI.identification: [{position: 20, label: 'Connection Number' }]        
    key connection_id   as ConnectionId,
    
        @UI.lineItem: [{position: 30, label: 'Departure Airport Code' }]
        @UI.identification: [{position: 30, label: 'Departure Airport Code' }]        
        airport_from_id as AirportFromId,
                
        @UI.lineItem: [{position: 40, label: 'Destination Airport Code' }]        
        @UI.identification: [{position: 40, label: 'Destination Airport Code' }]        
        airport_to_id   as AirportToId,
                
        @UI.lineItem: [{position: 50, label: 'Departure Time' }]
        @UI.identification: [{position: 50, label: 'Departure Time' }]        
        departure_time  as DepartureTime,
        
        @UI.lineItem: [{position: 60, label: 'Arrival Time' }]
        @UI.identification: [{position: 60, label: 'Arrival Time' }]        
        arrival_time    as ArrivalTime,
        
        @Semantics.quantity.unitOfMeasure: 'DistanceUnit'        
        @UI.identification: [{position: 70, label: 'Distance' }]
        @UI.lineItem: [{position: 70, label: 'Distance' }]      
        distance        as Distance,        
        @UI.identification: [{position: 80, label: 'DistanceUnit' }]        
        distance_unit   as DistanceUnit
        
              
}

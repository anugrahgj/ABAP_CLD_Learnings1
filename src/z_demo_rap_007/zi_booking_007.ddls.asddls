@AbapCatalog.sqlViewName: 'ZV_BOOKING_007'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Deifinition for Booking'
@Search.searchable: true

@UI: {
      headerInfo: {
      typeName: 'BookingID',
      typeNamePlural: 'BookingIDs',
      title: { type: #STANDARD, value: 'ID' }
      }
    }

define view ZI_BOOKING_007 
  as select from ztbooking_007 as Booking
  association [0..1] to I_Country as _Country on $projection.country = _Country.Country
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{

    @UI.facet: [
    { 
      id:      'BookingID',
      purpose: #STANDARD,
      type:    #IDENTIFICATION_REFERENCE,
      label:   'BookingID',
      position: 10 }    
    ]
    
    @UI: {
           lineItem: [ { position: 10, importance: #HIGH, label: 'Booking ID' } ],
           identification:[ { position: 10, label: 'Booking ID' } ]
         }
    key bookingid                   as ID,
    
        @UI: {
           lineItem: [ { position: 20, importance: #HIGH, label: 'Customer' } ],
           identification:[ { position: 10, label: 'Customer' } ]
         }
         
        @Search.defaultSearchElement: true
        customername                as CustomerName,
        
    @UI: {
           lineItem: [ { position: 30, importance: #HIGH, label: 'No of Passengers' } ],
           identification:[ { position: 10, label: 'No of Passengers' } ]
         }        
        numberofpassengers          as NumberOfPassengers,
        
    @UI: {
           lineItem: [ { position: 40, importance: #HIGH, label: 'Email ID' } ],
           identification:[ { position: 40, label: 'Email ID' } ]
         }        
        emailaddress                as EmailAddress,
        
    @UI: {
           lineItem: [ { position: 50, importance: #HIGH, label: 'Country' } ],
           identification:[ { position: 50, label: 'Country' } ]
         }         
        country,   
        
    @UI: {
           identification:[ { position: 60, label: 'Booked on' } ]
         }         
        dateofbooking               as DateOfBooking,   
        
    @UI: {
           identification:[ { position: 70, label: 'Traveling on' } ]
         }            
        dateoftravel                as DateOfTravel,       
        
    @UI: {
           lineItem: [ { position: 80, importance: #HIGH, label: 'Price' } ],
           identification:[ { position: 80, label: 'Price' } ]
         }        
        @Semantics.amount.currencyCode : 'CurrencyCode'
        price,       
        
    @UI: {
           identification:[ { position: 90, label: 'Currency' } ]
         }               
        currencycode                as CurrencyCode,   
        
    @UI: {
           identification:[ { position: 100, label: 'Last Changed At' } ]
         }          
        lastchangedat               as LastChangedAt,
        
        //public associations
        _Country,
        _Currency 
}

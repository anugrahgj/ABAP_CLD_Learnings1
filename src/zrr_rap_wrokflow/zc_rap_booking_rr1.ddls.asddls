
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'projection view'

define root view entity ZC_RAP_BOOKING_RR1 as projection on ZI_RAP_BOOKING_RR1 {
  @UI.facet: [{ id: 'BookingUUID',
                    purpose: #STANDARD,
                    type: #IDENTIFICATION_REFERENCE,
                    label: 'Booking Id',
                    position: 10
       }]

      @UI             :{ 
      lineItem: [{position: 10, importance: #HIGH },
                { type: #FOR_ACTION, dataAction: 'approve', label: 'Raise Approval' } ],
          identification: [{position: 10  ,label: 'Approval' }],
          selectionField: [{position: 10 }]
          }
  
 key BookingUUID,
 @UI             :{lineItem: [{position: 20, importance: #HIGH ,label: 'Booking Id' }],
        identification: [{position: 20 }],
        selectionField: [{position: 20 }]} 
  TravelUUID,
   @UI             :{lineItem: [{position: 30, importance: #HIGH,label: 'Travel Id' }],
        identification: [{position: 30 }],
        selectionField: [{position: 30 }]
        } 
    
  BookingID,
  @UI             :{lineItem: [{position: 40, importance: #HIGH ,label: 'Booking Date'  }],
        identification: [{position: 40 }],
        selectionField: [{position: 40 }]} 
  BookingDate,
  @UI             :{lineItem: [{position: 50, importance: #HIGH ,label: 'Customer ID'  }],
        identification: [{position: 50 }],
        selectionField: [{position: 50 }]} 
  CustomerID,
   @UI             :{lineItem: [{position: 60, importance: #HIGH ,label: 'Carrier ID'  }],
        identification: [{position: 60 }],
        selectionField: [{position: 60 }]} 
  CarrierID,
  ConnectionID,
     @UI             :{lineItem: [{position: 70, importance: #HIGH ,label: ' Flight Date'  }],
        identification: [{position: 70 }],
        selectionField: [{position: 70 }]} 
  FlightDate,
      @UI             :{lineItem: [{position: 80, importance: #HIGH ,label: ' Flight Price'  }],
        identification: [{position: 80 }],
        selectionField: [{position: 80 }]} 
  FlightPrice,
      @UI             :{lineItem: [{position:  90, importance: #HIGH ,label: ' Currency Code'  }],
        identification: [{position: 90 }]} 
  CurrencyCode,
      @UI             :{lineItem: [{position: 100, importance: #HIGH ,label: 'Created By'  }],
        identification: [{position: 100 }]} 
  CreatedBy,
  LastChangedBy,
  LocalLastChangedAt
}

@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Projection View'
@UI: {
 headerInfo: { typeName: 'Purchasing Order Details', typeNamePlural: 'Purchasing Orders' } 
 }

define root view entity ZPR_VIEW  as projection on Z_R_MODEL {
   @UI.facet: [      { id:             'POHeader',
                      type:            #IDENTIFICATION_REFERENCE,
                      label:           'PO Header',
                      position:        10,
                      purpose:         #STANDARD
                      },
                      
                      
                      { id:            'Item',
                      purpose:         #STANDARD,
                      type:            #LINEITEM_REFERENCE,
                      label:           'PO Item Plus',
                      targetElement:   'items',
                      position:        20
                      }
                    
                  ]
    @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ] , selectionField: [ { position: 10 }] , identification: [ { position: 10} ]}
    @Search.defaultSearchElement: true
    @EndUserText.label: 'Purchasing Document'
    key po_order,
    @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ] , selectionField: [ { position: 20 }],  identification: [ { position: 20} ] }
    @EndUserText.label: 'Company Code'
    @Search.defaultSearchElement: true
    comp_code,
    @UI: {
          lineItem:       [ { position: 30, importance: #HIGH } ] , selectionField: [ { position: 30 }], identification: [ { position: 30} ]}
    @EndUserText.label: 'Document Type'
    @Search.defaultSearchElement: true
    doc_type,
    @UI: {
          lineItem:       [ { position: 40, importance: #HIGH } ]}
    @EndUserText.label: 'Vendor'
    vendor,
     @UI: {
          lineItem:       [ { position: 50, importance: #HIGH } ]}
    @EndUserText.label: 'Status'
    status,
    @UI: {
          lineItem:       [ { position: 60, importance: #HIGH } ]}
    @EndUserText.label: 'Created By'
    created_by,
    @UI: {
          lineItem:       [ { position: 70, importance: #HIGH } ]}
    @EndUserText.label: 'Created At'
    created_at ,
    
    items
}

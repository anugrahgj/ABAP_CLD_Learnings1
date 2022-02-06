@EndUserText.label: 'ZBI_S07_ACCUMULATED_REVIEW_SUM ALL'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZBI_S07_ACCU_REVIEW_SUM_ALL_PV
  as projection on ZBI_S07_ACCU_REVIEW_SUM_ALL

{
   @UI.facet: [ { id:              'Project',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Project ID',
                     position:        10 } ]
      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Project ID' } ],
          selectionField: [ { position: 10 } ] }

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.1
      @EndUserText.label: 'Project ID'
  key project,
  
      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20, label: 'Year and Month' } ],
      selectionField: [ { position: 20 } ] }
      @EndUserText.label: 'Start Month'
  key startMonth,
  
      @UI: {
        lineItem:       [ { position: 30, importance: #MEDIUM } ],
        identification: [ { position: 30, label: 'Responder'} ]}
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.1
      @EndUserText.label: 'Responder'
  key responder,
  
  key review_place,
      @UI: {
        lineItem:       [ { position: 40, importance: #MEDIUM } ],
        identification: [ { position: 40, label: 'Miss count'} ]}
      @EndUserText.label: 'Miss count'
      @Aggregation.default: #SUM
      accu_review_Num,
      
      @UI: {
        lineItem:       [ { position: 50, importance: #MEDIUM } ],
        identification: [ { position: 50, label: 'Simple Miss'} ]}
      @EndUserText.label: 'Simple Miss'
      @Aggregation.default: #SUM
      accu_simple_Num
}


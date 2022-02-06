@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for Review Miss Analysis'
@Search.searchable: true
define root view entity ZBI_S03_REVIEW_SUM_PV
  as projection on ZBI_S03_REVIEW_SUM
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
  key projectId,
  
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
      review_Num,
      
      @UI: {
        lineItem:       [ { position: 50, importance: #MEDIUM , criticality: 'simple_NumCriticality'} ],
        identification: [ { position: 50, label: 'Simple Miss', criticality: 'simple_NumCriticality'} ]}
      @EndUserText.label: 'Simple Miss'
      @Aggregation.default: #SUM
      // @UI.lineItem: [{ position: 80, criticality: 'simple_NumCriticality' }]
      @ObjectModel.text.element: ['simple_NumtText']
      @UI.textArrangement: #TEXT_ONLY
      simple_Num,
      simple_NumtText,

      //@UI: {
      //  lineItem:       [ { position: 60, importance: #MEDIUM } ],
    //    identification: [ { position: 60, label: 'simple_NumCriticality'} ]}
  //    @EndUserText.label: 'Simple NumCriticality'
      simple_NumCriticality

}

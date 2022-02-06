@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for Week Review Analysis'
@Search.searchable: true
define root view entity ZBI_S06_WEEK_REVIEW_SUM_PV
  as projection on ZBI_S06_WEEK_REVIEW_SUM
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
      identification: [ { position: 20, label: 'Week Start' } ],
      selectionField: [ { position: 20 } ] }
      @EndUserText.label: 'Week Start'
  key WeekStart,
  
      @UI: {
        lineItem:       [ { position: 30, importance: #MEDIUM } ],
        identification: [ { position: 30, label: 'Rreview Place'} ]}
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.1
      @EndUserText.label: 'Rreview Place'
  key reviewPlace,
  
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
      @UI.hidden: true
      simple_NumCriticality

}

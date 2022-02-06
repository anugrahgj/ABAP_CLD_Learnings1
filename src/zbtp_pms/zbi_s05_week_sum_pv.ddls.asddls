@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for Weekly Report'
@Search.searchable: true
define root view entity ZBI_S05_WEEK_SUM_PV
  as projection on ZBI_S05_WEEK_SUM
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
  
     @UI.hidden: true
  key weeks,
  
      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20, label: 'Project Start' } ],
      selectionField: [ { position: 20 } ] }
      @EndUserText.label: 'Project Start'
     ProjectStart,
  
      @UI: {
        lineItem:       [ { position: 30, importance: #MEDIUM } ],
        identification: [ { position: 30, label: 'Week Start Date'} ]}
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Week Start Date'
      
      WeekStartDate,
      
        @UI: {
            lineItem:       [ { position: 40, importance: #MEDIUM } ],
            identification: [ { position: 40, label: 'Plan Count'} ]}
        @EndUserText.label: 'Plan count'
        @Aggregation.default: #SUM
        planSum      as PlanNum,

        @UI: {
            lineItem:       [ { position: 50, importance: #MEDIUM } ],
            identification: [ { position: 50, label: 'Finish Count'} ]}
        @EndUserText.label: 'Finished count'
        @Aggregation.default: #SUM
        finishSum    as FinishNum,

        @UI.identification: [ { position: 60, label: 'FinishRate' } ]
        @EndUserText.label: 'Finished rate(%)'
        rate          as FinishRate
}

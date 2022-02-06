@EndUserText.label: 'Projection view for finished'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZBC_S01_FINISH_RATE_CHART
  as projection on ZBI_S01_FINISH_RATE
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

        @EndUserText.label: 'Project ID'
        @Search.fuzzinessThreshold: 0.9
  key   projectId     as ProjectID,

        @UI: {
        lineItem:       [ { position: 20, importance: #HIGH } ],
        identification: [ { position: 20, label: 'Year and Month' } ],
        selectionField: [ { position: 20 } ] }
        @EndUserText.label: 'Start Date (Year/Month)'
  key   devStartMonth as DevStartMonth,

        @UI: {
            lineItem:       [ { position: 30, importance: #MEDIUM } ],
            identification: [ { position: 30, label: 'Plan Count'} ]}
        @EndUserText.label: 'Plan count'
        @Aggregation.default: #SUM
        plan_Num      as PlanNum,

        @UI: {
            lineItem:       [ { position: 40, importance: #MEDIUM } ],
            identification: [ { position: 40, label: 'Finish Count'} ]}
        @EndUserText.label: 'Finished count'
        @Aggregation.default: #SUM
        finish_Num    as FinishNum,

        @UI.identification: [ { position: 50, label: 'FinishRate' } ]
        @EndUserText.label: 'Finished rate(%)'
        rate          as FinishRate
}

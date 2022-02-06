@EndUserText.label: 'Projection view for finished'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
define root view entity ZBC_S01_FINISH_RATE
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
  key projectId as ProjectID,
  
      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20, label: 'Year and Month' } ],
      selectionField: [ { position: 20 } ] }
   key   devStartMonth as DevStartMonth,

      @UI: {
          lineItem:       [ { position: 30, importance: #MEDIUM } ],
          identification: [ { position: 30, label: 'Plan Count'} ]}
      plan_Num as PlanNum,
      
      @UI: {
          lineItem:       [ { position: 40, importance: #MEDIUM } ],
          identification: [ { position: 40, label: 'Finish Count'} ]}
      finish_Num as FinishNum,
      
 @UI.identification: [ { position: 50, label: 'FinishRate' } ]
      rate as FinishRate
}

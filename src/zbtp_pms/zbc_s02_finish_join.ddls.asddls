@EndUserText.label: 'ZBI_S02_FINISH_JOIN'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZBC_S02_FINISH_JOIN
  as projection on ZBI_S02_FINISH_JOIN
{
      @UI: {
             lineItem:       [ { position: 10, importance: #HIGH } ],
             identification: [ { position: 10, label: 'Project ID' } ] }
  key projectId,

      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ]}
      devStartMonth,
      @UI: {
      lineItem:       [ { position: 30, importance: #HIGH } ],
      identification: [ { position: 30 } ] }
      finish_count,
      @UI: {
      lineItem:       [ { position: 40, importance: #MEDIUM } ] }
      plan_count,
      @UI: {
        lineItem:       [ { position: 50} ],
        identification: [ { position: 50, label: 'Total RATE' } ] }
      rate,
      /* Associations */
      @UI.hidden: true
      _PLAN
}

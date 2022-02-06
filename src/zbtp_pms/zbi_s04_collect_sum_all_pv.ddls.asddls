@EndUserText.label: 'Projection view for Summy Analysis'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZBI_S04_COLLECT_SUM_ALL_PV
  as projection on ZBI_S04_COLLECT_SUM_ALL
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.1
      @EndUserText.label: 'Project ID'
  key project,

      @EndUserText.label: 'End Month'
  key endPeriod,

      @EndUserText.label: 'Plan count'
      @Aggregation.default: #SUM
      planSum,

      @EndUserText.label: 'Finished count'
      @Aggregation.default: #SUM
      finishSum,

      @EndUserText.label: 'Finished rate(%)'
      rate
}

@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for Finished Analysis'
@Search.searchable: true
define root view entity ZBC_S01_FINISH_RATE_PROJECTION
  as projection on ZBI_S01_FINISH_RATE
{
         @Search.defaultSearchElement: true
         @Search.fuzzinessThreshold: 0.9
  key    projectId     as projectId,

         @EndUserText.label: 'Start Date (Year/Month)'
  key    devStartMonth as devStartMonth,

         @EndUserText.label: 'Plan count'
         @Aggregation.default: #SUM
         plan_Num      as plan_Num,

         @EndUserText.label: 'Finished count'
         @Aggregation.default: #SUM
         finish_Num    as finish_Num,

         @EndUserText.label: 'Finished rate(%)'
         rate          as rate

}

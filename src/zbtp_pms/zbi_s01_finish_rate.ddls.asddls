@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'finished rate and count'
define root view entity ZBI_S01_FINISH_RATE
  as select from ZBI_S01_FINISH_SUM
{
  key    projectId,
  key    devStartMonth,
         plan_Num,
         finish_Num,
         division(finish_Num,plan_Num,2)*100  as rate
}

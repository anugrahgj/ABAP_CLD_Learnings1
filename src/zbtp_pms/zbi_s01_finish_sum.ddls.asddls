@EndUserText.label: 'finished summy'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S01_FINISH_SUM
  as select from ZBI_S01_FINISH
{
  key    projectId,
  key    devStartMonth,
         cast(sum(plan_count) as abap.int4) as plan_Num,
         cast(sum(finish_count) as abap.int4) as finish_Num
         //  division(Plan_Num,Finish_Num,4) as rate
}
group by
  projectId,
  devStartMonth

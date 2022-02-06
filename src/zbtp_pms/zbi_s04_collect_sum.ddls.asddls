@EndUserText.label: 'Finished summy'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S04_COLLECT_SUM
  as select from ZBI_S04_COLLECT as plan
{
  key    plan.projectId,
  key    plan.devStartMonth,
         cast(sum(plan.plan_count) as abap.int4)   as plan_Num,
         cast(sum(plan.finish_count) as abap.int4) as finish_Num
         //  division(Plan_Num,Finish_Num,4) as rate
}
group by
  plan.projectId,
  plan.devStartMonth

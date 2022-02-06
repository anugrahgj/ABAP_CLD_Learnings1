@EndUserText.label: 'ZBI_S05_WEEK_SUM'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZBI_S05_WEEK_SUM
  as select from ZBI_S05_WEEK_COUNT
{

  key   projectId                            as projectId, //project ID
  key   weeks1                               as weeks, //Weeks

        ProjectStart,                                          //Project start date
        weekstart                            as WeekStartDate, //start date
        cast(sum(plan_count) as abap.int4)   as planSum,
        cast(sum(finish_count) as abap.int4) as finishSum,
        division(sum(plan_count)*100 ,sum(finish_count),2) as rate

}
group by
  projectId,
  weeks1,
  ProjectStart,
  weekstart

@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Summy all items'
define root view entity ZBI_S04_COLLECT_SUM_ALL
  as select from    ZBI_S04_COLLECT_SUM as end
    left outer join ZBI_S04_COLLECT_SUM as start on  start.projectId     = end.projectId
                                                 and start.devStartMonth <= end.devStartMonth
{
  key end.projectId                                              as project,
  key end.devStartMonth                                          as endPeriod,

      cast(sum(start.plan_Num) as abap.int4)                     as planSum,
      cast(sum(start.finish_Num) as abap.int4)                   as finishSum,
      division(sum(start.finish_Num)*100 ,sum(start.plan_Num),2) as rate
}
group by
  end.projectId,
  end.devStartMonth

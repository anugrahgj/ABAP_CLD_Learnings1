@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'JOIN'
define root view entity ZBI_S02_FINISH_JOIN
  as select from ZBI_S02_FINISH_NUM
  association [1] to zbi_s02_plan_num as _PLAN on  $projection.projectId     = _PLAN.projectId
                                               and $projection.devStartMonth = _PLAN.devStartMonth
{
  key projectId,
      devStartMonth,
      finish_count,
      _PLAN.plan_count,
      division(finish_count,_PLAN.plan_count,4) as rate,
      _PLAN // Make association public
}

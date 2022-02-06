@EndUserText.label: 'ZBI_S05_DEVELOP_STARTDATE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S05_DEVELOP_STARTDATE
  as select from zbtp_schedule
{

  key project_id               as projectId, //project ID

      //计算每个项目的开始日期和结束日期
      min(dev_start_date_plan) as devStartdate, //start date
      max(dev_start_date_plan) as devEnddate //start date

}
group by
  project_id

@EndUserText.label: 'ZBI_S06_REVIEW_START'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S06_REVIEW_START
  as select from zbtp_reviewlist
{

  key project_id               as projectId, //project ID

      //计算每个项目的开始日期和结束日期
      min(review_date) as reviewStartdate, //start date
      max(review_date) as reviewEnddate //start date

}
group by
  project_id

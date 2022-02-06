
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'plan'
define view entity zbi_s02_plan as select from zbtp_schedule {
  key project_id                  as projectId,   //project ID

      left(dev_start_date_plan,6) as devStartMonth,  //YYYYmm
      1                           as plan_count     //Plan
}

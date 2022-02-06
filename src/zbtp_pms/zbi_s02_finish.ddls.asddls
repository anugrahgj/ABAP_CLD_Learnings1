
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'plan'
define view entity ZBI_S02_finish as select from zbtp_schedule {
  key project_id                  as projectId,   //project ID

      left(dev_start_date_plan,6) as devStartMonth,  //YYYYmm
      1                           as finish_count     //Plan
} where status = '納品済'

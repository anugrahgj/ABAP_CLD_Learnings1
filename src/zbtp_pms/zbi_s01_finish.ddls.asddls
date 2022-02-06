@EndUserText.label: 'Schedule finished'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S01_FINISH
  as select from zbtp_schedule
{

  key project_id                  as projectId, //project ID
  key seq_num                     as SeqNum,
  key dev_num                     as DevNum,
  key program_id                  as ProgramId,
      left(dev_start_date_plan,6) as devStartMonth, //YYYYmm
      1                           as plan_count, //Plan

      case
      when status = '納品済'
         then 1
      else 0
      end                         as finish_count //Finish
}

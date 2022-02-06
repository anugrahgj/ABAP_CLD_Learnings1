@EndUserText.label: 'Schedule finished'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S04_COLLECT
  as select from zbtp_schedule
{

  key project_id                  as projectId, //project ID
  key seq_num                     as SeqNum,
  key dev_num                     as DevNum,
  key program_id                  as ProgramId,
      left(dev_start_date_plan,6) as devStartMonth, //YYYYmm
      left(dev_start_date_act,6)  as actStartMonth, //YYYYmm
      case
      when status = '修正不要'
         then 0
      else 1
      end                        as plan_count, //Plan

      case
      when status = '納品済'
         then 1
      else 0
      end                         as finish_count //Finish
}

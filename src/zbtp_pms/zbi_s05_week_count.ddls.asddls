@EndUserText.label: 'ZBI_S05_WEEK_COUNT'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S05_WEEK_COUNT
  as select from zbtp_schedule             as _end
    inner join   ZBI_S05_DEVELOP_STARTDATE as _start on _end.project_id = _start.projectId
{

  key _end.project_id                              as projectId, //project ID
  key _end.seq_num                                 as SeqNum,
  key _end.dev_num                                 as DevNum,
  key _end.program_id                              as ProgramId,
      _start.devStartdate                          as ProjectStart,
      _end.dev_start_date_plan                     as devStart, //YYYYmmDD

      //计算 （当前日期和项目最小开始日直接的天数，然后除以7，计算出周数） 对应相应周数的开始日期
      dats_add_days(_start.devStartdate,
          div(dats_days_between(cast(_start.devStartdate as abap.dats),
          _end.dev_start_date_plan),7) * 7,'NULL') as weekstart,

      //计算 当前日期和项目最小开始日直接的天数，然后除以7，计算出周数
      div(dats_days_between(cast(_start.devStartdate as abap.dats),
          _end.dev_start_date_plan),7) + 1         as weeks1,

      case
      when _end.status = '修正不要'
         then 0
      else 1
      end                                          as plan_count, //Plan

      case
      when _end.status = '納品済'
         then 1
      else 0
      end                                          as finish_count //Finish
}

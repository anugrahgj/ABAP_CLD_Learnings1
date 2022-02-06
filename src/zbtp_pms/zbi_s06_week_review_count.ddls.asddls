@EndUserText.label: 'ZBI_S06_WEEK_REVIEW_COUNT'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S06_WEEK_REVIEW_COUNT
  as select from zbtp_reviewlist           as _end
    inner join   ZBI_S05_DEVELOP_STARTDATE as _start on _end.project_id = _start.projectId
{

  key _end.project_id                      as projectId, //project ID
  key _end.seq_num                         as SeqNum,
  key _end.program_id                      as ProgramId,
  key _end.review_date                     as review_date,
      _start.devStartdate                  as reviewStart,
     _end.review_place as reviewPlace,

      //计算 （当前日期和项目最小开始日直接的天数，然后除以7，计算出周数） 对应相应周数的开始日期
      dats_add_days(_start.devStartdate,
          div(dats_days_between(cast(_start.devStartdate as abap.dats),
          _end.review_date),7) * 7,'NULL') as WeekStart,

      //计算 当前日期和项目最小开始日直接的天数，然后除以7，计算出周数
      div(dats_days_between(cast(_start.devStartdate as abap.dats),
          _end.review_date),7) + 1         as weeks1,

      case
       when _end.siteki_class = '指摘なし'
          then 0
       else 1
       end                                 as review_count, //指摘数

      case
      when _end.reason_type = 'A03-不注意による簡単ミス'
         then 1
      else 0
      end                                  as simple_count //簡単ミス数
}

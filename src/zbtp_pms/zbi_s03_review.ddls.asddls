@EndUserText.label: 'zbtp_reviewlist'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S03_REVIEW
  as select from zbtp_reviewlist
{

  key project_id          as projectId, //project ID
  key seq_num             as seqNum,
  key program_id          as program_id,
  key review_date         as review_Date,
      responder           as responder,
      review_place,
      left(review_date,6) as startMonth, //YYYYmm

      case
       when siteki_class = '指摘なし'
          then 0
       else 1
       end                as review_count, //指摘数
       
      case
      when reason_type = 'A03-不注意による簡単ミス'
         then 1
      else 0
      end                 as simple_count //簡単ミス数

}

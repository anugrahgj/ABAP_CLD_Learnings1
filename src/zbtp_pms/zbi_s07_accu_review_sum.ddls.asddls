@EndUserText.label: 'ZBI_S07_ACCUMULATED_REVIEW_SUM'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZBI_S07_ACCU_REVIEW_SUM
  as select from ZBI_S07_ACCU_REVIEW_COUNT as plan


{
  key       plan.projectId,
  key       plan.startMonth                     as startMonth,
  key       responder                            as responder,
  key       review_place,
            cast(sum(review_count) as abap.int4) as review_Num,
            cast(sum(simple_count) as abap.int4) as simple_Num
}
group by
  plan.projectId,
  plan.startMonth,
  responder,
  review_place

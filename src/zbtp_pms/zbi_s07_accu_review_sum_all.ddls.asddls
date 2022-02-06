@EndUserText.label: 'ZBI_S07_ACCUMULATED_REVIEW_SUM ALL'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZBI_S07_ACCU_REVIEW_SUM_ALL
  as select from    ZBI_S07_ACCU_REVIEW_SUM as end
    left outer join ZBI_S07_ACCU_REVIEW_SUM as start on  start.projectId    = end.projectId
                                                     and start.responder    = end.responder
                                                     and start.review_place = end.review_place
                                                     and start.startMonth   <= end.startMonth
{
  key    end.projectId                            as project,
  key    end.startMonth                           as startMonth,
  key    end.responder,
  key    end.review_place,
         cast(sum(start.review_Num) as abap.int4) as accu_review_Num,
         cast(sum(start.simple_Num) as abap.int4) as accu_simple_Num
}
group by
  end.projectId,
  end.startMonth,
  end.responder,
  end.review_place

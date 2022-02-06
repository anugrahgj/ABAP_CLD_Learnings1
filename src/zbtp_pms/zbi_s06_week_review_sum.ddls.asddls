@EndUserText.label: 'Weekly Review Sum'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZBI_S06_WEEK_REVIEW_SUM
  as select from ZBI_S06_WEEK_REVIEW_COUNT
{
  key    projectId,
  key    WeekStart,
  key    reviewPlace,
         cast(sum(review_count) as abap.int4) as review_Num,
         cast(sum(simple_count) as abap.int4) as simple_Num,
         //division(review_Num , simple_Num, 4) as rate

         case cast(sum(simple_count) as abap.int4)
         when 0  then 3     -- 'Well done'      | 3: green colour
         when 1  then 2     -- 'Pay attention'  | 2: yellow colour
         when 2  then 2     -- 'Pay attention'  | 2: yellow colour
               else 1       -- 'Badly done'     | 1: red colour
         end                                  as simple_NumCriticality,

        cast( case cast(sum(simple_count) as abap.int4)
         when 0  then 'Well done'
         when 1  then 'Pay attention'
         when 2  then 'Pay attention'
                 else 'Badly done'
         end                          as abap.char( 30 )  )      as simple_NumtText

}
group by
  projectId,
  WeekStart,
  reviewPlace

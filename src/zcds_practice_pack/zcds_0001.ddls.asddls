@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Project plan'
define root view entity ZCDS_0001
      as select from ZBI_S01_FINISH_SUM
{
  key    projectId,
  key    devStartMonth,
         plan_Num,
         finish_Num,
         division(finish_Num,plan_Num,2)*100  as rate
}
    
 //   _association_name // Make association public

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface CDS View Userinfo 03'
define view entity ZSHF_I_USERINFO_M_03 as select from zshfuserinfo_03 
{
 key user_email as UserEmail,
 first_name ,
 last_name      
     
}

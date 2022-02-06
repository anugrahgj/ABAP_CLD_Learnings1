@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root CDS View für ZSHFUSERINFO_03'
@Metadata.allowExtensions: true
define root view entity ZSHF_C_USERINFO_M_03
  as select from ZSHF_I_USERINFO_M_03
{
  key UserEmail as Email,
  first_name,
  last_name   
                              
    
}

@EndUserText.label: 'ZKAST_C_EMPL_GNRL_DATA_U1'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define root view entity ZKAST_C_EMPL_GNRL_DATA_U1
  provider contract transactional_query
  as projection on ZKAST_I_EMPL_GNRL_DATA_U1
{
  key EmpId,
      EmpFirstName,
      EmpLastName,
      EmpAge,
      EmpGender,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat
}

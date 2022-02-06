@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Employee General Data'

define root view entity ZKAST_I_EMPL_GNRL_DATA_U1
  as select from zkast_a_emp_u
{
  key emp_id         as EmpId,
      emp_first_name as EmpFirstName,
      emp_last_name  as EmpLastName,
      emp_age        as EmpAge,
      emp_gender     as EmpGender,
      @Semantics.user.createdBy: true
      createdby      as Createdby,
      @Semantics.systemDateTime.createdAt: true
      createdat      as Createdat,
      @Semantics.user.lastChangedBy: true
      lastchangedby  as Lastchangedby,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat  as Lastchangedat

}

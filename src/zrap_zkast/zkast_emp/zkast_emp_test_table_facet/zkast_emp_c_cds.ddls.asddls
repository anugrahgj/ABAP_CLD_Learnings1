@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZKAST_EMP_C_CDS'

define root view entity ZKAST_EMP_C_CDS
  as select from zkast_emp_I_cds
{
  key EmpGnrUuid,
      EmpGnrId,
      EmpFirstName,
      EmpLastName,
      EmpCompany,
      EmpCompanyWebSite,
      EmpAge,
      EmpGender,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat
}

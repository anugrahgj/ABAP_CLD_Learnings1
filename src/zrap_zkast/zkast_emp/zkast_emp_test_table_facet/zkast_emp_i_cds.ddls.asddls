@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zkast_emp_I_cds'

define root view entity zkast_emp_I_cds
  as select from zkast_a_emp_u_1
{
  key emp_gnr_uuid         as EmpGnrUuid,
      emp_gnr_id           as EmpGnrId,
      emp_first_name       as EmpFirstName,
      emp_last_name        as EmpLastName,
      emp_company          as EmpCompany,
      emp_company_web_site as EmpCompanyWebSite,
      emp_age              as EmpAge,
      emp_gender           as EmpGender,
      createdby            as Createdby,
      createdat            as Createdat,
      lastchangedby        as Lastchangedby,
      lastchangedat        as Lastchangedat
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view'
@Metadata.allowExtensions: true

define view entity zi_rap_imp_data
  as select from zrap_emp_data1 as ImpData

  association to parent ZI_UX_TEAM as _Team on $projection.TeamUUID = _Team.Uuid

{
  key employee_uudd as EmployeeUUID,
      employee_id   as EmployeeId,
      team_uuid     as TeamUUID,
      first_name    as FirstName,
      last_name     as LastName,
      age           as Age,
      title         as Title,
      street        as Street,
      postal_code   as PostalCode,
      city          as City,
      country_code  as CountryCode,
      phone_number  as PhoneNumber,
      email_address as EmailAddress,
      @Semantics.user.createdBy: true
      createdby     as Createdby,
      @Semantics.systemDateTime.createdAt: true
      createdat     as Createdat,
      @Semantics.user.lastChangedBy: true
      lastchangedby as Lastchangedby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      lastchangedat as Lastchangedat,

      _Team
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for UX Team'

define root view entity ZI_UX_TEAM
  as select from zrap_ux_team as Team

  composition [0..*] of zi_rap_imp_data as _ImpData
{
  key uuid                            as Uuid,
      employee_id                     as EmployeeID,
      firstname                       as Firstname,
      lastname                        as Lastname,
      age                             as Age,
      role                            as Role,
      salary                          as Salary,
      active                          as Active,
      boolean_test                    as Boolean_test,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                 as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at           as LocalLastChangedAt,

      _ImpData
}

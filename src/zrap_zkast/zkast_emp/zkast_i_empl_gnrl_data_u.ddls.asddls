@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Employee General Data'

define root view entity ZKAST_I_Empl_Gnrl_Data_U
  as select from zkast_a_emp_u as _EmpGnr
  composition [0..1] of ZKAST_I_Empl_Inf_l_Data_U as _EmpInf
{
  key emp_id                                          as EmpId,

      emp_first_name                                  as EmpFirstName,
      emp_last_name                                   as EmpLastName,
      emp_age                                         as EmpAge,
      emp_gender                                      as EmpGender,

      emp_company                                     as EmpCompany,
      emp_company_web_site                            as EmpCompWebSite,

      case emp_gender
      when 'Male'    then 2    -- 'Male'    | 3: yellow colour
      when 'Female'  then 3    -- 'Female'  | 2: green colour
      when 'Other'   then 1    -- 'Other'   | 1: red colour
            else 0             -- 'nothing' | 0: unknown
      end                                             as OverallGenderCriticality,

      cast('00000000' as abap.dats)                   as DateCol,
      cast('01' as abap.numc(02))                     as NumcCol,

      ''                                              as EmptyCol,
      0                                               as EmptyCol2,
      'https://leverx.com/images/header/ic_logo.svg'  as ImageUrl,

      cast('000000' as zkast_emp_id preserving type ) as DElCol,

      $session.system_date                            as SDate,



      @Semantics.user.createdBy: true
      createdby                                       as Createdby,
      @Semantics.systemDateTime.createdAt: true
      createdat                                       as Createdat,
      @Semantics.user.lastChangedBy: true
      lastchangedby                                   as Lastchangedby,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat                                   as Lastchangedat,

      _EmpInf
}

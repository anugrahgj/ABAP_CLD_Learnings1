@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Additional Info'

define view entity ZKAST_I_Empl_Inf_l_Data_U
  as select from zkast_a_empinf_u

  association to parent ZKAST_I_Empl_Gnrl_Data_U as _EmpGnr on $projection.EmpId = _EmpGnr.EmpId

{
  key emp_id  as EmpId,
      @EndUserText: {            label: 'City',
                                 quickInfo: 'City' }
      emp_city      as EmpCity,
      @EndUserText: {            label: 'Number',
                           quickInfo: 'Number' }
      emp_number    as EmpNumber,
      @EndUserText: {            label: 'Email',
                     quickInfo: 'Email' }
      emp_email     as EmpEmail,
      createdby     as Createdby,
      createdat     as Createdat,
      lastchangedby as Lastchangedby,
      lastchangedat as Lastchangedat,

      _EmpGnr
}

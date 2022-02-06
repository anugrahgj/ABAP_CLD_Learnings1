@EndUserText.label: 'ZKAST_EMPINF_C_proj'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true

define view entity ZKAST_EMPINF_C_proj 
as projection on ZKAST_I_Empl_Inf_l_Data_U {
    key EmpId,
    EmpCity,
    EmpNumber,
    EmpEmail,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _EmpGnr : redirected to parent ZKAST_EMP_C_proj
}

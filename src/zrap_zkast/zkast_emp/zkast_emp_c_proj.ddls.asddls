@EndUserText.label: 'ZKAST_EMP_C_proj'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true

define root view entity ZKAST_EMP_C_proj 
provider contract transactional_query
as projection on ZKAST_I_Empl_Gnrl_Data_U {
    key EmpId,
    EmpFirstName,
    EmpLastName,
    EmpAge,
    EmpGender,
    EmpCompany,
    EmpCompWebSite,
    OverallGenderCriticality,
    DateCol,
    NumcCol,
    EmptyCol,
    EmptyCol2,
    ImageUrl,
    DElCol,
    SDate,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _EmpInf : redirected to composition child ZKAST_EMPINF_C_proj
}

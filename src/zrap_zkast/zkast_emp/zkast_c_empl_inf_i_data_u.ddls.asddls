@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZKAST_C_Empl_Inf_I_Data_U'

@Metadata.allowExtensions: true

define view entity ZKAST_C_Empl_Inf_I_Data_U
  as select from ZKAST_I_Empl_Inf_l_Data_U
{

//      @UI.facet: [ {
//               purpose:    #QUICK_VIEW,
//               type:       #FIELDGROUP_REFERENCE,
//               targetQualifier: 'ShipToPartyQV',
//               label: 'Additional Details'
//             }
//           ]



  key EmpId,

//      @UI.fieldGroup: [{ qualifier:'ShipToPartyQV', position: 10}]
//      @EndUserText.label: 'City'
      EmpCity,

//      @UI.fieldGroup: [{ qualifier:'ShipToPartyQV', position: 20}]
//      @EndUserText.label: 'Email'
      EmpNumber,
      EmpEmail,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      
      _EmpGnr
}

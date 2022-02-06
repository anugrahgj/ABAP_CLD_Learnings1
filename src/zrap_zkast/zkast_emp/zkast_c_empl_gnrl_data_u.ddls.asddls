@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Projection Views for Empl Gnrl Data'

@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZKAST_C_Empl_Gnrl_Data_U
  provider contract transactional_query
  as projection on ZKAST_I_Empl_Gnrl_Data_U as EmpGnrl
{

      @Search: { defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.9 }
      @Consumption.semanticObject: 'EmpId'
      @ObjectModel.foreignKey.association: '_EmpInf'

      @UI.lineItem: [ { position: 10, label: 'Sales Document Number'},
      {type: #FOR_INTENT_BASED_NAVIGATION, semanticObjectAction: 'manage'}]

  key EmpId,

      @Search: { defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.7 }
      EmpFirstName,

      @Search: { defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.7 }
      @Consumption.semanticObject: 'EmpLastName'
      EmpLastName,

      @Search: { defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.7 }
      @ObjectModel.text.element: ['EmpGender']
      @UI : {  textArrangement: #TEXT_LAST }
      EmpAge,

      @Semantics.text: true

      @Consumption.semanticObject: 'EmpGender'
      EmpGender,
      
      _EmpInf.EmpCity as City,

      OverallGenderCriticality,
      ImageUrl,
      EmpCompany,
      EmpCompWebSite,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,

      @Search: { defaultSearchElement: true, ranking: #HIGH }
      _EmpInf
}

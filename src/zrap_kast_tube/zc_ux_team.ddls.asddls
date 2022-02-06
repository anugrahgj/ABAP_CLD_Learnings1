@EndUserText.label: 'Projection interface view for ZI_UX_TEAM'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo.typeNamePlural: 'Connections'
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_UX_TEAM
  as projection on ZI_UX_TEAM as UXTeam
{
      @EndUserText.label: 'UUID'
  key Uuid,
      @EndUserText.label: 'EmployeeID'
      EmployeeID,
      @EndUserText.label: 'First Name'
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Age']
      Firstname,
      @EndUserText.label: 'Last Name'
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity : {name: 'zc_rap_imp_data', element: 'Street'}  }]
      Lastname,
      @EndUserText.label: 'Age'
      Age,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Role'
      Role,
      @EndUserText.label: 'Salary'
      Salary,
      @EndUserText.label: 'Active'
      Active,
      @EndUserText.label: 'Boolean_test'
      Boolean_test,
      LastChangedAt,
      LocalLastChangedAt,
      
      _ImpData : redirected to composition child zc_rap_imp_data
}

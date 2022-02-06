@EndUserText.label: 'Document headers BO proejction view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_ZCG_RAP_EZA_HEAD
  provider contract transactional_query
  as projection on ZI_ZCG_RAP_EZA_HEAD
{
      @EndUserText.label: 'Document ID'
  key Uuid,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Document number'
      DocumentNumber,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer',
      element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerLastName']
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Customer ID'
      CustomerId,
      _Customer.Title       as CustomerTitle,
      _Customer.FirstName   as CustomerFirstName,
      _Customer.LastName    as CustomerLastName,
      _Customer.Street      as CustomerStreet,
      _Customer.PostalCode  as CustomerPostalCode,
      _Customer.City        as CustomerCity,
      _Customer.CountryCode as CustomerCountryCode,
      @EndUserText.label: 'Created by'
      CreatedBy,
      @EndUserText.label: 'Created at'
      CreatedAt,
      @EndUserText.label: 'Last changed by'
      LastChangedBy,
      @EndUserText.label: 'Last changed at'
      LastChangedAt,
      LocalLastchangedAt,
      /* Associations */
      _Items : redirected to composition child ZC_ZCG_RAP_EZA_ITEM,
      _Customer
}

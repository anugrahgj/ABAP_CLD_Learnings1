@EndUserText.label: 'Document headers BO proejction view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_ZCG_RAP_EZA_ITEM
  as projection on ZI_ZCG_RAP_EZA_ITEM
{

  key Uuid,
      HeaderId,
      @Search.defaultSearchElement: true
      DocumentNumber,
      ItemNumber,
      @Consumption.valueHelpDefinition: [ { entity : {name: 'ZC_ZCG_RAP_EZA_COMP', element: 'Uuid' } } ]
      ComponentId,
      @ObjectModel.text.element: ['MaterialName']
      @Search.defaultSearchElement: true
      _Component.Matnr        as MaterialNumber,
      @Search.defaultSearchElement: true
      _Component.Maktx        as MaterialName,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Quantity,
      @Consumption.valueHelpDefinition: [ { entity: {name: 'I_UnitOfMeasure',
      element: 'UnitOfMeasureSAPCode' } } ]
      UnitOfMeasure,
      @Semantics.amount.currencyCode: 'ComponentCurrency'
      _Component.Price        as ComponentPrice,
      @Semantics.amount.currencyCode: 'ComponentCurrency'
      Value                   as Value,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency',
      element: 'Currency' } } ]
      _Component.CurrencyCode as ComponentCurrency,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastchangedAt,
      /* Associations */
      _Header : redirected to parent ZC_ZCG_RAP_EZA_HEAD,
      _Component,
      _UOM
}

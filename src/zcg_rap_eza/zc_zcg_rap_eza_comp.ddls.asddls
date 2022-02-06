@EndUserText.label: 'Document headers BO proejction view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.semanticKey: ['Uuid']
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_ZCG_RAP_EZA_COMP
  provider contract transactional_query
  as projection on ZI_ZCG_RAP_EZA_COMP
{
      @EndUserText.label: 'Component ID'
  key uuid,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['MaterialDescription']
      @EndUserText.label: 'Component number'
      Matnr                            as MaterialNumber,
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Component name'
      Maktx                            as MaterialDescription,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Component price'
      Price,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency',
      element: 'Currency' } } ]
      @ObjectModel.text.element: ['AltCurrencyKey']
      @EndUserText.label: 'Currency'
      CurrencyCode,
      _Currency.AlternativeCurrencyKey as AltCurrencyKey,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_UnitOfMeasure',
      element: 'UnitOfMeasureSAPCode' } } ]
      UnitOfMeasure,
      @EndUserText.label: 'Created by'
      CreatedBy,
      @EndUserText.label: 'Created at'
      CreatedAt,
      @EndUserText.label: 'Changed by'
      LastChangedBy,
      @EndUserText.label: 'Changed at'
      LastChangedAt,
      LocalLastchangedAt,
      /* Associations */
      _Currency,
      _UOM
}

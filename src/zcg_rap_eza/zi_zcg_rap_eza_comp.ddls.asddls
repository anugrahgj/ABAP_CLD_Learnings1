@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Components BO view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_ZCG_RAP_EZA_COMP
  as select from zcg_rap_eza_comp as Components
  association [0..1] to I_Currency      as _Currency on $projection.CurrencyCode = _Currency.Currency
  association [0..1] to I_UnitOfMeasure as _UOM      on $projection.UnitOfMeasure = _UOM.UnitOfMeasureSAPCode
{
  key uuid                as uuid,
      matnr               as Matnr,
      maktx               as Maktx,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price               as Price,
      currency_code       as CurrencyCode,
      unit_of_measure     as UnitOfMeasure,
      @Semantics.user.createdBy: true
      created_by          as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at          as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by     as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at     as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_lastchanged_at as LocalLastchangedAt,
      _Currency,
      _UOM
}

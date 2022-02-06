@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Document items BO view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_ZCG_RAP_EZA_ITEM
  as select from zcg_rap_eza_item as Items
  association        to parent ZI_ZCG_RAP_EZA_HEAD as _Header    on $projection.HeaderId = _Header.Uuid
  association [1..1] to ZI_ZCG_RAP_EZA_COMP        as _Component on $projection.ComponentId = _Component.uuid
  association [0..1] to I_UnitOfMeasure            as _UOM       on $projection.UnitOfMeasure = _UOM.UnitOfMeasureSAPCode

{
  key uuid                     as Uuid,
      header_id                as HeaderId,
      _Header.DocumentNumber   as DocumentNumber,
      item_number              as ItemNumber,
      component_id             as ComponentId,
      quantity                 as Quantity,
      _Component.UnitOfMeasure as UnitOfMeasure,
      value                    as Value,
      _Component.CurrencyCode  as CurrencyCode,
      @Semantics.user.createdBy: true
      created_by               as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at               as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by          as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at          as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_lastchanged_at      as LocalLastchangedAt,
      _Header,
      _Component,
      _UOM
}

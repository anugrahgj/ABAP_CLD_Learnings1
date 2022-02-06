@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Document headers BO view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_ZCG_RAP_EZA_HEAD
  as select from zcg_rap_eza_head as Header
  composition [0..*] of ZI_ZCG_RAP_EZA_ITEM as _Items
  association [1..1] to /DMO/I_Customer     as _Customer on $projection.CustomerId = _Customer.CustomerID
{
  key uuid                as Uuid,
      document_number     as DocumentNumber,
      customer_id         as CustomerId,
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
      _Items,
      _Customer
}

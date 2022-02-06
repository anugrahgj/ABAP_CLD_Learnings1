@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Bizland data source root'
@ObjectModel.usageType:{
  serviceQuality: #A,
  sizeCategory: #S,
  dataClass: #MIXED
}

define root view entity Z_I_DATASRCSSUBS
  as select from zbz_data_source as zds
  composition [0..*] of Z_I_SUBSCRIPTION as _subscription
  composition [0..1] of Z_I_SRCENDPOINT  as _srcendpoint
  composition [0..*] of Z_I_AGENT        as _agent
{
  key zds.data_source_id        as DataSourceId,
      zds.source_url            as SourceUrl,
      zds.discovery_timestamp   as DiscoveryTimestamp,
      @Semantics.text: true
      zds.description_text      as DescriptionText,
      @Semantics.user.createdBy: true
      zds.created_by            as CreatedBy,
      @Semantics.user.lastChangedBy: true
      zds.last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      zds.last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      zds.local_last_changed_at as LocalLastChangedAt,
      _srcendpoint,
      _subscription,
      _agent
}

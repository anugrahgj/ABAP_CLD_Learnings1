@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Bizland source endpoint component'

define view entity Z_I_SRCENDPOINT
  as select from zpf_src_endpoint
  association to parent Z_I_DATASRCSSUBS as _datasrcssubs on _datasrcssubs.DataSourceId = $projection.EndpointId
{
  key endpoint_id                            as EndpointId,
      endpoint                               as Endpoint,
      @Semantics.text: true
      description                            as Description,
      data_source_id                         as DataSourceId,
      @Semantics.user.createdBy: true
      zpf_src_endpoint.created_by            as CreatedBy,
      @Semantics.user.lastChangedBy: true
      zpf_src_endpoint.last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      zpf_src_endpoint.last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      zpf_src_endpoint.local_last_changed_at as LocalLastChangedAt,
      _datasrcssubs
}

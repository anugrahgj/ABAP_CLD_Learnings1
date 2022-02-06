@EndUserText.label: 'Data sources and subscriptions'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
@Search.searchable: true
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_DATASRCSSUBS_QUERY'

define root view entity Z_C_DATASRCSSUBS
  as projection on Z_I_DATASRCSSUBS
{
  key DataSourceId,
      @Search: {
         defaultSearchElement: true,
         ranking: #HIGH,
         fuzzinessThreshold: 0.7 }
      SourceUrl,
      DiscoveryTimestamp,
      DescriptionText,
      _srcendpoint.Endpoint,
      CreatedBy,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _agent        : redirected to composition child Z_C_AGENT,
      _srcendpoint,
      _subscription : redirected to composition child Z_C_SUBSCRIPTION
}

@EndUserText.label: 'Data source endpoints'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity Z_C_ENDPOINTS
  as projection on Z_I_SRCENDPOINT
{
      @UI.hidden: true
  key EndpointId,
      @Search:
      {
        defaultSearchElement: true,
        ranking: #HIGH,
        fuzzinessThreshold: 0.7
      }
      Endpoint,
      Description,
      DataSourceId,
      CreatedBy,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _datasrcssubs
}

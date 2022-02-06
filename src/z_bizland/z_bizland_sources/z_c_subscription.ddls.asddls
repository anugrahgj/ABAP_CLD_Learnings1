@EndUserText.label: 'Data source subscriptions'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
@Search.searchable: true

define view entity Z_C_SUBSCRIPTION
  as projection on Z_I_SUBSCRIPTION
{
  @Search: {
    defaultSearchElement: true,
    fuzzinessThreshold: 0.7,
    ranking: #HIGH
  }
  key DataSourceSubscriptionId,
      ValidFrom,
      ValidTo,
      ContactEmailUsed,
      LoginUser,
      LoginPassword,
      Description,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      LocalLastChangedAt,
      DataSourceId,
      /* Associations */
      _DATASRCSSUBS : redirected to parent Z_C_DATASRCSSUBS
}

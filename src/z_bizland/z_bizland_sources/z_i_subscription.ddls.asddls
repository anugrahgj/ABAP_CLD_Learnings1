@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Bizland subscriptions'
define view entity Z_I_SUBSCRIPTION
  as select from zbz_subscription as zs
    inner join   zpf_data_src_sub as zdss on zdss.data_source_subscription_id = zs.data_source_subscription_id
  association to parent Z_I_DATASRCSSUBS as _DATASRCSSUBS on $projection.DataSourceId = _DATASRCSSUBS.DataSourceId
{
  key zs.data_source_subscription_id as DataSourceSubscriptionId,
      //@Semantics.businessDate.from: true
      zs.valid_from                  as ValidFrom,
      //@Semantics.businessDate.to: true
      zs.valid_to                    as ValidTo,
      @Semantics.eMail.address: true
      zs.contact_email_used          as ContactEmailUsed,
      zs.login_user                  as LoginUser,
      zs.login_password              as LoginPassword,
      @Semantics.text: true
      zs.description                 as Description,
      @Semantics.user.createdBy: true
      zs.created_by                  as CreatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      zs.last_changed_at             as LastChangedAt,
      @Semantics.user.lastChangedBy: true
      zs.last_changed_by             as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      zs.local_last_changed_at       as LocalLastChangedAt,
      zdss.data_source_id            as DataSourceId,
      _DATASRCSSUBS
}

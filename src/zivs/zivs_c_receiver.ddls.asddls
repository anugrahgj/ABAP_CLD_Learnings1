@EndUserText.label: 'Projection view of ZIVS_I_Receiver'
@AccessControl.authorizationCheck: #CHECK

@Metadata.allowExtensions: true


define view entity ZIVS_C_Receiver
  as projection on ZIVS_I_Receiver
{

  key comp_id,

  key recv_id,
      ReceiverName,
      LastChangedAt,

      //      recv_name,
      //      last_changed_at,
      /* Associations */
      _Competence : redirected to parent ZIVS_C_Competence
}

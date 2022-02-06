@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS-view of ZIVS_RECEIVER table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZIVS_I_Receiver
  as select from zivs_receiver as Receiver
  association to parent ZIVS_I_Competence as _Competence on $projection.comp_id = _Competence.comp_id
{
      //    key comp_id as CompId,
      //    key recv_id as RecvId,
  key comp_id,
  key recv_id,
      recv_name as ReceiverName,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at as LastChangedAt,
      /* Associations */
      _Competence
}

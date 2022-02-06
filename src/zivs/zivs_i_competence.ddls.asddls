@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS-view of ZIVS_Competence table'
define root view entity ZIVS_I_Competence
  as select from zivs_competence
  composition [0..*] of ZIVS_I_Receiver as _Receiver
  composition [0..*] of ZIVS_I_RULE     as _Rule
{
      //  key comp_id         as CompId,
  key comp_id,
      from_date       as FromDate,
      to_date         as ToDate,
      description     as Description,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      /* Association */
      _Receiver,
      _Rule

}

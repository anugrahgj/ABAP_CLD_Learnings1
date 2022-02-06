@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Agent'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #A,
  sizeCategory: #S,
  dataClass: #MIXED
}

define view entity Z_I_AGENT
  as select from zbiz_agent        as agent
    inner join   zpf_dt_src_agent as zdsa on zdsa.agent_id = agent.agent_id
  association        to parent Z_I_DATASRCSSUBS as _dataSrcSubs         on _dataSrcSubs.DataSourceId = $projection.DataSourceAgentId
  association [0..1] to Z_I_AGENT_PURPOSE       as _agentPurpose        on _agentPurpose.PurposeId = $projection.PurposeId
  association [0..1] to Z_I_PROG_LANG           as _programmingLanguage on _programmingLanguage.ProgrammingLanguageId = $projection.ProgrammingLanguageId
{
  key agent.agent_id                as AgentId,
      agent.agent_name              as AgentName,
      agent.programming_language_id as ProgrammingLanguageId,
      agent.purpose_id              as PurposeId,
      zdsa.data_source_agent_id     as DataSourceAgentId,
      @Semantics.user.createdBy: true
      agent.created_by              as CreatedBy,
      @Semantics.user.lastChangedBy: true
      agent.last_changed_by         as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      agent.last_changed_at         as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      agent.local_last_changed_at   as LocalLastChangedAt,
      zdsa.data_source_id           as DataSourceId,
      /*Associations*/
      _agentPurpose,
      _programmingLanguage,
      _dataSrcSubs
}

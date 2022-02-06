@EndUserText.label: 'Agent projection'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
@Search.searchable: true

define view entity Z_C_AGENT
  as projection on Z_I_AGENT
{
      @UI.hidden: true
  key AgentId,
      @Search: {
        defaultSearchElement: true,
        ranking: #HIGH,
        fuzzinessThreshold: 0.7 }
      AgentName,
      @UI.hidden: true
      ProgrammingLanguageId,
      @UI.hidden: true
      PurposeId,
      @UI.hidden: true
      DataSourceAgentId,
      @UI.hidden: true
      DataSourceId,
      CreatedBy,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      _agentPurpose.PurposeDescription  as PurposeDescription,
      _programmingLanguage.LanguageName as LanguageName,
      _programmingLanguage.Version,
      _programmingLanguage.RuntimeEnv,
      /* Associations */
      _agentPurpose,
      _dataSrcSubs : redirected to parent Z_C_DATASRCSSUBS,
      _programmingLanguage
}

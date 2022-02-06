@AbapCatalog.sqlViewName: 'ZIAGPRPS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Agent purpose'

define view Z_I_AGENT_PURPOSE
  as select from zpf_agent_prps
{
  key purpose_id          as PurposeId,
      @Semantics.text: true
      purpose_description as PurposeDescription
}

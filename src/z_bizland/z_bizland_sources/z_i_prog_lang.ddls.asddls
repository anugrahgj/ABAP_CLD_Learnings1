@AbapCatalog.sqlViewName: 'ZIPROGLANG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Programming language'
define view Z_I_PROG_LANG
  as select from zpf_prog_lang
{
  key programming_language_id as ProgrammingLanguageId,
      language_name           as LanguageName,
      version                 as Version,
      runtime_env             as RuntimeEnv,
      @Semantics.user.createdBy: true
      created_by              as CreatedBy,
      @Semantics.user.lastChangedBy: true
      last_changed_by         as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at         as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at   as LocalLastChangedAt
}

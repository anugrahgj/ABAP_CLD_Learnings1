@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS-view of ZIVS_RULE table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZIVS_I_RULE
  as select from zivs_rule as Rule
  association to parent ZIVS_I_Competence as _Competence on $projection.comp_id = _Competence.comp_id
{
  key comp_id,
  key rule_id,
//      rule_option     as RuleOption,
//      @Semantics.systemDateTime.localInstanceLastChangedAt: true
//      last_changed_at as LastChangedAt
      rule_option,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at
      ,
      /* Associations */
      _Competence
}

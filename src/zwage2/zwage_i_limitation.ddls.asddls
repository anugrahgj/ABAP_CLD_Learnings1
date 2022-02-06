@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ZWAGE_I_Limitation (DataDef)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZWAGE_I_Limitation
  as select from zwage_limitation as Limitation

  association to parent ZWAGE_I_Travel as _Travel on $projection.travel_id = _Travel.travel_id
{
  key travel_id,
  key limitation_id,
      from_date         as FromDate,
      to_date           as ToDate,
      limitation_status as LimitationStatus,
      last_changed_at   as LastChangedAt,
      /* Associations */
      _Travel

}

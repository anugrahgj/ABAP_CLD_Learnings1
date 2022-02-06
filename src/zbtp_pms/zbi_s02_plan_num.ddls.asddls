@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'plan num'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zbi_s02_plan_num as select from zbi_s02_plan {
    key projectId,
    devStartMonth,
    count(*) as plan_count
}group by projectId,
    devStartMonth

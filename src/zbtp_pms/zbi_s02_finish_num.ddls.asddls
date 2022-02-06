@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'finish num'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBI_S02_FINISH_NUM as select from ZBI_S02_finish {
    key projectId,
    devStartMonth,
    count(*) as finish_count
}group by projectId,
    devStartMonth

@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS


define view entity zkast_i_travel_sts_m as select from zkast_trl_status {
    key trv_stts as TrvStts,
    trv_stts_desc as TrvSttsDesc
}

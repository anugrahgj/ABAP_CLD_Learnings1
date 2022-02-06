@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS

define view entity zkast_i_gender_m
  as select from zkast_agender
{
  key gender as Gender
}

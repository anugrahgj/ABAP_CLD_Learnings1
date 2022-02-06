@EndUserText.label: 'CDS Data Model Projection ROOT Park'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true

define root view entity ZKAST_C_Park_U
  provider contract transactional_query
  as projection on ZKAST_I_Park_U
{
  key ParkUuid,
      ParkId,
      ParkName,
      Capacity,
      ParkStatus,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat
}

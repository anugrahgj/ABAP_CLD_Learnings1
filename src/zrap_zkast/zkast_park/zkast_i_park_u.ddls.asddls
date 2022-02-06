@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Based Data Model Interface Park'

define root view entity ZKAST_I_Park_U 
  as select from zkast_a_park_u as Park
{
  key park_uuid     as ParkUuid,
      park_id       as ParkId,
      park_name     as ParkName,
      capacity      as Capacity,
      park_status   as ParkStatus,
      createdby     as Createdby,
      createdat     as Createdat,
      lastchangedby as Lastchangedby,
      lastchangedat as Lastchangedat
}

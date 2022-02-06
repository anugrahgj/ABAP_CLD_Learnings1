@AbapCatalog.sqlViewName: 'ZKASTIPARKSQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test Int View'

define view ZKAST_I_Park_U_SQL
  as select from zkast_a_park_u
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

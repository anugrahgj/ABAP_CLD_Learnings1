@AbapCatalog.sqlViewName: 'ZIVS_IRECVNAMEVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS-view for ReceiverName value-help'
@ObjectModel : { resultSet.sizeCategory: #XS }
define view ZIVS_I_ReceiverName_VH 
//with parameters p_domain_name : abap.char(30) 
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name : 'ZIVS_DO_RECV_NAME' )  {
    key domain_name,
    key value_position,
    value_low,
    value_high
}

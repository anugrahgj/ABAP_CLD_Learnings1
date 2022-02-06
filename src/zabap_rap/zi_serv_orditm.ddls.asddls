@AbapCatalog.sqlViewName: 'ZISERVORDITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Service order item interface view'
//@VDM.viewType: #BASIC
define view ZI_SERV_ORDITM as select from zserv_orditm
  association [1..1] to ZI_SERV_ORDHRD as _Header on $projection.ServiceOrd = _Header.ServiceOrd
{
      //zserv_orditm
      //zserv_orditm
  key sord         as ServiceOrd,
  key sitm         as ServiceItem,
      servcode     as ServiceCode,
      servdescr    as ServiceDescription,
      itemstatus   as ItemStatus,
      @Semantics.amount.currencyCode: '_Header.Currency'
      partcost     as PartCost,
      labourcode   as LabourCode,
      labourcat    as LabourCategory,
      labstarttime as LabourStartTime,
      labendtime   as LabourEndTime,
      //Associations
      _Header
}

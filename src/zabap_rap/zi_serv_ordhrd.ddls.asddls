@AbapCatalog.sqlViewName: 'ZISERVORDHDR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Service order header interface view'
//@VDM.viewType: #BASIC
define view ZI_SERV_ORDHRD as select from zserv_ordhd
association [0..*] to ZI_SERV_ORDITM as _Item on $projection.ServiceOrd = _Item.ServiceOrd{
  key sord   as ServiceOrd,
  partner    as Customer,
  status     as Status,
  priority   as Priority,
  //zserv_ordhd
  @Semantics.amount.currencyCode: 'Currency'
  estcost as EstimatedCost,
  currkey as Currency,
/*--Admin data */
//@Semantics.systemDate.createdAt: true
  crea_date_time as CreatedOn,
@Semantics.user.createdBy: true
  crea_uname as CreatedBy,
//@Semantics.systemDate.lastChangedAt: true
  lchg_date_time as ChangedOn,
@Semantics.user.lastChangedBy: true
  lchg_uname as ChangedBy,
  //Associations
  _Item
}

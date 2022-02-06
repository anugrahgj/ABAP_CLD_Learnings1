@AbapCatalog.sqlViewName: 'ZIEMPSDTLS1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'roout view'
define root view Z_I_EMPS_DTLS1 as select from  zemp_dtls1 as a  {
  key   a.zempid as Zempid,
    a.zempname as Zempname,
    a.zempdesgr as Zempdesgr,
    a.zgender as Zgender,
    a.zsalary as Zsalary,
    a.zcurrency_key as ZcurrencyKey
}

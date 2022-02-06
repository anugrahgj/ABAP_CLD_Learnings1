@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'ROOT VIEW'
define root view entity Z_I_EMPS_DTLS as select from zemp_dtls1 as a 
 {
key  a.zempid as Zempid,
 a.zempname as Zempname,
 a.zempdesgr as Zempdesgr,
 a.zgender as Zgender,
 a.zsalary as Zsalary,
 a.zcurrency_key as ZcurrencyKey   
}

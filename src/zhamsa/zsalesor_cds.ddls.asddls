@AbapCatalog.sqlViewName: 'ZHSALESCDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Details'
@UI.headerInfo:{
typeName: 'Sales Order',
typeNamePlural: 'Sales Orders'
}
define view zsalesor_cds as select from zhsalesorders {
@UI.facet: [{
      purpose: #STANDARD,
      type: #IDENTIFICATION_REFERENCE,
      label: 'Sales Order',
      position: 10
      }]
      
@UI.selectionField: [{position: 10 }]
@UI.lineItem: [{position: 10 }]
@UI.identification: [{position: 10 }]
    key vbeln as Vbeln,
@UI.selectionField: [{position: 20 }]
@UI.lineItem: [{position: 20 }]
@UI.identification: [{position: 20 }]
    werks as Werksid,
@UI.selectionField: [{position: 30 }]
@UI.lineItem: [{position: 30 }]
@UI.identification: [{position: 30 }]
    gross_amount as GrossAmount,
@UI.selectionField: [{position: 40 }]
@UI.lineItem: [{position: 40 }]
@UI.identification: [{position: 40 }]
    curr_code as CurrCode
}

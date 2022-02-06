@AbapCatalog.sqlViewName: 'ZHCDSDLV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery Details'
@UI.headerInfo:{
typeName: 'Delivery Info',
typeNamePlural: 'Delivery Information'
}
define root view zcds_delivery as select from zhlikp 

{
@UI.facet: [{
      purpose: #STANDARD,
      type: #IDENTIFICATION_REFERENCE,
      label: 'Delivery Number',
      position: 10
      }]
      
@UI.selectionField: [{position: 10 }]
@UI.lineItem: [{position: 10 }]
@UI.identification: [{position: 10 }]
   key vbeln as vbeln,
@UI.selectionField: [{position: 20 }]
@UI.lineItem: [{position: 20 }]
@UI.identification: [{position: 20 }]
        ernam,
@UI.selectionField: [{position: 30 }]
@UI.lineItem: [{position: 30 }]
@UI.identification: [{position: 30 }]
        erzet,
@UI.selectionField: [{position: 40 }]
@UI.lineItem: [{position: 40 }]
@UI.identification: [{position: 40 }]
        erdat,
@UI.selectionField: [{position: 50 }]
@UI.lineItem: [{position: 50 }]
@UI.identification: [{position: 50 }]
        vstel,
@UI.selectionField: [{position: 60 }]
@UI.lineItem: [{position: 60 }]
@UI.identification: [{position: 60 }]
       vkorg,
@UI.selectionField: [{position: 70 }]
@UI.lineItem: [{position: 70 }]
@UI.identification: [{position: 70 }]
      btgew,
@UI.selectionField: [{position: 80 }]
@UI.lineItem: [{position: 80 }]
@UI.identification: [{position: 80 }]
      ntgew,
@UI.selectionField: [{position: 90 }]
@UI.lineItem: [{position: 90 }]
@UI.identification: [{position: 90 }]
gewei

//_dlvItem
}

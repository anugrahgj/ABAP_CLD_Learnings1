@AbapCatalog.sqlViewName: 'ZWM_CO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption Layer for Data Modeling'

@UI.headerInfo:{
    typeName: 'Sales Order',
    typeNamePlural: 'Sales Orders'
}


define root view ZWM_C_SALES_ODER as select from zwm_sales_order {
    @UI.facet: [{id: 'Sales Order',
                 purpose: #STANDARD,
                 type : #IDENTIFICATION_REFERENCE,
                 label: 'Sales Order',
                 position: 10
                     }]
    @UI.selectionField: [{position: 10 }]
    @UI.lineItem: [{position: 10 }]
    @UI.identification: [{position: 10 }]
    key so_id,
    @UI.selectionField: [{position: 20 }]
    @UI.lineItem: [{position: 20 }]
    @UI.identification: [{position: 20 }]
    customer_name,
    @UI.selectionField: [{position: 30 }]
    @UI.lineItem: [{position: 30 }]
    @UI.identification: [{position: 30 }]
    sales_org,
    @UI.selectionField: [{position: 40 }]
    @UI.lineItem: [{position: 40 }]
    @UI.identification: [{position: 40 }]
    gross_amount,
    @UI.selectionField: [{position: 50 }]
    @UI.lineItem: [{position: 50 }]
    currency_code,
    created_by,
    created_on
}

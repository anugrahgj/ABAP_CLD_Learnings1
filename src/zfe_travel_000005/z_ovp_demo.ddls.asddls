//@AbapCatalog.sqlViewName: 'ZOVPDEMO'
//@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'OVP Demo App'
//@OData.publish: true
@UI.headerInfo: {
  typeNamePlural: 'Sales Orders',
  imageUrl: 'mytestImg',
  typeName: 'Sales Order',
  title: {
    label: 'Order ID',
    value: 'sales_order_id'
  },
  description: {
    label: 'Customer',
    value: 'sales_order_id'
  }
}
@UI.chart:[{
    qualifier: 'ordNetChart',
    title:'Order Net Amount',
    chartType: #LINE,
    dimensions: ['sales_order_id'],
    measures: ['net_amount', 'tax_amount'],
    dimensionAttributes: [{dimension: 'sales_order_id', role:#SERIES}],
    measureAttributes: [{measure: 'net_amount', role: #AXIS_1}, {measure: 'tax_amount', role: #AXIS_1}]
 }]
@UI: {presentationVariant: [{qualifier: 'top5Changed', maxItems: 5,  sortOrder:[{by: 'changed_at', direction: #DESC }]}]}
define root view entity Z_Ovp_Demo
  as select from zcds_sales_order as so
{
  key so.sales_order_key,
      @Consumption.semanticObject: 'Action'
      @UI: {identification:[ {type: #FOR_INTENT_BASED_NAVIGATION, semanticObjectAction: 'toappnavsample2', label: 'Nav Sample', position: 10} ] }
      @UI.lineItem:  [{ label: 'salesOrd', qualifier:'ordOverView',type: #FOR_INTENT_BASED_NAVIGATION, semanticObjectAction: 'toappnavsample'},
        { position: 10, qualifier:'ordOverView', label: 'Sales Order'}]
      @UI.selectionField: [ { position: 10 } ]
      so.sales_order_id,
      so.changed_at,

      so.currency_code,
      '/resources/sap/ui/core/mimes/logo/sap_50x26.png' as mytestImg,
      //    @UI.dataPoint:{title: 'For Charts', referencePeriod.end: 'created_at', criticalityCalculation: {
      //        improvementDirection: #MAXIMIZE,
      //        toleranceRangeLowValue: 1000,
      //        deviationRangeLowValue: 4000}}
      //    so.gross_amount,
      @UI.dataPoint:{title: 'Order Target Value', criticalityCalculation: {
          improvementDirection: #MAXIMIZE,
          toleranceRangeLowValue: 8000,
          deviationRangeLowValue: 9000} }
      10000.00                                          as myTarget,
      @UI.dataPoint: {title: 'Net Amt',
        criticalityCalculation: {
          improvementDirection: #TARGET,
          deviationRangeLowValue: 100,
          toleranceRangeLowValue: 400,
          toleranceRangeHighValue: 800,
          deviationRangeHighValue: 1200
          },
          valueFormat:{
            numberOfFractionalDigits: 1
          }}
      @UI:{lineItem:  [{ position: 30, qualifier:'ordOverView', label: 'Net Amount',  type: #AS_DATAPOINT},{qualifier: 'chartLineItem'}]}
      so.net_amount,
      @UI.dataPoint: {title: 'Tax Amt', valueFormat:{
        numberOfFractionalDigits: 1
      }}
      @UI:{lineItem:[  { position: 40, qualifier:'ordOverView', label: 'Tax Amount', type: #AS_DATAPOINT}]}
      so.tax_amount
      //    @UI.dataPoint: {title: 'Lifecycle'}
      //    @UI.lineItem:  { position: 50, qualifier:'ordOverView', label: 'Lifecycle', type: #AS_DATAPOINT}
      //    so.lifecycle_status,
      //    so.billing_status,
      //    so.delivery_status,
      //    so.buyer_guid,
      //    /* Associations */
      //    so.customer,
      //    so.items,
      //    @UI.lineItem:  { position: 20, qualifier:'ord     OverView', label: 'Customer' }
      //    @UI.selectionField: [ { position: '20' } ]
      //    @UI.identification: [{label: 'Customer', position: '10'}]
      //    so.customer.company_name,
      //    @UI.fieldGroup: {groupLabel: 'Contact Details', label: 'Email', position: '10', qualifier: 'cusContact'}
      //    so.customer.email_address,
      //    @UI.fieldGroup: {groupLabel: 'Contact Details', label: 'Phone', position: '20', qualifier: 'cusContact'}
      //    so.customer.phone_number,
      //    @UI.identification: {type: #WITH_URL, label: 'Customer Site', url: 'web_address', position: '20'}
      //    so.customer.web_address
}

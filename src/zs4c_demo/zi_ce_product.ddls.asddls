@EndUserText.label: 'Product custom entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CQ_PRODUCT'
@UI: {
   headerInfo: {
     typeName: 'Product',
     typeNamePlural: 'Products',
     title: { type: #STANDARD, value: 'Product' }
   },
   presentationVariant: [ { sortOrder: [ { by: 'Product', direction: #ASC } ] } ]
   }

define custom entity zi_ce_product
{
      @UI.facet         : [
         {
           id           :       'Product',
           purpose      :  #STANDARD,
           type         :     #IDENTIFICATION_REFERENCE,
           label        :    'Product',
           position     : 10 }
       ]

      @OData.property.name: 'Product'
      @UI               : {
        lineItem        : [ { position:10, label: 'Product' } ],
        identification  : [{ position: 10, label: 'Product' }],
        selectionField  : [{position: 10 }]
      }
      @EndUserText      : { label: 'Product', quickInfo: 'Product' }
  key Product           : abap.char( 40 );

      @OData.property.name: 'ProductType'
      @UI               : {
        lineItem        : [ { position: 20, label: 'ProductType' } ],
        identification  : [{ position: 20, label: 'ProductType' }],
        selectionField  : [{position: 20 }]
      }
      @EndUserText      : { label: 'Product Type', quickInfo: 'Product Type' }
      ProductType       : abap.char( 4 );

      @OData.property.name: 'CreationDate'
      @UI               : {
        lineItem        : [ { position: 30, label: 'Creation Date' } ],
        identification  : [{ position: 30, label: 'Creation Date' }]
      }
      @EndUserText      : { label: 'Creation Date', quickInfo: 'Creation Date' }
      CreationDate      : rap_cp_odata_v2_edm_datetime;
      @OData.property.name: 'CreatedByUser'
      @UI               : {
        lineItem        : [ { position: 40, label: 'Created By' } ],
        identification  : [{ position: 40, label: 'Created By' }]
      }
      @EndUserText      : { label: 'Created By', quickInfo: 'Created By' }
      CreatedByUser     : abap.char( 12 );
      @OData.property.name: 'LastChangeDate'
      @UI               : {
        lineItem        : [ { position: 50, label: 'Last Change Date' } ],
        identification  : [{ position: 50, label: 'Last Change Date' }]
      }
      @EndUserText      : { label: 'Last Change Date', quickInfo: 'Last Change Date' }
      LastChangeDate    : rap_cp_odata_v2_edm_datetime;
      @OData.property.name: 'Last Changed By'
      @UI               : {
        lineItem        : [ { position: 60, label: 'Last Changed By' } ],
        identification  : [{ position: 60, label: 'Last Changed By' }]
      }
      @EndUserText      : { label: 'Last Changed By', quickInfo: 'Last Changed By' }
      LastChangedByUser : abap.char( 12 );
}

@AbapCatalog.sqlViewName: 'ZCSERORDITR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Service order Item cons view RAP'
@UI.headerInfo: { typeName: 'Service Order Item', typeNamePlural: 'Service Order Items', title: { type: #STANDARD, value: 'ServiceOrd' } }

define view ZC_SERV_ORDITEM_REST
  as select from ZI_SERV_ORDITM
  association to parent ZC_SERV_ORDHDR_REST as _Header on $projection.ServiceOrd = _Header.ServiceOrd
{
      //ZI_SERV_ORDITM
      @UI.facet: [
                {type: #COLLECTION, position: 10, id: '_Item', label: 'Idoc details'},
                {type: #FIELDGROUP_REFERENCE, position: 10, targetQualifier: 'Item1',parentId: '_Item', isSummary: true, isPartOfPreview: true},
                {type: #FIELDGROUP_REFERENCE, position: 20, targetQualifier: 'Item2',parentId: '_Item', isSummary: true, isPartOfPreview: true}
                ]
      @UI.lineItem: [{position:10,importance: #HIGH, label:'Service Order' }]
      @UI.fieldGroup: [{qualifier: 'Item1', label:'Service Order', position:10,importance: #HIGH}]
  key ServiceOrd,
      @UI.lineItem: [{position:20,importance: #HIGH, label: 'Order Item' }]
      @UI.fieldGroup: [{qualifier: 'Item1', position:20, label: 'Order Item',importance: #HIGH}]
  key ServiceItem,
      @UI.lineItem: [{position:30,importance: #MEDIUM , label: 'Service code'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:30, label: 'Service code',importance: #HIGH}]
      ServiceCode,
      @UI.lineItem: [{position:40,importance: #MEDIUM , label:'Service description'}]
      @UI.fieldGroup: [{qualifier: 'Item1', position:40, label:'Service description',importance: #HIGH}]
      ServiceDescription,
      @UI.lineItem: [{position:50,importance: #HIGH, label: 'Item status', criticality: 'ItemCriticality' }]
      @UI.fieldGroup: [{qualifier: 'Item2', position:10,importance: #HIGH, label: 'Item status', criticality: 'ItemCriticality'}]
      @ObjectModel.text.element: ['ItemStatusTxt']
      ItemStatus,
      @Semantics.text: true
      case when ItemStatus = '1' then 'Open'
           when ItemStatus = '2' then 'In Progress'
           when ItemStatus = '3' then 'Complete'
           else '' end       as ItemStatusTxt,
      case when ItemStatus = '1' then 1
                 when ItemStatus = '2' then 2
                 when ItemStatus = '3' then 3
                 else 1  end as ItemCriticality,
      @UI.lineItem: [{position:60,importance: #MEDIUM, label:'Labour code' }]
      @UI.fieldGroup: [{qualifier: 'Item1', position:50, label:'Labour code',importance: #HIGH}]
      LabourCode,
      @UI.lineItem: [{position:70,importance: #MEDIUM, label:'Labour Category' }]
      @UI.fieldGroup: [{qualifier: 'Item1', position:60, label:'Labour Category',importance: #HIGH}]
      LabourCategory,
      @UI.fieldGroup: [{qualifier: 'Item1', position:70, label:'Part cost',importance: #MEDIUM}]
      @Semantics.amount.currencyCode: '_Header.Currency'
      PartCost,
      //_Header.Currency as Currency,
      @UI.fieldGroup: [{qualifier: 'Item1', position:80, label:'Labour starttime',importance: #MEDIUM}]
      LabourStartTime,
      @UI.fieldGroup: [{qualifier: 'Item1', position:90, label:'Labour Endtime',importance: #MEDIUM}]
      LabourEndTime,
      /* Associations */
      //ZI_SERV_ORDHITEM_TP
      _Header
}

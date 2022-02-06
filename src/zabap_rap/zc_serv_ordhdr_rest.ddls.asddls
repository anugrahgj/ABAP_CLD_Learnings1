@AbapCatalog.sqlViewName: 'ZCSERVORDHDRR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Service Order Cons View with RAP'
//@VDM.viewType: #CONSUMPTION
@Search.searchable: true
@UI.headerInfo: { typeName: 'Service Order', typeNamePlural: 'Service Orders', title: { type: #STANDARD, value: 'ServiceOrd' } }
define root view ZC_SERV_ORDHDR_REST
  as select from ZI_SERV_ORDHRD
  composition [0..*] of ZC_SERV_ORDITEM_REST as _Item
{
      //ZI_SERV_ORDHRD
      @UI.facet: [
                  {
                  id: 'ServiceHeader',
                  type: #COLLECTION,
                  position: 10,
                  label: 'Service Orders'
                  },
                  {
                  type: #FIELDGROUP_REFERENCE,
                  position: 10,
                  targetQualifier: 'GeneralData1',
                  parentId: 'ServiceHeader',
                  isSummary: true,
                  isPartOfPreview: true
                  },
                  {
                  type: #FIELDGROUP_REFERENCE,
                  position: 20,
                  targetQualifier: 'GeneralData2',
                  parentId: 'ServiceHeader',
                  isSummary: true,
                  isPartOfPreview: true
                  },
                  {
                  id: '_Item',
                  purpose: #STANDARD,
                  type: #LINEITEM_REFERENCE,
                  label: 'Item details',
                  position: 10,
                  targetElement: '_Item'
                  }
              ]

      @UI.lineItem: [{position: 10, importance: #HIGH, label: 'Service Order' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 10,importance: #HIGH, label: 'Service Order' }]
      @UI.selectionField: [{position: 10 }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      @UI.hidden: #(CreateAction)
  key ServiceOrd,
      case when ServiceOrd is initial then cast ( 'X' as abap.char( 1 ) )
           else cast( ' ' as abap.char( 1 ) ) end                      as CreateAction,
      @UI.lineItem: [{position: 20, importance: #HIGH, label: 'Customer' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 20,importance: #HIGH, label: 'Customer' }]
      @UI.selectionField: [{position: 20 }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      Customer,
      @ObjectModel.text.element: ['StatusTxt']
      @UI.lineItem: [{position: 30, importance: #HIGH, label: 'Status', criticality: 'StatusCriticality' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData2',position: 10,importance: #HIGH, criticality: 'StatusCriticality', label: 'Status' }]
      @UI.selectionField: [{position: 30 }]
      @UI.hidden: #(CreateAction)
      Status,
      @Semantics.text: true
      case when Status = '1' then 'Open'
           when Status = '2' then 'Approval'
           when Status = '3' then 'In Progress'
           when Status = '4' then 'Completed' else '' end    as StatusTxt,
      case when Status = '1' then 1
           when Status = '2' then 2
           when Status = '3' then 2
           when Status = '4' then 3 else 1 end               as StatusCriticality,
      @ObjectModel.text.element: ['PriorityTxt']
      @UI.lineItem: [{position: 40, importance: #HIGH, label: 'Priority' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData2',position: 20,importance: #HIGH, label: 'Priority' }]
      @UI.selectionField: [{position: 40 }]
      Priority,
      @Semantics.text: true
      case when Priority = '1' then 'Urgent'
           when Priority = '2' then 'Major'
           when Priority = '3' then 'Medium'
           when Priority = '4' then 'Minor' else 'Minor' end as PriorityTxt,
      @UI.lineItem: [{position: 50, importance: #HIGH, label: 'Estimated Cost', criticality: 'StatusCriticality' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 30,importance: #HIGH, label: 'Estimated Cost', criticality: 'StatusCriticality' }]
      EstimatedCost,
      case when EstimatedCost > 500 then 'X'
           else '' end                                       as approvalNeeded,

      @UI.lineItem: [{position: 60, importance: #HIGH, label: 'Actual Cost' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 40,importance: #HIGH, label: 'Actual Cost' }]
      @Semantics.amount.currencyCode: 'Currency'
      @UI.hidden: #(CreateAction)
      cast(0 as abap.curr(5,2) )                             as ActualCost,
      @UI.lineItem: [{position: 70, importance: #MEDIUM, label: 'Currency' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData1',position: 50,importance: #MEDIUM, label: 'Currency' }]
      Currency,
      @UI.lineItem: [{position: 80, importance: #MEDIUM, label: 'Created On' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData2',position: 30,importance: #MEDIUM,label: 'Created On' }]
      @UI.selectionField: [{position: 50 }]
      @UI.hidden: #(CreateAction)
      CreatedOn,
      @UI.lineItem: [{position: 90, importance: #MEDIUM, label: 'Created By' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData2',position: 40,importance: #MEDIUM,label: 'Created By'}]
      @UI.selectionField: [{position: 60 }]
      @UI.hidden: #(CreateAction)
      CreatedBy,
      @UI.lineItem: [{position: 100, importance: #LOW, label: 'Changed On' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData2',position: 50,importance: #LOW,label: 'Changed On' }]
      @UI.hidden: #(CreateAction)
      ChangedOn,
      @UI.lineItem: [{position: 110, importance: #LOW, label: 'Changed By' }]
      @UI.fieldGroup: [{qualifier: 'GeneralData2',position: 60,importance: #LOW,label: 'Changed By' }]
      @UI.hidden: #(CreateAction)
      ChangedBy,
      /* Associations */
      //ZI_SERV_ORDHDR_TP
      _Item
}

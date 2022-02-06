@AbapCatalog.sqlViewName: 'ZVRI_MODEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Items Data Model'
define view Z_R_ITEMS as select from zpoitemplus {
    @UI: {lineItem: [{ position: 10  }]}
    @EndUserText.label: 'Purchasing Document'
    key po_order,
    @UI: {lineItem: [{ position: 20  }]}
    @EndUserText.label: 'Item'
    key order_item,
    @UI: {lineItem: [{ position: 30  }]}
    @EndUserText.label: 'Unit'
    unit,
    @UI: {lineItem: [{ position: 40  }]}
    @EndUserText.label: 'Quantity'
    quantity
}

@AbapCatalog.sqlViewName: 'ZVR_MODEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Data Model'
define root view Z_R_MODEL as select from zpoheader
association [1..*] to Z_R_ITEMS as items on $projection.po_order = items.po_order {
    //zpoheader
    key po_order,
    comp_code,
    doc_type,
    vendor,
    status,
    created_by,
    created_at,
    items
}

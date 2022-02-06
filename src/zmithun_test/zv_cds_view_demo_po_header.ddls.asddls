@AbapCatalog.sqlViewName: 'ZV_SQL_PO_HEADER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view for PO details header'
define view ZV_CDS_VIEW_DEMO_PO_HEADER as select from ztest_po_header 
{
    key ebeln as PurchaseOrder,
        //bsart as DocType,
        case(bsart)
          when 'ZOC' then 'Confirmaton Order'
          when 'NB'  then 'Standard PO'
          when 'ZNB' then 'EYSE Procure NB'
          else 'Other Order'
        end   as DocType,
        ekorg as SalesOrg,
        ekgrp as SalesGrp,
        lifnr as Vendor,
        waers as Currency,
        aedat as CreationDate
}

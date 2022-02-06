@AbapCatalog.sqlViewName: 'ZV_SQL_PO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO CDS View'
@Metadata.allowExtensions: true
define root view ZV_CDS_VIEW_DEMO_PO as select from ztest_po 
{
    key ebeln as Purchaseorder,
    key ebelp as PurchaseItem,
        matnr as Material,
        werks as Plant,
        lgort as SorageLoction,
        matkl as MaterialGrp,
        txz01 as ShortText,
        bukrs as SalesOrg,
        @Semantics.quantity.unitOfMeasure: 'Uom'
        menge as Qty,
        @Semantics.unitOfMeasure: true
        meins as Uom,
        netpr as Price,
        currency_conversion(amount => netpr, 
                            source_currency => cast('USD' as abap.cuky ),
                            target_currency => cast('INR' as abap.cuky ),
                            exchange_rate_date => cast('20211214' as abap.dats) ) as PriceInUSD,
        peinh as Price_unit,
        cast( netpr as abap.fltp(16) ) * 0.16 as GST,
        ceil( cast( round(netpr,1) as abap.fltp(16) )) as RoundPrice, 
        concat_with_space(werks, lgort, 1) as StprageDetais
}

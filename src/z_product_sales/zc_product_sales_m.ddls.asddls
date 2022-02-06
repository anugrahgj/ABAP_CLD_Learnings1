@EndUserText.label: 'Travel projection view - Processor'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'ProductSales', typeNamePlural: 'Products', title: { type: #STANDARD, value: 'brand' } } }

@Search.searchable: true

define root view entity ZC_PRODUCT_SALES_M
  as projection on ZI_PRODUCT_SALES_M
{
   key mykey,
      brand,
      product_name,
      product_type,
      quantity,
      unit_price,
      amount,
      store_name,
      channel,
      customer_name
}

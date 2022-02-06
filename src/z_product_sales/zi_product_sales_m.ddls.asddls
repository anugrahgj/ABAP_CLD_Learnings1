@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel data - XXX'
define root view entity ZI_PRODUCT_SALES_M

  as select from zproducts_sales as Travel



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

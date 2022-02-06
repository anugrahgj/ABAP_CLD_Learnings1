@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel data - XXX'
define root view entity ZI_TRAVEL_M_I347421

  as select from ztravel_i347421 as Travel

  /* Associations with another DB tables to be used for search help in the view or any other rendering purposes*/
  association [0..1] to /DMO/I_Agency   as _Agency   on $projection.agency_id = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer as _Customer on $projection.customer_id = _Customer.CustomerID
  association [0..1] to I_Currency      as _Currency on $projection.currency_code = _Currency.Currency

{
  key mykey,
      travel_id,
      agency_id,
      customer_id,
      begin_date,
      end_date,
      @Semantics.amount.currencyCode: 'currency_code'
      booking_fee,
      @Semantics.amount.currencyCode: 'currency_code'
      total_price,
      currency_code,
      overall_status,
      description,
      test_string,

      /*-- Admin data --*/
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,

      /* Public associations */
      _Agency,
      _Customer,
      _Currency
}  

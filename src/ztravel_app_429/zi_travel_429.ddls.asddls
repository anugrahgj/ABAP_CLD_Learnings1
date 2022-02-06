//@AbapCatalog.sqlViewName: ''
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for travel'
define root view entity ZI_TRAVEL_429 

  as select from ztravel_429 as Travel 
  /* associations */
  association [0..1] to /DMO/I_Agency as _agency on $projection.agency_id = _agency.AgencyID
  association [0..1] to /DMO/I_Customer as _customer on $projection.customer_id = _customer.CustomerID
  association [0..1] to I_Currency as _currency on $projection.currency_code = _currency.Currency
  
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
    
    /*-- Admin data --*/
    @Semantics.user.createdBy: true
    created_by,
    @Semantics.systemDateTime.createdAt:true
    created_at,
    @Semantics.user.lastChangedBy: true
    last_changed_by,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    
    /* public associations */
    _agency,
    _customer,
    _currency
}

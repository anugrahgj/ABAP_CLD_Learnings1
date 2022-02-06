@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel Data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_RAP_TRAVEL_U_123
  as select from /dmo/travel
  
  composition [0..*] of ZI_RAP_Booking_U_123 as _Booking
  
  association [0..1] to /DMO/I_Agency   as _agency   on $projection.AgencyId = _agency.AgencyID

  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID

  association [0..1] to I_Currency      as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key travel_id     as TravelId,
      
      agency_id     as AgencyId,
      
      customer_id   as CustomerId,
      
      begin_date    as BeginDate,
      
      end_date      as EndDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      
      currency_code as CurrencyCode,
      
      description   as Description,
      
      status        as Status,
      
      @Semantics.user.createdBy: true
      createdby     as Createdby,
      
      @Semantics.systemDateTime.createdAt: true
      createdat     as Createdat,
      
      @Semantics.user.lastChangedBy: true
      lastchangedby as Lastchangedby,
      
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat as Lastchangedat,
       
      _Booking,
      
      _agency,
      
      _Customer,
      
      _Currency

}

/********** GENERATED on 11/28/2021 at 09:25:32 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductMLPrices' 
 @OData.entityType.name: 'A_ProductMLPricesType' 
 define root abstract entity ZA_PRODUCTMLPRICES { 
 key Product : abap.char( 40 ) ; 
 key ValuationArea : abap.char( 4 ) ; 
 key ValuationType : abap.char( 10 ) ; 
 key CurrencyRole : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'Currency_vc' 
 @Semantics.currencyCode: true 
 Currency : abap.cuky ; 
 Currency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FuturePrice_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 FuturePrice : abap.curr( 12, 3 ) ; 
 FuturePrice_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FuturePriceValidityStartDat_vc' 
 FuturePriceValidityStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 FuturePriceValidityStartDat_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlannedPrice_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 PlannedPrice : abap.curr( 24, 3 ) ; 
 PlannedPrice_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

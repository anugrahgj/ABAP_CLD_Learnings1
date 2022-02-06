/********** GENERATED on 11/28/2021 at 09:25:31 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductMLAccount' 
 @OData.entityType.name: 'A_ProductMLAccountType' 
 define root abstract entity ZA_PRODUCTMLACCOUNT { 
 key Product : abap.char( 40 ) ; 
 key ValuationArea : abap.char( 4 ) ; 
 key ValuationType : abap.char( 10 ) ; 
 key CurrencyRole : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'Currency_vc' 
 @Semantics.currencyCode: true 
 Currency : abap.cuky ; 
 Currency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductPriceControl_vc' 
 ProductPriceControl : abap.char( 1 ) ; 
 ProductPriceControl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PriceUnitQty_vc' 
 PriceUnitQty : abap.dec( 5, 0 ) ; 
 PriceUnitQty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MovingAveragePrice_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 MovingAveragePrice : abap.curr( 12, 3 ) ; 
 MovingAveragePrice_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StandardPrice_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 StandardPrice : abap.curr( 12, 3 ) ; 
 StandardPrice_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

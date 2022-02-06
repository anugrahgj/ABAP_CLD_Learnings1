/********** GENERATED on 11/28/2021 at 09:25:42 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductValuationAccount' 
 @OData.entityType.name: 'A_ProductValuationAccountType' 
 define root abstract entity ZA_PRODUCTVALUATIONACCOUNT { 
 key Product : abap.char( 40 ) ; 
 key ValuationArea : abap.char( 4 ) ; 
 key ValuationType : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'CommercialPrice1InCoCodeCrc_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 CommercialPrice1InCoCodeCrcy : abap.curr( 12, 3 ) ; 
 CommercialPrice1InCoCodeCrc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CommercialPrice2InCoCodeCrc_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 CommercialPrice2InCoCodeCrcy : abap.curr( 12, 3 ) ; 
 CommercialPrice2InCoCodeCrc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CommercialPrice3InCoCodeCrc_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 CommercialPrice3InCoCodeCrcy : abap.curr( 12, 3 ) ; 
 CommercialPrice3InCoCodeCrc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DevaluationYearCount_vc' 
 DevaluationYearCount : abap.numc( 2 ) ; 
 DevaluationYearCount_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FutureEvaluatedAmountValue_vc' 
 FutureEvaluatedAmountValue : abap.dec( 12, 3 ) ; 
 FutureEvaluatedAmountValue_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FuturePriceValidityStartDat_vc' 
 FuturePriceValidityStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 FuturePriceValidityStartDat_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsLIFOAndFIFORelevant_vc' 
 IsLIFOAndFIFORelevant : abap_boolean ; 
 IsLIFOAndFIFORelevant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LIFOValuationPoolNumber_vc' 
 LIFOValuationPoolNumber : abap.char( 4 ) ; 
 LIFOValuationPoolNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxPricel1InCoCodeCrcy_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 TaxPricel1InCoCodeCrcy : abap.curr( 12, 3 ) ; 
 TaxPricel1InCoCodeCrcy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxPrice2InCoCodeCrcy_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 TaxPrice2InCoCodeCrcy : abap.curr( 12, 3 ) ; 
 TaxPrice2InCoCodeCrcy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxPrice3InCoCodeCrcy_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 TaxPrice3InCoCodeCrcy : abap.curr( 12, 3 ) ; 
 TaxPrice3InCoCodeCrcy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Currency_vc' 
 @Semantics.currencyCode: true 
 Currency : abap.cuky ; 
 Currency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

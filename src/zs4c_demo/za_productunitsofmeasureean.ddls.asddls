/********** GENERATED on 11/28/2021 at 09:25:41 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductUnitsOfMeasureEAN' 
 @OData.entityType.name: 'A_ProductUnitsOfMeasureEANType' 
 define root abstract entity ZA_PRODUCTUNITSOFMEASUREEAN { 
 key Product : abap.char( 40 ) ; 
 key AlternativeUnit : abap.char( 3 ) ; 
 key ConsecutiveNumber : abap.char( 5 ) ; 
 @Odata.property.valueControl: 'ProductStandardID_vc' 
 ProductStandardID : abap.char( 18 ) ; 
 ProductStandardID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InternationalArticleNumberC_vc' 
 InternationalArticleNumberCat : abap.char( 2 ) ; 
 InternationalArticleNumberC_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMainGlobalTradeItemNumber_vc' 
 IsMainGlobalTradeItemNumber : abap_boolean ; 
 IsMainGlobalTradeItemNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

/********** GENERATED on 11/28/2021 at 09:25:33 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlantForecasting' 
 @OData.entityType.name: 'A_ProductPlantForecastingType' 
 define root abstract entity ZA_PRODUCTPLANTFORECASTING { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'ConsumptionRefUsageEndDate_vc' 
 ConsumptionRefUsageEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ConsumptionRefUsageEndDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConsumptionQtyMultiplier_vc' 
 ConsumptionQtyMultiplier : abap.dec( 4, 2 ) ; 
 ConsumptionQtyMultiplier_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConsumptionReferenceProduct_vc' 
 ConsumptionReferenceProduct : abap.char( 40 ) ; 
 ConsumptionReferenceProduct_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConsumptionReferencePlant_vc' 
 ConsumptionReferencePlant : abap.char( 4 ) ; 
 ConsumptionReferencePlant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

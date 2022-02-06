/********** GENERATED on 11/28/2021 at 09:25:35 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlantSales' 
 @OData.entityType.name: 'A_ProductPlantSalesType' 
 define root abstract entity ZA_PRODUCTPLANTSALES { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'LoadingGroup_vc' 
 LoadingGroup : abap.char( 4 ) ; 
 LoadingGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReplacementPartType_vc' 
 ReplacementPartType : abap.char( 1 ) ; 
 ReplacementPartType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CapPlanningQuantityInBaseUo_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 CapPlanningQuantityInBaseUoM : abap.dec( 13, 3 ) ; 
 CapPlanningQuantityInBaseUo_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductShippingProcessingTi_vc' 
 ProductShippingProcessingTime : abap.dec( 5, 2 ) ; 
 ProductShippingProcessingTi_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WrkCentersShipgSetupTimeInD_vc' 
 WrkCentersShipgSetupTimeInDays : abap.dec( 5, 2 ) ; 
 WrkCentersShipgSetupTimeInD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AvailabilityCheckType_vc' 
 AvailabilityCheckType : abap.char( 2 ) ; 
 AvailabilityCheckType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

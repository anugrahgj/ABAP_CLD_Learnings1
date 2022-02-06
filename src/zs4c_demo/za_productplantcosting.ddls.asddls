/********** GENERATED on 11/28/2021 at 09:25:33 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlantCosting' 
 @OData.entityType.name: 'A_ProductPlantCostingType' 
 define root abstract entity ZA_PRODUCTPLANTCOSTING { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'IsCoProduct_vc' 
 IsCoProduct : abap_boolean ; 
 IsCoProduct_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostingLotSize_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 CostingLotSize : abap.dec( 13, 3 ) ; 
 CostingLotSize_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VarianceKey_vc' 
 VarianceKey : abap.char( 6 ) ; 
 VarianceKey_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaskListGroupCounter_vc' 
 TaskListGroupCounter : abap.char( 2 ) ; 
 TaskListGroupCounter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaskListGroup_vc' 
 TaskListGroup : abap.char( 8 ) ; 
 TaskListGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaskListType_vc' 
 TaskListType : abap.char( 1 ) ; 
 TaskListType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostingProductionVersion_vc' 
 CostingProductionVersion : abap.char( 4 ) ; 
 CostingProductionVersion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsFixedPriceCoProduct_vc' 
 IsFixedPriceCoProduct : abap_boolean ; 
 IsFixedPriceCoProduct_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostingSpecialProcurementTy_vc' 
 CostingSpecialProcurementType : abap.char( 2 ) ; 
 CostingSpecialProcurementTy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SourceBOMAlternative_vc' 
 SourceBOMAlternative : abap.char( 2 ) ; 
 SourceBOMAlternative_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductBOMUsage_vc' 
 ProductBOMUsage : abap.char( 1 ) ; 
 ProductBOMUsage_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductIsCostingRelevant_vc' 
 ProductIsCostingRelevant : abap_boolean ; 
 ProductIsCostingRelevant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

/********** GENERATED on 11/28/2021 at 09:25:41 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductUnitsOfMeasure' 
 @OData.entityType.name: 'A_ProductUnitsOfMeasureType' 
 define root abstract entity ZA_PRODUCTUNITSOFMEASURE { 
 key Product : abap.char( 40 ) ; 
 @Semantics.unitOfMeasure: true 
 key AlternativeUnit : abap.unit( 3 ) ; 
 @Odata.property.valueControl: 'QuantityNumerator_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 QuantityNumerator : abap.dec( 5, 0 ) ; 
 QuantityNumerator_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'QuantityDenominator_vc' 
 @Semantics.quantity.unitOfMeasure: 'AlternativeUnit' 
 QuantityDenominator : abap.dec( 5, 0 ) ; 
 QuantityDenominator_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialVolume_vc' 
 @Semantics.quantity.unitOfMeasure: 'VolumeUnit' 
 MaterialVolume : abap.dec( 13, 3 ) ; 
 MaterialVolume_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VolumeUnit_vc' 
 @Semantics.unitOfMeasure: true 
 VolumeUnit : abap.unit( 3 ) ; 
 VolumeUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GrossWeight_vc' 
 @Semantics.quantity.unitOfMeasure: 'WeightUnit' 
 GrossWeight : abap.dec( 13, 3 ) ; 
 GrossWeight_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WeightUnit_vc' 
 @Semantics.unitOfMeasure: true 
 WeightUnit : abap.unit( 3 ) ; 
 WeightUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GlobalTradeItemNumber_vc' 
 GlobalTradeItemNumber : abap.char( 18 ) ; 
 GlobalTradeItemNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GlobalTradeItemNumberCatego_vc' 
 GlobalTradeItemNumberCategory : abap.char( 2 ) ; 
 GlobalTradeItemNumberCatego_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnitSpecificProductLength_vc' 
 @Semantics.quantity.unitOfMeasure: 'ProductMeasurementUnit' 
 UnitSpecificProductLength : abap.dec( 13, 3 ) ; 
 UnitSpecificProductLength_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnitSpecificProductWidth_vc' 
 @Semantics.quantity.unitOfMeasure: 'ProductMeasurementUnit' 
 UnitSpecificProductWidth : abap.dec( 13, 3 ) ; 
 UnitSpecificProductWidth_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnitSpecificProductHeight_vc' 
 @Semantics.quantity.unitOfMeasure: 'ProductMeasurementUnit' 
 UnitSpecificProductHeight : abap.dec( 13, 3 ) ; 
 UnitSpecificProductHeight_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductMeasurementUnit_vc' 
 @Semantics.unitOfMeasure: true 
 ProductMeasurementUnit : abap.unit( 3 ) ; 
 ProductMeasurementUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LowerLevelPackagingUnit_vc' 
 LowerLevelPackagingUnit : abap.char( 3 ) ; 
 LowerLevelPackagingUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RemainingVolumeAfterNesting_vc' 
 RemainingVolumeAfterNesting : abap.dec( 3, 0 ) ; 
 RemainingVolumeAfterNesting_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumStackingFactor_vc' 
 MaximumStackingFactor : abap.int1 ; 
 MaximumStackingFactor_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CapacityUsage_vc' 
 CapacityUsage : abap.dec( 15, 3 ) ; 
 CapacityUsage_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_InternationalArticleNumber' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _InternationalArticleNumber : association [0..*] to ZA_PRODUCTUNITSOFMEASUREEAN on 1 = 1; 
 } 

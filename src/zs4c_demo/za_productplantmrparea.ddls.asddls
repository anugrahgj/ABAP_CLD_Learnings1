/********** GENERATED on 11/28/2021 at 09:25:34 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlantMRPArea' 
 @OData.entityType.name: 'A_ProductPlantMRPAreaType' 
 define root abstract entity ZA_PRODUCTPLANTMRPAREA { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 key MRPArea : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'MRPType_vc' 
 MRPType : abap.char( 2 ) ; 
 MRPType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPResponsible_vc' 
 MRPResponsible : abap.char( 3 ) ; 
 MRPResponsible_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPGroup_vc' 
 MRPGroup : abap.char( 4 ) ; 
 MRPGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReorderThresholdQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 ReorderThresholdQuantity : abap.dec( 13, 3 ) ; 
 ReorderThresholdQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlanningTimeFence_vc' 
 PlanningTimeFence : abap.numc( 3 ) ; 
 PlanningTimeFence_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LotSizingProcedure_vc' 
 LotSizingProcedure : abap.char( 2 ) ; 
 LotSizingProcedure_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LotSizeRoundingQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 LotSizeRoundingQuantity : abap.dec( 13, 3 ) ; 
 LotSizeRoundingQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MinimumLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MinimumLotSizeQuantity : abap.dec( 13, 3 ) ; 
 MinimumLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MaximumLotSizeQuantity : abap.dec( 13, 3 ) ; 
 MaximumLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumStockQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MaximumStockQuantity : abap.dec( 13, 3 ) ; 
 MaximumStockQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AssemblyScrapPercent_vc' 
 AssemblyScrapPercent : abap.dec( 5, 2 ) ; 
 AssemblyScrapPercent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProcurementSubType_vc' 
 ProcurementSubType : abap.char( 2 ) ; 
 ProcurementSubType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DfltStorageLocationExtProcm_vc' 
 DfltStorageLocationExtProcmt : abap.char( 4 ) ; 
 DfltStorageLocationExtProcm_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPPlanningCalendar_vc' 
 MRPPlanningCalendar : abap.char( 3 ) ; 
 MRPPlanningCalendar_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SafetyStockQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 SafetyStockQuantity : abap.dec( 13, 3 ) ; 
 SafetyStockQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RangeOfCvrgPrflCode_vc' 
 RangeOfCvrgPrflCode : abap.char( 3 ) ; 
 RangeOfCvrgPrflCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SafetyDuration_vc' 
 SafetyDuration : abap.numc( 2 ) ; 
 SafetyDuration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FixedLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 FixedLotSizeQuantity : abap.dec( 13, 3 ) ; 
 FixedLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LotSizeIndependentCosts_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 LotSizeIndependentCosts : abap.curr( 12, 3 ) ; 
 LotSizeIndependentCosts_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsStorageCosts_vc' 
 IsStorageCosts : abap.char( 1 ) ; 
 IsStorageCosts_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RqmtQtyRcptTaktTmeInWrkgDay_vc' 
 RqmtQtyRcptTaktTmeInWrkgDays : abap.dec( 3, 0 ) ; 
 RqmtQtyRcptTaktTmeInWrkgDay_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SrvcLvl_vc' 
 SrvcLvl : abap.dec( 3, 1 ) ; 
 SrvcLvl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMarkedForDeletion_vc' 
 IsMarkedForDeletion : abap_boolean ; 
 IsMarkedForDeletion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PerdPrflForSftyTme_vc' 
 PerdPrflForSftyTme : abap.char( 3 ) ; 
 PerdPrflForSftyTme_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMRPDependentRqmt_vc' 
 IsMRPDependentRqmt : abap.char( 1 ) ; 
 IsMRPDependentRqmt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsSafetyTime_vc' 
 IsSafetyTime : abap.char( 1 ) ; 
 IsSafetyTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlannedDeliveryDurationInDa_vc' 
 PlannedDeliveryDurationInDays : abap.dec( 3, 0 ) ; 
 PlannedDeliveryDurationInDa_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsPlannedDeliveryTime_vc' 
 IsPlannedDeliveryTime : abap_boolean ; 
 IsPlannedDeliveryTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Currency_vc' 
 @Semantics.currencyCode: true 
 Currency : abap.cuky ; 
 Currency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlanAndOrderDayDeterminatio_vc' 
 PlanAndOrderDayDetermination : abap.char( 3 ) ; 
 PlanAndOrderDayDeterminatio_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RoundingProfile_vc' 
 RoundingProfile : abap.char( 4 ) ; 
 RoundingProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StorageLocation_vc' 
 StorageLocation : abap.char( 4 ) ; 
 StorageLocation_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

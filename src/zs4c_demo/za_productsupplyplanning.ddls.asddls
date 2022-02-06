/********** GENERATED on 11/28/2021 at 09:25:40 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductSupplyPlanning' 
 @OData.entityType.name: 'A_ProductSupplyPlanningType' 
 define root abstract entity ZA_PRODUCTSUPPLYPLANNING { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'FixedLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 FixedLotSizeQuantity : abap.dec( 13, 3 ) ; 
 FixedLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MaximumLotSizeQuantity : abap.dec( 13, 3 ) ; 
 MaximumLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MinimumLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MinimumLotSizeQuantity : abap.dec( 13, 3 ) ; 
 MinimumLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LotSizeRoundingQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 LotSizeRoundingQuantity : abap.dec( 13, 3 ) ; 
 LotSizeRoundingQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LotSizingProcedure_vc' 
 LotSizingProcedure : abap.char( 2 ) ; 
 LotSizingProcedure_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPType_vc' 
 MRPType : abap.char( 2 ) ; 
 MRPType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPResponsible_vc' 
 MRPResponsible : abap.char( 3 ) ; 
 MRPResponsible_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SafetyStockQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 SafetyStockQuantity : abap.dec( 13, 3 ) ; 
 SafetyStockQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MinimumSafetyStockQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MinimumSafetyStockQuantity : abap.dec( 13, 3 ) ; 
 MinimumSafetyStockQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlanningTimeFence_vc' 
 PlanningTimeFence : abap.numc( 3 ) ; 
 PlanningTimeFence_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ABCIndicator_vc' 
 ABCIndicator : abap.char( 1 ) ; 
 ABCIndicator_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumStockQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MaximumStockQuantity : abap.dec( 13, 3 ) ; 
 MaximumStockQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ReorderThresholdQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 ReorderThresholdQuantity : abap.dec( 13, 3 ) ; 
 ReorderThresholdQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlannedDeliveryDurationInDa_vc' 
 PlannedDeliveryDurationInDays : abap.dec( 3, 0 ) ; 
 PlannedDeliveryDurationInDa_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SafetyDuration_vc' 
 SafetyDuration : abap.numc( 2 ) ; 
 SafetyDuration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlanningStrategyGroup_vc' 
 PlanningStrategyGroup : abap.char( 2 ) ; 
 PlanningStrategyGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TotalReplenishmentLeadTime_vc' 
 TotalReplenishmentLeadTime : abap.dec( 3, 0 ) ; 
 TotalReplenishmentLeadTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProcurementType_vc' 
 ProcurementType : abap.char( 1 ) ; 
 ProcurementType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProcurementSubType_vc' 
 ProcurementSubType : abap.char( 2 ) ; 
 ProcurementSubType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AssemblyScrapPercent_vc' 
 AssemblyScrapPercent : abap.dec( 5, 2 ) ; 
 AssemblyScrapPercent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AvailabilityCheckType_vc' 
 AvailabilityCheckType : abap.char( 2 ) ; 
 AvailabilityCheckType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GoodsReceiptDuration_vc' 
 GoodsReceiptDuration : abap.dec( 3, 0 ) ; 
 GoodsReceiptDuration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPGroup_vc' 
 MRPGroup : abap.char( 4 ) ; 
 MRPGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DfltStorageLocationExtProcm_vc' 
 DfltStorageLocationExtProcmt : abap.char( 4 ) ; 
 DfltStorageLocationExtProcm_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdRqmtsConsumptionMode_vc' 
 ProdRqmtsConsumptionMode : abap.char( 1 ) ; 
 ProdRqmtsConsumptionMode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BackwardCnsmpnPeriodInWorkD_vc' 
 BackwardCnsmpnPeriodInWorkDays : abap.numc( 3 ) ; 
 BackwardCnsmpnPeriodInWorkD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FwdConsumptionPeriodInWorkD_vc' 
 FwdConsumptionPeriodInWorkDays : abap.numc( 3 ) ; 
 FwdConsumptionPeriodInWorkD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
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
 @Odata.property.valueControl: 'LotSizeIndependentCosts_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 LotSizeIndependentCosts : abap.curr( 12, 3 ) ; 
 LotSizeIndependentCosts_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPPlanningCalendar_vc' 
 MRPPlanningCalendar : abap.char( 3 ) ; 
 MRPPlanningCalendar_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RangeOfCvrgPrflCode_vc' 
 RangeOfCvrgPrflCode : abap.char( 3 ) ; 
 RangeOfCvrgPrflCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsSafetyTime_vc' 
 IsSafetyTime : abap.char( 1 ) ; 
 IsSafetyTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PerdPrflForSftyTme_vc' 
 PerdPrflForSftyTme : abap.char( 3 ) ; 
 PerdPrflForSftyTme_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMRPDependentRqmt_vc' 
 IsMRPDependentRqmt : abap.char( 1 ) ; 
 IsMRPDependentRqmt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InHouseProductionTime_vc' 
 InHouseProductionTime : abap.dec( 3, 0 ) ; 
 InHouseProductionTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductIsForCrossProject_vc' 
 ProductIsForCrossProject : abap.char( 1 ) ; 
 ProductIsForCrossProject_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StorageCostsPercentageCode_vc' 
 StorageCostsPercentageCode : abap.char( 1 ) ; 
 StorageCostsPercentageCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SrvcLvl_vc' 
 SrvcLvl : abap.dec( 3, 1 ) ; 
 SrvcLvl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPAvailabilityType_vc' 
 MRPAvailabilityType : abap.char( 1 ) ; 
 MRPAvailabilityType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FollowUpProduct_vc' 
 FollowUpProduct : abap.char( 40 ) ; 
 FollowUpProduct_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RepetitiveManufacturingIsAl_vc' 
 RepetitiveManufacturingIsAllwd : abap_boolean ; 
 RepetitiveManufacturingIsAl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DependentRequirementsType_vc' 
 DependentRequirementsType : abap.char( 1 ) ; 
 DependentRequirementsType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsBulkMaterialComponent_vc' 
 IsBulkMaterialComponent : abap_boolean ; 
 IsBulkMaterialComponent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RepetitiveManufacturingProf_vc' 
 RepetitiveManufacturingProfile : abap.char( 4 ) ; 
 RepetitiveManufacturingProf_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RqmtQtyRcptTaktTmeInWrkgDay_vc' 
 RqmtQtyRcptTaktTmeInWrkgDays : abap.dec( 3, 0 ) ; 
 RqmtQtyRcptTaktTmeInWrkgDay_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ForecastRequirementsAreSpli_vc' 
 ForecastRequirementsAreSplit : abap.char( 1 ) ; 
 ForecastRequirementsAreSpli_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'EffectiveOutDate_vc' 
 EffectiveOutDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 EffectiveOutDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPProfile_vc' 
 MRPProfile : abap.char( 4 ) ; 
 MRPProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ComponentScrapInPercent_vc' 
 ComponentScrapInPercent : abap.dec( 5, 2 ) ; 
 ComponentScrapInPercent_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductIsToBeDiscontinued_vc' 
 ProductIsToBeDiscontinued : abap.char( 1 ) ; 
 ProductIsToBeDiscontinued_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdRqmtsAreConsolidated_vc' 
 ProdRqmtsAreConsolidated : abap.char( 1 ) ; 
 ProdRqmtsAreConsolidated_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MatlCompIsMarkedForBackflus_vc' 
 MatlCompIsMarkedForBackflush : abap.char( 1 ) ; 
 MatlCompIsMarkedForBackflus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProposedProductSupplyArea_vc' 
 ProposedProductSupplyArea : abap.char( 10 ) ; 
 ProposedProductSupplyArea_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Currency_vc' 
 @Semantics.currencyCode: true 
 Currency : abap.cuky ; 
 Currency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlannedOrderActionControl_vc' 
 PlannedOrderActionControl : abap.char( 2 ) ; 
 PlannedOrderActionControl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

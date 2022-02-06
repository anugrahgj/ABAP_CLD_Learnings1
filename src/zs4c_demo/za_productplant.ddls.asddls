/********** GENERATED on 11/28/2021 at 09:26:11 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlant' 
 @OData.entityType.name: 'A_ProductPlantType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZA_PRODUCTPLANT { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'PurchasingGroup_vc' 
 PurchasingGroup : abap.char( 3 ) ; 
 PurchasingGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CountryOfOrigin_vc' 
 CountryOfOrigin : abap.char( 3 ) ; 
 CountryOfOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RegionOfOrigin_vc' 
 RegionOfOrigin : abap.char( 3 ) ; 
 RegionOfOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductionInvtryManagedLoc_vc' 
 ProductionInvtryManagedLoc : abap.char( 4 ) ; 
 ProductionInvtryManagedLoc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProfileCode_vc' 
 ProfileCode : abap.char( 2 ) ; 
 ProfileCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProfileValidityStartDate_vc' 
 ProfileValidityStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ProfileValidityStartDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AvailabilityCheckType_vc' 
 AvailabilityCheckType : abap.char( 2 ) ; 
 AvailabilityCheckType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FiscalYearVariant_vc' 
 FiscalYearVariant : abap.char( 2 ) ; 
 FiscalYearVariant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PeriodType_vc' 
 PeriodType : abap.char( 1 ) ; 
 PeriodType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProfitCenter_vc' 
 ProfitCenter : abap.char( 10 ) ; 
 ProfitCenter_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Commodity_vc' 
 Commodity : abap.char( 17 ) ; 
 Commodity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GoodsReceiptDuration_vc' 
 GoodsReceiptDuration : abap.dec( 3, 0 ) ; 
 GoodsReceiptDuration_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaintenanceStatusName_vc' 
 MaintenanceStatusName : abap.char( 15 ) ; 
 MaintenanceStatusName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMarkedForDeletion_vc' 
 IsMarkedForDeletion : abap_boolean ; 
 IsMarkedForDeletion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPType_vc' 
 MRPType : abap.char( 2 ) ; 
 MRPType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MRPResponsible_vc' 
 MRPResponsible : abap.char( 3 ) ; 
 MRPResponsible_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ABCIndicator_vc' 
 ABCIndicator : abap.char( 1 ) ; 
 ABCIndicator_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MinimumLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MinimumLotSizeQuantity : abap.dec( 13, 3 ) ; 
 MinimumLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MaximumLotSizeQuantity : abap.dec( 13, 3 ) ; 
 MaximumLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FixedLotSizeQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 FixedLotSizeQuantity : abap.dec( 13, 3 ) ; 
 FixedLotSizeQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConsumptionTaxCtrlCode_vc' 
 ConsumptionTaxCtrlCode : abap.char( 16 ) ; 
 ConsumptionTaxCtrlCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsCoProduct_vc' 
 IsCoProduct : abap_boolean ; 
 IsCoProduct_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductIsConfigurable_vc' 
 ProductIsConfigurable : abap.char( 40 ) ; 
 ProductIsConfigurable_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StockDeterminationGroup_vc' 
 StockDeterminationGroup : abap.char( 4 ) ; 
 StockDeterminationGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StockInTransferQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 StockInTransferQuantity : abap.dec( 13, 3 ) ; 
 StockInTransferQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StockInTransitQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 StockInTransitQuantity : abap.dec( 13, 3 ) ; 
 StockInTransitQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HasPostToInspectionStock_vc' 
 HasPostToInspectionStock : abap_boolean ; 
 HasPostToInspectionStock_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsBatchManagementRequired_vc' 
 IsBatchManagementRequired : abap_boolean ; 
 IsBatchManagementRequired_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SerialNumberProfile_vc' 
 SerialNumberProfile : abap.char( 4 ) ; 
 SerialNumberProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsNegativeStockAllowed_vc' 
 IsNegativeStockAllowed : abap_boolean ; 
 IsNegativeStockAllowed_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GoodsReceiptBlockedStockQty_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 GoodsReceiptBlockedStockQty : abap.dec( 13, 3 ) ; 
 GoodsReceiptBlockedStockQty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HasConsignmentCtrl_vc' 
 HasConsignmentCtrl : abap.char( 1 ) ; 
 HasConsignmentCtrl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FiscalYearCurrentPeriod_vc' 
 FiscalYearCurrentPeriod : abap.numc( 4 ) ; 
 FiscalYearCurrentPeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FiscalMonthCurrentPeriod_vc' 
 FiscalMonthCurrentPeriod : abap.numc( 2 ) ; 
 FiscalMonthCurrentPeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProcurementType_vc' 
 ProcurementType : abap.char( 1 ) ; 
 ProcurementType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsInternalBatchManaged_vc' 
 IsInternalBatchManaged : abap_boolean ; 
 IsInternalBatchManaged_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductCFOPCategory_vc' 
 ProductCFOPCategory : abap.char( 2 ) ; 
 ProductCFOPCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductIsExciseTaxRelevant_vc' 
 ProductIsExciseTaxRelevant : abap_boolean ; 
 ProductIsExciseTaxRelevant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConfigurableProduct_vc' 
 ConfigurableProduct : abap.char( 40 ) ; 
 ConfigurableProduct_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GoodsIssueUnit_vc' 
 GoodsIssueUnit : abap.char( 3 ) ; 
 GoodsIssueUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialFreightGroup_vc' 
 MaterialFreightGroup : abap.char( 8 ) ; 
 MaterialFreightGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OriginalBatchReferenceMater_vc' 
 OriginalBatchReferenceMaterial : abap.char( 40 ) ; 
 OriginalBatchReferenceMater_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OriglBatchManagementIsRequi_vc' 
 OriglBatchManagementIsRequired : abap.char( 1 ) ; 
 OriglBatchManagementIsRequi_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductIsCriticalPrt_vc' 
 ProductIsCriticalPrt : abap_boolean ; 
 ProductIsCriticalPrt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductLogisticsHandlingGro_vc' 
 ProductLogisticsHandlingGroup : abap.char( 4 ) ; 
 ProductLogisticsHandlingGro_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_PlantMRPArea' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PlantMRPArea : association [0..*] to ZA_PRODUCTPLANTMRPAREA on 1 = 1; 
 @OData.property.name: 'to_PlantQualityMgmt' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PlantQualityMgmt : association [1] to ZA_PRODUCTPLANTQUALITYMGMT on 1 = 1; 
 @OData.property.name: 'to_PlantSales' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PlantSales : association [1] to ZA_PRODUCTPLANTSALES on 1 = 1; 
 @OData.property.name: 'to_PlantStorage' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PlantStorage : association [1] to ZA_PRODUCTPLANTSTORAGE on 1 = 1; 
 @OData.property.name: 'to_PlantText' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PlantText : association [1] to ZA_PRODUCTPLANTTEXT on 1 = 1; 
 @OData.property.name: 'to_ProdPlantInternationalTrade' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProdPlantInternationalTrade : association [1] to ZA_PRODUCTPLANTINTLTRD on 1 = 1; 
 @OData.property.name: 'to_ProductPlantCosting' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductPlantCosting : association [1] to ZA_PRODUCTPLANTCOSTING on 1 = 1; 
 @OData.property.name: 'to_ProductPlantForecast' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductPlantForecast : association [1] to ZA_PRODUCTPLANTFORECASTING on 1 = 1; 
 @OData.property.name: 'to_ProductPlantProcurement' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductPlantProcurement : association [1] to ZA_PRODUCTPLANTPROCUREMENT on 1 = 1; 
 @OData.property.name: 'to_ProductSupplyPlanning' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductSupplyPlanning : association [1] to ZA_PRODUCTSUPPLYPLANNING on 1 = 1; 
 @OData.property.name: 'to_ProductWorkScheduling' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductWorkScheduling : association [1] to ZA_PRODUCTWORKSCHEDULING on 1 = 1; 
 @OData.property.name: 'to_StorageLocation' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _StorageLocation : association [0..*] to ZA_PRODUCTSTORAGELOCATION on 1 = 1; 
 } 

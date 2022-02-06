/********** GENERATED on 11/28/2021 at 09:25:40 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductStorageLocation' 
 @OData.entityType.name: 'A_ProductStorageLocationType' 
 define root abstract entity ZA_PRODUCTSTORAGELOCATION { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 key StorageLocation : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'WarehouseStorageBin_vc' 
 WarehouseStorageBin : abap.char( 10 ) ; 
 WarehouseStorageBin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaintenanceStatus_vc' 
 MaintenanceStatus : abap.char( 15 ) ; 
 MaintenanceStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PhysicalInventoryBlockInd_vc' 
 PhysicalInventoryBlockInd : abap.char( 1 ) ; 
 PhysicalInventoryBlockInd_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreationDate_vc' 
 CreationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CreationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMarkedForDeletion_vc' 
 IsMarkedForDeletion : abap_boolean ; 
 IsMarkedForDeletion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DateOfLastPostedCntUnRstrcd_vc' 
 DateOfLastPostedCntUnRstrcdStk : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 DateOfLastPostedCntUnRstrcd_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InventoryCorrectionFactor_vc' 
 InventoryCorrectionFactor : abap.fltp ; 
 InventoryCorrectionFactor_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvtryRestrictedUseStockInd_vc' 
 InvtryRestrictedUseStockInd : abap.char( 3 ) ; 
 InvtryRestrictedUseStockInd_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvtryCurrentYearStockInd_vc' 
 InvtryCurrentYearStockInd : abap.char( 3 ) ; 
 InvtryCurrentYearStockInd_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvtryQualInspCurrentYrStkI_vc' 
 InvtryQualInspCurrentYrStkInd : abap.char( 3 ) ; 
 InvtryQualInspCurrentYrStkI_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InventoryBlockStockInd_vc' 
 InventoryBlockStockInd : abap.char( 3 ) ; 
 InventoryBlockStockInd_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvtryRestStockPrevPeriodIn_vc' 
 InvtryRestStockPrevPeriodInd : abap.char( 3 ) ; 
 InvtryRestStockPrevPeriodIn_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InventoryStockPrevPeriod_vc' 
 InventoryStockPrevPeriod : abap.char( 3 ) ; 
 InventoryStockPrevPeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InvtryStockQltyInspPrevPeri_vc' 
 InvtryStockQltyInspPrevPeriod : abap.char( 3 ) ; 
 InvtryStockQltyInspPrevPeri_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HasInvtryBlockStockPrevPeri_vc' 
 HasInvtryBlockStockPrevPeriod : abap.char( 3 ) ; 
 HasInvtryBlockStockPrevPeri_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FiscalYearCurrentPeriod_vc' 
 FiscalYearCurrentPeriod : abap.numc( 4 ) ; 
 FiscalYearCurrentPeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FiscalMonthCurrentPeriod_vc' 
 FiscalMonthCurrentPeriod : abap.numc( 2 ) ; 
 FiscalMonthCurrentPeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FiscalYearCurrentInvtryPeri_vc' 
 FiscalYearCurrentInvtryPeriod : abap.numc( 4 ) ; 
 FiscalYearCurrentInvtryPeri_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LeanWrhsManagementPickingAr_vc' 
 LeanWrhsManagementPickingArea : abap.char( 3 ) ; 
 LeanWrhsManagementPickingAr_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

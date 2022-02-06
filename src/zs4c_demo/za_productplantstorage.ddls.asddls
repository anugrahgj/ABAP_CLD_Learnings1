/********** GENERATED on 11/28/2021 at 09:25:35 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlantStorage' 
 @OData.entityType.name: 'A_ProductPlantStorageType' 
 define root abstract entity ZA_PRODUCTPLANTSTORAGE { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'InventoryForCycleCountInd_vc' 
 InventoryForCycleCountInd : abap.char( 1 ) ; 
 InventoryForCycleCountInd_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProvisioningServiceLevel_vc' 
 ProvisioningServiceLevel : abap.char( 1 ) ; 
 ProvisioningServiceLevel_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CycleCountingIndicatorIsFix_vc' 
 CycleCountingIndicatorIsFixed : abap_boolean ; 
 CycleCountingIndicatorIsFix_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdMaximumStoragePeriodUni_vc' 
 ProdMaximumStoragePeriodUnit : abap.char( 3 ) ; 
 ProdMaximumStoragePeriodUni_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WrhsMgmtPtwyAndStkRemovalSt_vc' 
 WrhsMgmtPtwyAndStkRemovalStrgy : abap.char( 1 ) ; 
 WrhsMgmtPtwyAndStkRemovalSt_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

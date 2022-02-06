/********** GENERATED on 11/28/2021 at 09:25:43 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductWorkScheduling' 
 @OData.entityType.name: 'A_ProductWorkSchedulingType' 
 define root abstract entity ZA_PRODUCTWORKSCHEDULING { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'MaterialBaseQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MaterialBaseQuantity : abap.dec( 13, 3 ) ; 
 MaterialBaseQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnlimitedOverDelivIsAllowed_vc' 
 UnlimitedOverDelivIsAllowed : abap_boolean ; 
 UnlimitedOverDelivIsAllowed_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OverDelivToleranceLimit_vc' 
 OverDelivToleranceLimit : abap.dec( 3, 1 ) ; 
 OverDelivToleranceLimit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnderDelivToleranceLimit_vc' 
 UnderDelivToleranceLimit : abap.dec( 3, 1 ) ; 
 UnderDelivToleranceLimit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductionInvtryManagedLoc_vc' 
 ProductionInvtryManagedLoc : abap.char( 4 ) ; 
 ProductionInvtryManagedLoc_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductProcessingTime_vc' 
 ProductProcessingTime : abap.dec( 5, 2 ) ; 
 ProductProcessingTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductionSupervisor_vc' 
 ProductionSupervisor : abap.char( 3 ) ; 
 ProductionSupervisor_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductProductionQuantityUn_vc' 
 ProductProductionQuantityUnit : abap.char( 3 ) ; 
 ProductProductionQuantityUn_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdnOrderIsBatchRequired_vc' 
 ProdnOrderIsBatchRequired : abap.char( 1 ) ; 
 ProdnOrderIsBatchRequired_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TransitionMatrixProductsGro_vc' 
 TransitionMatrixProductsGroup : abap.char( 20 ) ; 
 TransitionMatrixProductsGro_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OrderChangeManagementProfil_vc' 
 OrderChangeManagementProfile : abap.char( 6 ) ; 
 OrderChangeManagementProfil_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MatlCompIsMarkedForBackflus_vc' 
 MatlCompIsMarkedForBackflush : abap.char( 1 ) ; 
 MatlCompIsMarkedForBackflus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SetupAndTeardownTime_vc' 
 SetupAndTeardownTime : abap.dec( 5, 2 ) ; 
 SetupAndTeardownTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductionSchedulingProfile_vc' 
 ProductionSchedulingProfile : abap.char( 6 ) ; 
 ProductionSchedulingProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TransitionTime_vc' 
 TransitionTime : abap.dec( 5, 2 ) ; 
 TransitionTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

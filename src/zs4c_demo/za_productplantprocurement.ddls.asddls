/********** GENERATED on 11/28/2021 at 09:25:34 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlantProcurement' 
 @OData.entityType.name: 'A_ProductPlantProcurementType' 
 define root abstract entity ZA_PRODUCTPLANTPROCUREMENT { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'IsAutoPurOrdCreationAllowed_vc' 
 IsAutoPurOrdCreationAllowed : abap_boolean ; 
 IsAutoPurOrdCreationAllowed_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsSourceListRequired_vc' 
 IsSourceListRequired : abap_boolean ; 
 IsSourceListRequired_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SourceOfSupplyCategory_vc' 
 SourceOfSupplyCategory : abap.char( 1 ) ; 
 SourceOfSupplyCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItmIsRlvtToJITDelivSchedule_vc' 
 ItmIsRlvtToJITDelivSchedules : abap.char( 1 ) ; 
 ItmIsRlvtToJITDelivSchedule_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

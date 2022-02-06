/********** GENERATED on 11/28/2021 at 09:25:37 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductQualityMgmt' 
 @OData.entityType.name: 'A_ProductQualityMgmtType' 
 define root abstract entity ZA_PRODUCTQUALITYMGMT { 
 key Product : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'QltyMgmtInProcmtIsActive_vc' 
 QltyMgmtInProcmtIsActive : abap_boolean ; 
 QltyMgmtInProcmtIsActive_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

/********** GENERATED on 11/28/2021 at 09:25:35 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlantQualityMgmt' 
 @OData.entityType.name: 'A_ProductPlantQualityMgmtType' 
 define root abstract entity ZA_PRODUCTPLANTQUALITYMGMT { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'MaximumStoragePeriod_vc' 
 MaximumStoragePeriod : abap.dec( 5, 0 ) ; 
 MaximumStoragePeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'QualityMgmtCtrlKey_vc' 
 QualityMgmtCtrlKey : abap.char( 8 ) ; 
 QualityMgmtCtrlKey_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MatlQualityAuthorizationGro_vc' 
 MatlQualityAuthorizationGroup : abap.char( 6 ) ; 
 MatlQualityAuthorizationGro_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HasPostToInspectionStock_vc' 
 HasPostToInspectionStock : abap_boolean ; 
 HasPostToInspectionStock_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InspLotDocumentationIsRequi_vc' 
 InspLotDocumentationIsRequired : abap_boolean ; 
 InspLotDocumentationIsRequi_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SuplrQualityManagementSyste_vc' 
 SuplrQualityManagementSystem : abap.char( 4 ) ; 
 SuplrQualityManagementSyste_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RecrrgInspIntervalTimeInDay_vc' 
 RecrrgInspIntervalTimeInDays : abap.dec( 5, 0 ) ; 
 RecrrgInspIntervalTimeInDay_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductQualityCertificateTy_vc' 
 ProductQualityCertificateType : abap.char( 4 ) ; 
 ProductQualityCertificateTy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

/********** GENERATED on 11/28/2021 at 09:26:09 by CB9980000107**************/
 @OData.entitySet.name: 'A_Product' 
 @OData.entityType.name: 'A_ProductType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZA_PRODUCT { 
 key Product : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'ProductType_vc' 
 ProductType : abap.char( 4 ) ; 
 ProductType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CrossPlantStatus_vc' 
 CrossPlantStatus : abap.char( 2 ) ; 
 CrossPlantStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CrossPlantStatusValidityDat_vc' 
 CrossPlantStatusValidityDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CrossPlantStatusValidityDat_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreationDate_vc' 
 CreationDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CreationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedByUser_vc' 
 CreatedByUser : abap.char( 12 ) ; 
 CreatedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangeDate_vc' 
 LastChangeDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 LastChangeDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangedByUser_vc' 
 LastChangedByUser : abap.char( 12 ) ; 
 LastChangedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangeDateTime_vc' 
 LastChangeDateTime : tzntstmpl ; 
 LastChangeDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMarkedForDeletion_vc' 
 IsMarkedForDeletion : abap_boolean ; 
 IsMarkedForDeletion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductOldID_vc' 
 ProductOldID : abap.char( 40 ) ; 
 ProductOldID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'GrossWeight_vc' 
 @Semantics.quantity.unitOfMeasure: 'WeightUnit' 
 GrossWeight : abap.dec( 13, 3 ) ; 
 GrossWeight_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchaseOrderQuantityUnit_vc' 
 PurchaseOrderQuantityUnit : abap.char( 3 ) ; 
 PurchaseOrderQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SourceOfSupply_vc' 
 SourceOfSupply : abap.char( 1 ) ; 
 SourceOfSupply_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WeightUnit_vc' 
 @Semantics.unitOfMeasure: true 
 WeightUnit : abap.unit( 3 ) ; 
 WeightUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NetWeight_vc' 
 @Semantics.quantity.unitOfMeasure: 'WeightUnit' 
 NetWeight : abap.dec( 13, 3 ) ; 
 NetWeight_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CountryOfOrigin_vc' 
 CountryOfOrigin : abap.char( 3 ) ; 
 CountryOfOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CompetitorID_vc' 
 CompetitorID : abap.char( 10 ) ; 
 CompetitorID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductGroup_vc' 
 ProductGroup : abap.char( 9 ) ; 
 ProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 BaseUnit : abap.char( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemCategoryGroup_vc' 
 ItemCategoryGroup : abap.char( 4 ) ; 
 ItemCategoryGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHierarchy_vc' 
 ProductHierarchy : abap.char( 18 ) ; 
 ProductHierarchy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Division_vc' 
 Division : abap.char( 2 ) ; 
 Division_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VarblPurOrdUnitIsActive_vc' 
 VarblPurOrdUnitIsActive : abap.char( 1 ) ; 
 VarblPurOrdUnitIsActive_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VolumeUnit_vc' 
 @Semantics.unitOfMeasure: true 
 VolumeUnit : abap.unit( 3 ) ; 
 VolumeUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialVolume_vc' 
 @Semantics.quantity.unitOfMeasure: 'VolumeUnit' 
 MaterialVolume : abap.dec( 13, 3 ) ; 
 MaterialVolume_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ANPCode_vc' 
 ANPCode : abap.numc( 9 ) ; 
 ANPCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Brand_vc' 
 Brand : abap.char( 4 ) ; 
 Brand_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProcurementRule_vc' 
 ProcurementRule : abap.char( 1 ) ; 
 ProcurementRule_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValidityStartDate_vc' 
 ValidityStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ValidityStartDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LowLevelCode_vc' 
 LowLevelCode : abap.char( 3 ) ; 
 LowLevelCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdNoInGenProdInPrepackPro_vc' 
 ProdNoInGenProdInPrepackProd : abap.char( 40 ) ; 
 ProdNoInGenProdInPrepackPro_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SerialIdentifierAssgmtProfi_vc' 
 SerialIdentifierAssgmtProfile : abap.char( 4 ) ; 
 SerialIdentifierAssgmtProfi_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SizeOrDimensionText_vc' 
 SizeOrDimensionText : abap.char( 32 ) ; 
 SizeOrDimensionText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndustryStandardName_vc' 
 IndustryStandardName : abap.char( 18 ) ; 
 IndustryStandardName_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductStandardID_vc' 
 ProductStandardID : abap.char( 18 ) ; 
 ProductStandardID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InternationalArticleNumberC_vc' 
 InternationalArticleNumberCat : abap.char( 2 ) ; 
 InternationalArticleNumberC_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductIsConfigurable_vc' 
 ProductIsConfigurable : abap_boolean ; 
 ProductIsConfigurable_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsBatchManagementRequired_vc' 
 IsBatchManagementRequired : abap_boolean ; 
 IsBatchManagementRequired_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExternalProductGroup_vc' 
 ExternalProductGroup : abap.char( 18 ) ; 
 ExternalProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CrossPlantConfigurableProdu_vc' 
 CrossPlantConfigurableProduct : abap.char( 40 ) ; 
 CrossPlantConfigurableProdu_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SerialNoExplicitnessLevel_vc' 
 SerialNoExplicitnessLevel : abap.char( 1 ) ; 
 SerialNoExplicitnessLevel_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductManufacturerNumber_vc' 
 ProductManufacturerNumber : abap.char( 40 ) ; 
 ProductManufacturerNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ManufacturerNumber_vc' 
 ManufacturerNumber : abap.char( 10 ) ; 
 ManufacturerNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ManufacturerPartProfile_vc' 
 ManufacturerPartProfile : abap.char( 4 ) ; 
 ManufacturerPartProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'QltyMgmtInProcmtIsActive_vc' 
 QltyMgmtInProcmtIsActive : abap_boolean ; 
 QltyMgmtInProcmtIsActive_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IndustrySector_vc' 
 IndustrySector : abap.char( 1 ) ; 
 IndustrySector_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ChangeNumber_vc' 
 ChangeNumber : abap.char( 12 ) ; 
 ChangeNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaterialRevisionLevel_vc' 
 MaterialRevisionLevel : abap.char( 2 ) ; 
 MaterialRevisionLevel_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HandlingIndicator_vc' 
 HandlingIndicator : abap.char( 4 ) ; 
 HandlingIndicator_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WarehouseProductGroup_vc' 
 WarehouseProductGroup : abap.char( 4 ) ; 
 WarehouseProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WarehouseStorageCondition_vc' 
 WarehouseStorageCondition : abap.char( 2 ) ; 
 WarehouseStorageCondition_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StandardHandlingUnitType_vc' 
 StandardHandlingUnitType : abap.char( 4 ) ; 
 StandardHandlingUnitType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SerialNumberProfile_vc' 
 SerialNumberProfile : abap.char( 4 ) ; 
 SerialNumberProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AdjustmentProfile_vc' 
 AdjustmentProfile : abap.char( 3 ) ; 
 AdjustmentProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PreferredUnitOfMeasure_vc' 
 PreferredUnitOfMeasure : abap.char( 3 ) ; 
 PreferredUnitOfMeasure_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsPilferable_vc' 
 IsPilferable : abap_boolean ; 
 IsPilferable_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsRelevantForHzdsSubstances_vc' 
 IsRelevantForHzdsSubstances : abap_boolean ; 
 IsRelevantForHzdsSubstances_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'QuarantinePeriod_vc' 
 QuarantinePeriod : abap.dec( 3, 0 ) ; 
 QuarantinePeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TimeUnitForQuarantinePeriod_vc' 
 TimeUnitForQuarantinePeriod : abap.char( 3 ) ; 
 TimeUnitForQuarantinePeriod_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'QualityInspectionGroup_vc' 
 QualityInspectionGroup : abap.char( 4 ) ; 
 QualityInspectionGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationGroup_vc' 
 AuthorizationGroup : abap.char( 4 ) ; 
 AuthorizationGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DocumentIsCreatedByCAD_vc' 
 DocumentIsCreatedByCAD : abap_boolean ; 
 DocumentIsCreatedByCAD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HandlingUnitType_vc' 
 HandlingUnitType : abap.char( 4 ) ; 
 HandlingUnitType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HasVariableTareWeight_vc' 
 HasVariableTareWeight : abap_boolean ; 
 HasVariableTareWeight_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumPackagingLength_vc' 
 @Semantics.quantity.unitOfMeasure: 'UnitForMaxPackagingDimensions' 
 MaximumPackagingLength : abap.dec( 15, 3 ) ; 
 MaximumPackagingLength_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumPackagingWidth_vc' 
 @Semantics.quantity.unitOfMeasure: 'UnitForMaxPackagingDimensions' 
 MaximumPackagingWidth : abap.dec( 15, 3 ) ; 
 MaximumPackagingWidth_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MaximumPackagingHeight_vc' 
 @Semantics.quantity.unitOfMeasure: 'UnitForMaxPackagingDimensions' 
 MaximumPackagingHeight : abap.dec( 15, 3 ) ; 
 MaximumPackagingHeight_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'UnitForMaxPackagingDimensio_vc' 
 @Semantics.unitOfMeasure: true 
 UnitForMaxPackagingDimensions : abap.unit( 3 ) ; 
 UnitForMaxPackagingDimensio_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_Description' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Description : association [0..*] to ZA_PRODUCTDESCRIPTION on 1 = 1; 
 @OData.property.name: 'to_Plant' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Plant : association [0..*] to ZA_PRODUCTPLANT on 1 = 1; 
 @OData.property.name: 'to_ProductBasicText' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductBasicText : association [0..*] to ZA_PRODUCTBASICTEXT on 1 = 1; 
 @OData.property.name: 'to_ProductInspectionText' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductInspectionText : association [0..*] to ZA_PRODUCTINSPECTIONTEXT on 1 = 1; 
 @OData.property.name: 'to_ProductProcurement' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductProcurement : association [1] to ZA_PRODUCTPROCUREMENT on 1 = 1; 
 @OData.property.name: 'to_ProductPurchaseText' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductPurchaseText : association [0..*] to ZA_PRODUCTPURCHASETEXT on 1 = 1; 
 @OData.property.name: 'to_ProductQualityMgmt' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductQualityMgmt : association [1] to ZA_PRODUCTQUALITYMGMT on 1 = 1; 
 @OData.property.name: 'to_ProductSales' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductSales : association [1] to ZA_PRODUCTSALES on 1 = 1; 
 @OData.property.name: 'to_ProductSalesTax' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductSalesTax : association [0..*] to ZA_PRODUCTSALESTAX on 1 = 1; 
 @OData.property.name: 'to_ProductStorage' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductStorage : association [1] to ZA_PRODUCTSTORAGE on 1 = 1; 
 @OData.property.name: 'to_ProductUnitsOfMeasure' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ProductUnitsOfMeasure : association [0..*] to ZA_PRODUCTUNITSOFMEASURE on 1 = 1; 
 @OData.property.name: 'to_SalesDelivery' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesDelivery : association [0..*] to ZA_PRODUCTSALESDELIVERY on 1 = 1; 
 @OData.property.name: 'to_Valuation' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _Valuation : association [0..*] to ZA_PRODUCTVALUATION on 1 = 1; 
 } 

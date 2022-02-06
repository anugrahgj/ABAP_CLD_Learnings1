/********** GENERATED on 11/28/2021 at 09:25:38 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductSalesDelivery' 
 @OData.entityType.name: 'A_ProductSalesDeliveryType' 
 define root abstract entity ZA_PRODUCTSALESDELIVERY { 
 key Product : abap.char( 40 ) ; 
 key ProductSalesOrg : abap.char( 4 ) ; 
 key ProductDistributionChnl : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'MinimumOrderQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MinimumOrderQuantity : abap.dec( 13, 3 ) ; 
 MinimumOrderQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SupplyingPlant_vc' 
 SupplyingPlant : abap.char( 4 ) ; 
 SupplyingPlant_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PriceSpecificationProductGr_vc' 
 PriceSpecificationProductGroup : abap.char( 2 ) ; 
 PriceSpecificationProductGr_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AccountDetnProductGroup_vc' 
 AccountDetnProductGroup : abap.char( 2 ) ; 
 AccountDetnProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryNoteProcMinDelivQty_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 DeliveryNoteProcMinDelivQty : abap.dec( 13, 3 ) ; 
 DeliveryNoteProcMinDelivQty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ItemCategoryGroup_vc' 
 ItemCategoryGroup : abap.char( 4 ) ; 
 ItemCategoryGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryQuantityUnit_vc' 
 @Semantics.unitOfMeasure: true 
 DeliveryQuantityUnit : abap.unit( 3 ) ; 
 DeliveryQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DeliveryQuantity_vc' 
 @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit' 
 DeliveryQuantity : abap.dec( 13, 3 ) ; 
 DeliveryQuantity_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductSalesStatus_vc' 
 ProductSalesStatus : abap.char( 2 ) ; 
 ProductSalesStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductSalesStatusValidityD_vc' 
 ProductSalesStatusValidityDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ProductSalesStatusValidityD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesMeasureUnit_vc' 
 SalesMeasureUnit : abap.char( 3 ) ; 
 SalesMeasureUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMarkedForDeletion_vc' 
 IsMarkedForDeletion : abap_boolean ; 
 IsMarkedForDeletion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHierarchy_vc' 
 ProductHierarchy : abap.char( 18 ) ; 
 ProductHierarchy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FirstSalesSpecProductGroup_vc' 
 FirstSalesSpecProductGroup : abap.char( 3 ) ; 
 FirstSalesSpecProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SecondSalesSpecProductGroup_vc' 
 SecondSalesSpecProductGroup : abap.char( 3 ) ; 
 SecondSalesSpecProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ThirdSalesSpecProductGroup_vc' 
 ThirdSalesSpecProductGroup : abap.char( 3 ) ; 
 ThirdSalesSpecProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FourthSalesSpecProductGroup_vc' 
 FourthSalesSpecProductGroup : abap.char( 3 ) ; 
 FourthSalesSpecProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FifthSalesSpecProductGroup_vc' 
 FifthSalesSpecProductGroup : abap.char( 3 ) ; 
 FifthSalesSpecProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MinimumMakeToOrderOrderQty_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 MinimumMakeToOrderOrderQty : abap.dec( 13, 3 ) ; 
 MinimumMakeToOrderOrderQty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LogisticsStatisticsGroup_vc' 
 LogisticsStatisticsGroup : abap.char( 1 ) ; 
 LogisticsStatisticsGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VolumeRebateGroup_vc' 
 VolumeRebateGroup : abap.char( 2 ) ; 
 VolumeRebateGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductCommissionGroup_vc' 
 ProductCommissionGroup : abap.char( 2 ) ; 
 ProductCommissionGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CashDiscountIsDeductible_vc' 
 CashDiscountIsDeductible : abap_boolean ; 
 CashDiscountIsDeductible_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PricingReferenceProduct_vc' 
 PricingReferenceProduct : abap.char( 40 ) ; 
 PricingReferenceProduct_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RoundingProfile_vc' 
 RoundingProfile : abap.char( 4 ) ; 
 RoundingProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductUnitGroup_vc' 
 ProductUnitGroup : abap.char( 4 ) ; 
 ProductUnitGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VariableSalesUnitIsNotAllow_vc' 
 VariableSalesUnitIsNotAllowed : abap_boolean ; 
 VariableSalesUnitIsNotAllow_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID01_vc' 
 ProductHasAttributeID01 : abap_boolean ; 
 ProductHasAttributeID01_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID02_vc' 
 ProductHasAttributeID02 : abap_boolean ; 
 ProductHasAttributeID02_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID03_vc' 
 ProductHasAttributeID03 : abap_boolean ; 
 ProductHasAttributeID03_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID04_vc' 
 ProductHasAttributeID04 : abap_boolean ; 
 ProductHasAttributeID04_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID05_vc' 
 ProductHasAttributeID05 : abap_boolean ; 
 ProductHasAttributeID05_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID06_vc' 
 ProductHasAttributeID06 : abap_boolean ; 
 ProductHasAttributeID06_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID07_vc' 
 ProductHasAttributeID07 : abap_boolean ; 
 ProductHasAttributeID07_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID08_vc' 
 ProductHasAttributeID08 : abap_boolean ; 
 ProductHasAttributeID08_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID09_vc' 
 ProductHasAttributeID09 : abap_boolean ; 
 ProductHasAttributeID09_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductHasAttributeID10_vc' 
 ProductHasAttributeID10 : abap_boolean ; 
 ProductHasAttributeID10_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_SalesTax' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesTax : association [0..*] to ZA_PRODUCTSALESTAX on 1 = 1; 
 @OData.property.name: 'to_SalesText' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesText : association [0..*] to ZA_PRODUCTSALESTEXT on 1 = 1; 
 } 

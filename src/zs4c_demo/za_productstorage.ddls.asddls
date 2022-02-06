/********** GENERATED on 11/28/2021 at 09:25:39 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductStorage' 
 @OData.entityType.name: 'A_ProductStorageType' 
 define root abstract entity ZA_PRODUCTSTORAGE { 
 key Product : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'StorageConditions_vc' 
 StorageConditions : abap.char( 2 ) ; 
 StorageConditions_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TemperatureConditionInd_vc' 
 TemperatureConditionInd : abap.char( 2 ) ; 
 TemperatureConditionInd_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'HazardousMaterialNumber_vc' 
 HazardousMaterialNumber : abap.char( 40 ) ; 
 HazardousMaterialNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'NmbrOfGROrGISlipsToPrintQty_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 NmbrOfGROrGISlipsToPrintQty : abap.dec( 13, 3 ) ; 
 NmbrOfGROrGISlipsToPrintQty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LabelType_vc' 
 LabelType : abap.char( 2 ) ; 
 LabelType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LabelForm_vc' 
 LabelForm : abap.char( 2 ) ; 
 LabelForm_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MinRemainingShelfLife_vc' 
 MinRemainingShelfLife : abap.dec( 4, 0 ) ; 
 MinRemainingShelfLife_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExpirationDate_vc' 
 ExpirationDate : abap.char( 1 ) ; 
 ExpirationDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ShelfLifeExpirationDatePeri_vc' 
 ShelfLifeExpirationDatePeriod : abap.char( 1 ) ; 
 ShelfLifeExpirationDatePeri_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TotalShelfLife_vc' 
 TotalShelfLife : abap.dec( 4, 0 ) ; 
 TotalShelfLife_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

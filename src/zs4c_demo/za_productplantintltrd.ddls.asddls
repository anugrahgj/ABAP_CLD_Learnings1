/********** GENERATED on 11/28/2021 at 09:25:33 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlantIntlTrd' 
 @OData.entityType.name: 'A_ProductPlantIntlTrdType' 
 define root abstract entity ZA_PRODUCTPLANTINTLTRD { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'CountryOfOrigin_vc' 
 CountryOfOrigin : abap.char( 3 ) ; 
 CountryOfOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RegionOfOrigin_vc' 
 RegionOfOrigin : abap.char( 3 ) ; 
 RegionOfOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ConsumptionTaxCtrlCode_vc' 
 ConsumptionTaxCtrlCode : abap.char( 16 ) ; 
 ConsumptionTaxCtrlCode_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductCASNumber_vc' 
 ProductCASNumber : abap.char( 15 ) ; 
 ProductCASNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdIntlTradeClassification_vc' 
 ProdIntlTradeClassification : abap.char( 9 ) ; 
 ProdIntlTradeClassification_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ExportAndImportProductGroup_vc' 
 ExportAndImportProductGroup : abap.char( 4 ) ; 
 ExportAndImportProductGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

/********** GENERATED on 11/28/2021 at 09:25:36 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductPlantText' 
 @OData.entityType.name: 'A_ProductPlantTextType' 
 define root abstract entity ZA_PRODUCTPLANTTEXT { 
 key Product : abap.char( 40 ) ; 
 key Plant : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'LongText_vc' 
 LongText : abap.string( 0 ) ; 
 LongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

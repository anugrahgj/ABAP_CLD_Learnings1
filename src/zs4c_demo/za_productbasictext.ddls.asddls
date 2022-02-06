/********** GENERATED on 11/28/2021 at 09:25:30 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductBasicText' 
 @OData.entityType.name: 'A_ProductBasicTextType' 
 define root abstract entity ZA_PRODUCTBASICTEXT { 
 key Product : abap.char( 40 ) ; 
 key Language : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'LongText_vc' 
 LongText : abap.string( 0 ) ; 
 LongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

/********** GENERATED on 11/28/2021 at 09:25:31 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductInspectionText' 
 @OData.entityType.name: 'A_ProductInspectionTextType' 
 define root abstract entity ZA_PRODUCTINSPECTIONTEXT { 
 key Product : abap.char( 40 ) ; 
 key Language : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'LongText_vc' 
 LongText : abap.string( 0 ) ; 
 LongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

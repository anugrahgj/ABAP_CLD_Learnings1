/********** GENERATED on 11/28/2021 at 09:25:30 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductDescription' 
 @OData.entityType.name: 'A_ProductDescriptionType' 
 define root abstract entity ZA_PRODUCTDESCRIPTION { 
 key Product : abap.char( 40 ) ; 
 key Language : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'ProductDescription_vc' 
 ProductDescription : abap.char( 40 ) ; 
 ProductDescription_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

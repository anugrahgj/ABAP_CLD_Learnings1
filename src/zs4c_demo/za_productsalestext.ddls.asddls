/********** GENERATED on 11/28/2021 at 09:25:39 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductSalesText' 
 @OData.entityType.name: 'A_ProductSalesTextType' 
 define root abstract entity ZA_PRODUCTSALESTEXT { 
 key Product : abap.char( 40 ) ; 
 key ProductSalesOrg : abap.char( 4 ) ; 
 key ProductDistributionChnl : abap.char( 2 ) ; 
 key Language : abap.char( 2 ) ; 
 @Odata.property.valueControl: 'LongText_vc' 
 LongText : abap.string( 0 ) ; 
 LongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

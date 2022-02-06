/********** GENERATED on 11/28/2021 at 09:25:38 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductSales' 
 @OData.entityType.name: 'A_ProductSalesType' 
 define root abstract entity ZA_PRODUCTSALES { 
 key Product : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'SalesStatus_vc' 
 SalesStatus : abap.char( 2 ) ; 
 SalesStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'SalesStatusValidityDate_vc' 
 SalesStatusValidityDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 SalesStatusValidityDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxClassification_vc' 
 TaxClassification : abap.char( 1 ) ; 
 TaxClassification_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TransportationGroup_vc' 
 TransportationGroup : abap.char( 4 ) ; 
 TransportationGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

/********** GENERATED on 11/28/2021 at 09:25:36 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductProcurement' 
 @OData.entityType.name: 'A_ProductProcurementType' 
 define root abstract entity ZA_PRODUCTPROCUREMENT { 
 key Product : abap.char( 40 ) ; 
 @Odata.property.valueControl: 'PurchaseOrderQuantityUnit_vc' 
 PurchaseOrderQuantityUnit : abap.char( 3 ) ; 
 PurchaseOrderQuantityUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'VarblPurOrdUnitStatus_vc' 
 VarblPurOrdUnitStatus : abap.char( 1 ) ; 
 VarblPurOrdUnitStatus_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PurchasingAcknProfile_vc' 
 PurchasingAcknProfile : abap.char( 4 ) ; 
 PurchasingAcknProfile_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

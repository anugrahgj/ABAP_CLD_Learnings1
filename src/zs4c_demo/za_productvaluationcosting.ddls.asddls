/********** GENERATED on 11/28/2021 at 09:25:42 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductValuationCosting' 
 @OData.entityType.name: 'A_ProductValuationCostingType' 
 define root abstract entity ZA_PRODUCTVALUATIONCOSTING { 
 key Product : abap.char( 40 ) ; 
 key ValuationArea : abap.char( 4 ) ; 
 key ValuationType : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'IsMaterialCostedWithQtyStru_vc' 
 IsMaterialCostedWithQtyStruc : abap_boolean ; 
 IsMaterialCostedWithQtyStru_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMaterialRelatedOrigin_vc' 
 IsMaterialRelatedOrigin : abap.char( 1 ) ; 
 IsMaterialRelatedOrigin_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostOriginGroup_vc' 
 CostOriginGroup : abap.char( 4 ) ; 
 CostOriginGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CostingOverheadGroup_vc' 
 CostingOverheadGroup : abap.char( 10 ) ; 
 CostingOverheadGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 

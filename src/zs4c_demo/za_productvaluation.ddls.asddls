/********** GENERATED on 11/28/2021 at 09:26:12 by CB9980000107**************/
 @OData.entitySet.name: 'A_ProductValuation' 
 @OData.entityType.name: 'A_ProductValuationType' 

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ] }*/
 define root abstract entity ZA_PRODUCTVALUATION { 
 key Product : abap.char( 40 ) ; 
 key ValuationArea : abap.char( 4 ) ; 
 key ValuationType : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'ValuationClass_vc' 
 ValuationClass : abap.char( 4 ) ; 
 ValuationClass_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PriceDeterminationControl_vc' 
 PriceDeterminationControl : abap.char( 1 ) ; 
 PriceDeterminationControl_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'StandardPrice_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 StandardPrice : abap.curr( 12, 3 ) ; 
 StandardPrice_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PriceUnitQty_vc' 
 PriceUnitQty : abap.dec( 5, 0 ) ; 
 PriceUnitQty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InventoryValuationProcedure_vc' 
 InventoryValuationProcedure : abap.char( 1 ) ; 
 InventoryValuationProcedure_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsMarkedForDeletion_vc' 
 IsMarkedForDeletion : abap_boolean ; 
 IsMarkedForDeletion_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'MovingAveragePrice_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 MovingAveragePrice : abap.curr( 12, 3 ) ; 
 MovingAveragePrice_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValuationCategory_vc' 
 ValuationCategory : abap.char( 1 ) ; 
 ValuationCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductUsageType_vc' 
 ProductUsageType : abap.char( 1 ) ; 
 ProductUsageType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductOriginType_vc' 
 ProductOriginType : abap.char( 1 ) ; 
 ProductOriginType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsProducedInhouse_vc' 
 IsProducedInhouse : abap_boolean ; 
 IsProducedInhouse_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProdCostEstNumber_vc' 
 ProdCostEstNumber : abap.numc( 12 ) ; 
 ProdCostEstNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProjectStockValuationClass_vc' 
 ProjectStockValuationClass : abap.char( 4 ) ; 
 ProjectStockValuationClass_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValuationClassSalesOrderSto_vc' 
 ValuationClassSalesOrderStock : abap.char( 4 ) ; 
 ValuationClassSalesOrderSto_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlannedPrice1InCoCodeCrcy_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 PlannedPrice1InCoCodeCrcy : abap.curr( 12, 3 ) ; 
 PlannedPrice1InCoCodeCrcy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlannedPrice2InCoCodeCrcy_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 PlannedPrice2InCoCodeCrcy : abap.curr( 12, 3 ) ; 
 PlannedPrice2InCoCodeCrcy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlannedPrice3InCoCodeCrcy_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 PlannedPrice3InCoCodeCrcy : abap.curr( 12, 3 ) ; 
 PlannedPrice3InCoCodeCrcy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FuturePlndPrice1ValdtyDate_vc' 
 FuturePlndPrice1ValdtyDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 FuturePlndPrice1ValdtyDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FuturePlndPrice2ValdtyDate_vc' 
 FuturePlndPrice2ValdtyDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 FuturePlndPrice2ValdtyDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FuturePlndPrice3ValdtyDate_vc' 
 FuturePlndPrice3ValdtyDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 FuturePlndPrice3ValdtyDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'TaxBasedPricesPriceUnitQty_vc' 
 @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
 TaxBasedPricesPriceUnitQty : abap.dec( 5, 0 ) ; 
 TaxBasedPricesPriceUnitQty_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PriceLastChangeDate_vc' 
 PriceLastChangeDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 PriceLastChangeDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PlannedPrice_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 PlannedPrice : abap.curr( 12, 3 ) ; 
 PlannedPrice_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'PrevInvtryPriceInCoCodeCrcy_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 PrevInvtryPriceInCoCodeCrcy : abap.curr( 12, 3 ) ; 
 PrevInvtryPriceInCoCodeCrcy_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Currency_vc' 
 @Semantics.currencyCode: true 
 Currency : abap.cuky ; 
 Currency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BaseUnit_vc' 
 @Semantics.unitOfMeasure: true 
 BaseUnit : abap.unit( 3 ) ; 
 BaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_MLAccount' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _MLAccount : association [0..*] to ZA_PRODUCTMLACCOUNT on 1 = 1; 
 @OData.property.name: 'to_MLPrices' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _MLPrices : association [0..*] to ZA_PRODUCTMLPRICES on 1 = 1; 
 @OData.property.name: 'to_ValuationAccount' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ValuationAccount : association [1] to ZA_PRODUCTVALUATIONACCOUNT on 1 = 1; 
 @OData.property.name: 'to_ValuationCosting' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ValuationCosting : association [1] to ZA_PRODUCTVALUATIONCOSTING on 1 = 1; 
 } 

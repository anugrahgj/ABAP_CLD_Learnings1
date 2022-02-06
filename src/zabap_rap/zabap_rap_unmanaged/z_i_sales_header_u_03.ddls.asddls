@AbapCatalog.sqlViewName: 'ZSHEADM_03'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Header Root View'


define root view Z_I_Sales_Header_U_03 as select from Z_I_Sales_Header_02
composition [0..*] of Z_I_Sales_Item_U_03 as _SItem_U_03
 {
    //Z_I_Sales_Header_02
    key sales_doc_num,
    date_created,
    person_created,
    sales_org,
    sales_dist,
    sales_div,
    total_cost,
    cost_currency,
    block_status,
    case block_status
        when '' then 'OK'
        when '99' then 'Aproval Required'
        else 'Blocked'
    end as block_status_msg,
    last_changed,
    /* Associations */
    //Z_I_Sales_Header_02
    _SItem_U_03
   
}


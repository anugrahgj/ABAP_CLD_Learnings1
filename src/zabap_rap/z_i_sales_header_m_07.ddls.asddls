@AbapCatalog.sqlViewName: 'ZSHEADM_07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Root CDS View Sales Header'
define root view Z_I_Sales_Header_M_07 as select from Z_I_Sales_Header_07
composition [0..*] of Z_I_Sales_Item_M_07 as _SItemM_07
 {

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
        when '99' then 'Approval Needed'
        else 'Blocked'
    end as block_status_msg,   
    last_changed,
    /* Associations */
    //_SD_Item_07
    _SItemM_07
}


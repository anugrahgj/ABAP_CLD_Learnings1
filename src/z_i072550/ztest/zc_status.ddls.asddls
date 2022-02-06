@EndUserText.label: 'Custom entity'
@ObjectModel:{ query.implementedBy: 'ABAP:ZCL_STATUS' }

define custom entity zc_status 
 {
  key OverallStatus : zoverall_status;
  @EndUserText.label: 'Status Text '
  OverallStatusText : abap.char(15);
  
}

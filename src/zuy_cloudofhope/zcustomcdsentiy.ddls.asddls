@EndUserText.label: 'custom cds entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CLOUDOFHOPE'
define custom entity zcustomcdsentiy 
  {
  key matnr : matnr;
  maktx : abap.char( 40 );
  
}

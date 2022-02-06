@EndUserText.label: 'Custom entity'
@ObjectModel: { query: { implementedBy: 'ABAP:ZZCL_STATUS'} ,
resultSet.sizeCategory: #XS }

define custom entity zzc_status
{
      @UI.facet  : [
                  {
                    id              :     'Status',
                    purpose         :     #STANDARD,
                    type            :     #IDENTIFICATION_REFERENCE,
                    label           :    'Overall Status',
                    position        : 10
                    }
                ]
      @ObjectModel.text.element: ['statustext']
  key OverallStatus     : zoverall_status;

      @Semantics.text             : true
      statustext : abap.char(15);

}

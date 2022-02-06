@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bank Services Subfamilies Root'

define root view entity ZPYX_I_SUBFAMILY as select from zpyxsubfamily as _Root
composition [0..*] of ZPYX_I_SUBFAMILY_T as _Text
association [1..*] to ZPYX_I_FAMILY_T as _FamilyText on $projection.FamilyId = _FamilyText.Guid 
{
 
    @ObjectModel.text.association: '_Text'
    key _Root.guid as Guid,
        _Root.afp as Afp,
        @Consumption.valueHelpDefinition: [{ entity: { name:    'ZPYX_I_FAMILY' , 
                                                       element: 'Guid'  } }]         
        _Root.family_id as FamilyId,
        @Semantics.user.createdBy: true
        _Root.created_by as CreatedBy,
        @Semantics.systemDateTime.createdAt: true        
        _Root.created_at as CreatedAt,
        @Semantics.user.lastChangedBy: true
        _Root.last_changed_by as LastChangedBy,
        @Semantics.systemDateTime.lastChangedAt: true
        _Root.last_changed_at as LastChangedAt,
 
    _Text,
    _FamilyText
    
}

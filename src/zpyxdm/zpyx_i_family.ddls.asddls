@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bank Services Families Root'

define root view entity ZPYX_I_FAMILY as select from zpyxfamily as _Root
composition [0..*] of ZPYX_I_FAMILY_T as _Text
//association [1..*] to  ZPYX_I_FAMILY_T as _Text on $projection.Guid = _Text.Guid
{
    @ObjectModel.text.association: '_Text'
    key _Root.guid as Guid,
        _Root.afp as Afp,
        @Semantics.user.createdBy: true
        _Root.created_by as CreatedBy,
        @Semantics.systemDateTime.createdAt: true        
        _Root.created_at as CreatedAt,
        @Semantics.user.lastChangedBy: true
        _Root.last_changed_by as LastChangedBy,
        @Semantics.systemDateTime.lastChangedAt: true
        _Root.last_changed_at as LastChangedAt,
     
    _Text // Make association public
}

@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bank Services Families Text'

define view entity ZPYX_I_FAMILY_T as select from zpyxfamily_t
association to parent ZPYX_I_FAMILY as _Parent on $projection.Guid = _Parent.Guid
{

    @ObjectModel.text.element: ['Descr']
    key guid as Guid,
    @Semantics.language: true
    key langu as Langu,
    @Semantics.text: true
        descr as Descr,    

    _Parent    
    
}

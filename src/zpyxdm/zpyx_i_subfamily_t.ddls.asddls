@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bank Services Subamilies Text'

define view entity ZPYX_I_SUBFAMILY_T as select from zpyxsubfamily_t
association to parent ZPYX_I_SUBFAMILY as _Parent on $projection.Guid = _Parent.Guid
{
 
    @ObjectModel.text.element: ['Descr']
    key guid as Guid,
    @Semantics.language: true
    key langu as Langu,
    @Semantics.text: true
        descr as Descr,
 
    _Parent   
}

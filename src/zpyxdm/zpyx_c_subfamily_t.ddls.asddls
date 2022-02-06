@EndUserText.label: 'Bank Services Subamilies Text'
@AccessControl.authorizationCheck: #CHECK

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: ['Guid']

define view entity ZPYX_C_SUBFAMILY_T as projection on ZPYX_I_SUBFAMILY_T
{
    key Guid,
    key Langu,
    @Search.defaultSearchElement: true
    Descr,

    /* Associations */
    _Parent: redirected to parent ZPYX_C_SUBFAMILY
}

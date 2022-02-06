@EndUserText.label: 'Bank Services Families'
@AccessControl.authorizationCheck: #CHECK

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: ['Guid']

define root view entity ZPYX_C_FAMILY provider contract transactional_query as projection on ZPYX_I_FAMILY 
{
        @ObjectModel.text.element: ['Descr']
    key Guid,
        @Search.defaultSearchElement: true
        _Text.Descr: localized,
        @Search.defaultSearchElement: true
        Afp,
        CreatedBy,
        CreatedAt,
        LastChangedBy,
        LastChangedAt,

    /* Associations */
    _Text: redirected to composition child ZPYX_C_FAMILY_T
    
}

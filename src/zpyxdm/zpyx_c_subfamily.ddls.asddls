@EndUserText.label: 'Bank Services Subfamilies'
@AccessControl.authorizationCheck: #CHECK

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: ['Guid']

define root view entity ZPYX_C_SUBFAMILY provider contract transactional_query as projection on ZPYX_I_SUBFAMILY 
{
    
        @ObjectModel.text.element: ['Descr']
    key Guid,
        @Search.defaultSearchElement: true
        _Text.Descr: localized,
        @Search.defaultSearchElement: true
        Afp,
        @ObjectModel.text.element: ['FamilyDesc']
        FamilyId,
        @Search.defaultSearchElement: true
        _FamilyText.Descr as FamilyDesc: localized,
        CreatedBy,
        CreatedAt,
        LastChangedBy,
        LastChangedAt,

    /* Associations */
    _FamilyText,
    _Text: redirected to composition child ZPYX_C_SUBFAMILY_T
    
}

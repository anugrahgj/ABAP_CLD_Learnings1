@EndUserText.label: 'Authors'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_I_AUTHORS as select from zauthors as Authors {
  key  authorid,
    authorname, 
@Semantics.user.createdBy: true    
    created_by,
@Semantics.systemDateTime.createdAt: true    
    created_at,
@Semantics.user.lastChangedBy: true    
    changed_by,
@Semantics.systemDateTime.localInstanceLastChangedAt: true    
    changed_at
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books'
define root view entity Z_I_BOOKS as select from zbooks
//association [0..1] to zauthors as _authors
//    on $projection.authorid = _authors.authorid 
    {
    key bookkey,
        bookid,
        bookname,
//        _authors.authorid as authorid,
//        _authors.authorname as authorname,
        price,
        currency,
      /*-- Admin data --*/
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at
//    _authors // Make association public
}

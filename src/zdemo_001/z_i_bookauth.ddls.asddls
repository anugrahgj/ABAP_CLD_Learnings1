@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books with Authors'
define root view entity Z_I_BOOKAUTH as select from Z_I_BOOKS as _books

//association [1..1] to Z_I_AUTHORS as _authors 
//on $projection.authorid = _authors.authorid
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

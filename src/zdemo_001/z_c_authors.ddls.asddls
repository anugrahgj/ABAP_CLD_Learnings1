@EndUserText.label: 'Authors'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@UI: {
 headerInfo: { typeName: 'Author', typeNamePlural: 'Authors', title: { type: #STANDARD, value: 'AuthorID' } } }
define root view entity Z_C_AUTHORS
  provider contract transactional_query
  as projection on Z_I_AUTHORS
{
//      @UI.facet: [ { id:              'Authors',
//                     purpose:         #STANDARD,
//                     type:            #IDENTIFICATION_REFERENCE,
//                     label:           'Books',
//                     position:        10 } ]
//
//      @UI.hidden: true
//  key authorkey,
      @UI: {
      lineItem:       [ { position: 10, importance: #HIGH } ],
      identification: [ { position: 10, label: 'Author Id [1,...,99999999]' } ] }
      @Search.defaultSearchElement: true
   key authorid,
      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20, label: 'Author Name' } ] }
      @Search.defaultSearchElement: true
      authorname
}

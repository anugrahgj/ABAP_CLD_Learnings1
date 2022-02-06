@EndUserText.label: 'Books'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@UI: {
 headerInfo: { typeName: 'Book', typeNamePlural: 'Books', title: { type: #STANDARD, value: 'BookID' } } }
define root view entity Z_C_BOOKS
  as projection on Z_I_BOOKAUTH
{
      @UI.facet: [ { id:              'Books',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Books',
                     position:        10 } ]

      @UI.hidden: true
  key bookkey,
      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20, label: 'Book Id [1,...,99999999]' } ] }
      @Search.defaultSearchElement: true
      bookid,
      @UI: {
      lineItem:       [ { position: 30, importance: #HIGH } ],
      identification: [ { position: 30, label: 'Book Name' } ] }
      @Search.defaultSearchElement: true
      bookname,
//      @UI.facet: [ { id:              'Authors',
//                  purpose:         #STANDARD,
//                  type:            #IDENTIFICATION_REFERENCE,
//                  label:           'Authors',
//                  position:        40 } ]
//
//      @UI.hidden: true
//      authorid,
//      @UI: {
//      lineItem:       [ { position: 50, importance: #HIGH } ],
//      identification: [ { position: 50, label: 'Author Name' } ] }
//      @Search.defaultSearchElement: true
//      authorname,
      @UI: {
      lineItem:       [ { position: 60, importance: #HIGH } ],
      identification: [ { position: 60, label: 'Price' } ] }
      @Semantics.amount.currencyCode: 'currency'
      price,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      currency
}

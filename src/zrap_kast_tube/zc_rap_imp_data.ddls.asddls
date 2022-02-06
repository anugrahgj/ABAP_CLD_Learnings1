@EndUserText.label: 'Projection interface view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

define view entity zc_rap_imp_data
  as projection on zi_rap_imp_data
{

  key EmployeeUUID,
      EmployeeId,
      TeamUUID,
      FirstName,
      LastName,
      Age,
      Title,
      @Search.defaultSearchElement: true
      Street,
      PostalCode,
      @Search.defaultSearchElement: true
      City,
      CountryCode,
      PhoneNumber,
      EmailAddress,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,

      _Team : redirected to parent ZC_UX_TEAM
}

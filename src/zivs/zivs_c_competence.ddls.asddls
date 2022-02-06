@EndUserText.label: 'Projection view of ZIVS_I_COMPETENCE'
@AccessControl.authorizationCheck: #CHECK

@Metadata.allowExtensions: true

define root view entity ZIVS_C_Competence
  provider contract transactional_query
  as projection on ZIVS_I_Competence
{
  key comp_id,
      FromDate,
      ToDate,
      Description,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
//      from_date,
//      to_date,
//      description,
//      created_by,
//      created_at,
//      last_changed_by,
//      last_changed_at,
      /* Associations */
      _Receiver : redirected to composition child ZIVS_C_Receiver,
      _Rule
}

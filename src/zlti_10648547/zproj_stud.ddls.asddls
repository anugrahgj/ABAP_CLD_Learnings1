
@EndUserText.label: 'Projection for the CDS view'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity zproj_stud as projection on zcds_stud as STUDENT {
    key StudentNum,
    StudentName,
    @Search.defaultSearchElement: true
    StudentSurname

}

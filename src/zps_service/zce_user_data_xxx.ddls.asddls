@EndUserText.label: 'User data custom entity - client'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_USERS_XXX'
define custom entity ZCE_USER_DATA_XXX {
 key username : abap.char( 100 ) ; 
 accountId : abap.int8 ; 
 accountStatus : abap.string( 0 ) ; 
 accountUuid : abap.string( 0 ) ; 
 createdDateTime : tzntstmpl ; 
 defaultLocale : abap.char( 32 ) ; 
 lastInactivationDateTime : tzntstmpl ; 
 lastLoginFailedDateTime : tzntstmpl ; 
 lastModifiedDateTime : tzntstmpl ; 
 personIdExternal : abap.string( 0 ) ; 
 sapGlobalUserId : abap.string( 0 ) ; 
 ETAG__ETAG : abap.string( 0 ) ; 
  
}

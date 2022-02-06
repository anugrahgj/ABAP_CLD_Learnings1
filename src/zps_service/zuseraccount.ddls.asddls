/********** GENERATED on 11/20/2021 at 11:00:43 by CB9980000117**************/
 @OData.entitySet.name: 'UserAccount' 
 @OData.entityType.name: 'UserAccount' 
 define root abstract entity ZUSERACCOUNT { 
 key username : abap.char( 100 ) ; 
 accountId : abap.int8 ; 
 accountStatus : abap.string( 0 ) ; 
 @Odata.property.valueControl: 'accountUuid_vc' 
 accountUuid : abap.string( 0 ) ; 
 accountUuid_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'createdDateTime_vc' 
 createdDateTime : tzntstmpl ; 
 createdDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'defaultLocale_vc' 
 defaultLocale : abap.char( 32 ) ; 
 defaultLocale_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'lastInactivationDateTime_vc' 
 lastInactivationDateTime : tzntstmpl ; 
 lastInactivationDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'lastLoginFailedDateTime_vc' 
 lastLoginFailedDateTime : tzntstmpl ; 
 lastLoginFailedDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'lastModifiedDateTime_vc' 
 lastModifiedDateTime : tzntstmpl ; 
 lastModifiedDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 personIdExternal : abap.string( 0 ) ; 
 @Odata.property.valueControl: 'sapGlobalUserId_vc' 
 sapGlobalUserId : abap.string( 0 ) ; 
 sapGlobalUserId_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 ETAG__ETAG : abap.string( 0 ) ; 
 
 } 

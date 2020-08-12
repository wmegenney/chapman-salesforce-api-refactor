%dw 2.0
import * from dw::core::Strings
output application/json
var viewname = attributes.queryParams.ViewName
var obj = [vars.varCreateRecords]
var address = obj map (
	{
    "RecordTypeId" : "address",	
    "AQB__Account__c": $."",
    "AQB__AccountExternalIDLinkField__c": $."EMPLID",
    "AQB__Contactid__c": $."",			
	"AQB__ContactExternalIDLinkField__c": $."EMPLID",
	"AQB__Type__c": capitalize($."ADDR_TYPE_SHORT") default "",
    "AQB__Street__c": $."ADDRESSLONG" default "",
    "AQB__City__c": $."CITY" default "",
    "AQB__County__c": $."COUNTY" default "",
    "AQB__StateId__c": $."STATE" default "",
    "AQB__StateProvince__c": $."STATE_DESCR" default "",
    "AQB__CountryId__c": $."COUNTRY_CD" default "",
    "AQB__Country__c": $."COUNTRY_NM" default "",
    "AQB__PostalCode__c": $."POSTAL" default "",
    "AQB__Status__c": $."STATUS"
	}
)
var email= obj map{
	
	"RecordTypeId" : "email",
    "AQB__ContactExternalIDLinkField__c": $."EMPLID",	
    "AQB__Contactid__c": $."",
    "AQB__Type__c": capitalize($.ADDRESS_TYPE) default "",
    "AQB__Email__c": $.EMAIL_ADDR default "",
    "AQB__Status__c":$."STATUS",
} 

var phone= obj map{
  
  "RecordTypeId" : "phone",
  "AQB__Contactid__c": $."",
  "AQB__ContactExternalIDLinkField__c": $."EMPLID",
  "AQB__Account__c": $."",
  "AQB__AccountExternalIDLinkField__c": $."EMPLID",
  "AQB__Type__c": $."PHONE_TYPE",   
   "AQB__Phone__c": $."PHONE",
   "AQB__Status__c": $."STATUS"



}
---
 if(viewname ~= "email")
 email
 else if(viewname ~= "address")
 address
 else
 phone
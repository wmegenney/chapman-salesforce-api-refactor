%dw 2.0
import * from dw::core::Strings
output application/json
var viewname = attributes.queryParams.ViewName
var obj = [vars.varCreateRecords]
var address = obj map (
	{
    "RecordTypeId" : "0122E000000h0QxQAI",	
    "AQB__Account__r":{
    	AQB__AccountExternalID__c: if ((capitalize($."ADDR_TYPE_SHORT") == "Billing") or( capitalize($."ADDR_TYPE_SHORT") =="Check") or (capitalize($."ADDR_TYPE_SHORT") =="Other" ) or( capitalize($."ADDR_TYPE_SHORT") =="Other 2" )or ( capitalize($."ADDR_TYPE_SHORT") =="Sevis Us") or ( capitalize($."ADDR_TYPE_SHORT") =="Sevis Foreign" ) or ( capitalize($."ADDR_TYPE_SHORT") =="Permanent")) $."EMPLID" else null,
			"type": "Account"
    },
    "AQB__AccountExternalIDLinkField__c": $."EMPLID",
    "AQB__Contact__r":{
    	AQB__ContactExternalID__c: if((capitalize($."ADDR_TYPE_SHORT") =="Business" ) or( capitalize($."ADDR_TYPE_SHORT") =="Legal" ) or( capitalize($."ADDR_TYPE_SHORT") =="Campus")) $."EMPLID" else null,
			"type": "Contact"
    },			
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
	
	"RecordTypeId" : "0122E000000h0QyQAI",
    "AQB__ContactExternalIDLinkField__c": $."EMPLID",	
    "AQB__Contact__r":{
    	AQB__ContactExternalID__c: $."EMPLID",
			"type": "Contact"
    },
    "AQB__Type__c": capitalize($.ADDRESS_TYPE) default "",
    "AQB__Email__c": $.EMAIL_ADDR default "",
    "AQB__Status__c":$."STATUS",
} 

var phone= obj map{
  
  "RecordTypeId" : "0122E000000h0R6QAI",
  "AQB__Contact__r":{
    	AQB__ContactExternalID__c: if(!(capitalize($."PHONE_TYPE") =="Home" ) or (capitalize($."PHONE_TYPE")=="Main" )) $."EMPLID" else null,
			"type": "Contact"
    },
  "AQB__ContactExternalIDLinkField__c": $."EMPLID",
  "AQB__Account__r":{
    	AQB__AccountExternalID__c: if((capitalize($."PHONE_TYPE") =="Home" ) or (capitalize($."PHONE_TYPE") =="Main" )) $."EMPLID" else null,
			"type": "Account"
    },
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
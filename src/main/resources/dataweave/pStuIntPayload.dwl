%dw 2.0
output application/json
import * from dw::core::Strings
---
vars.rootMessage.payload filter ($.EMPLID == vars.vUniqueEmpIds[vars.counter - 1]) map(value, index) ->{
	
	    "AQB__EducationLink__c": (vars.vEducationData filter $.AQB__ContactExternalID__c == leftPad(value.EMPLID,9,'0'))[0].AQB__Education__r[0].Id,
		"AQB__InterestType__r":  {
			"aqc_externalid__c" : value.DESCR_STDNT_GROUP ++ " " ++ value.DESCR_GROUP_TYPE,
			"type": "AQB__LLStudentInterestType__c"
			},
		"AQB__Position__c": value.DESCR_POSITION,
		"AQB__StartDay__c": value.START_DT_DAY as String,
		"AQB__StartMonth__c": value.START_DT_MONTH as String,
		"AQB__StartYear__c": value.START_DT_YEAR as String,
		"AQB__StopDay__c": value.END_DT_DAY as String,
		"AQB__StopMonth__c": value.END_DT_MONTH as String,
		"AQB__StopYear__c": value.END_DT_YEAR as String
} 
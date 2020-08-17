%dw 2.0
output application/java
---
payload map(value, index) ->{
		//"AQB__Contactid__c" : "HYPERLINK( AQB__EducationId__r.AQB__ContactId__c , AQB__EducationId__r.AQB__ContactId__r.FirstName + ' ' + AQB__EducationId__r.AQB__ContactId__r.LastName , '_self')",
		/*"AQB__EducationLink__r": {
			"AQB__Contact__r": {
			AQB__ContactExternalID__c: "0000013", //value.EMPLID ,
			"type": 'Contact'
			},
			"type": "AQB__Education__c"
		},*/
		
		"AQB__EducationLink__r": {
			Name: value.XC_AQ_DEG_LVL,
			"type" : 'AQB__EducationLink__c'
			
		},
		"AQB__EducationalInstitution__c" : "Chapman University" ,
		"AQB__InterestType__c": {
			Name: value.DESCR_GROUP_TYPE,
			"type": 'AQB__LLStudentInterestType__c'
			}, //
		"AQB__Position__c": value.DESCR_POSITION,
		"AQB__StartDay__c": value.START_DT_DAY as String,
		"AQB__StartMonth__c": value.START_DT_MONTH as String,
		"AQB__StartYear__c": value.START_DT_YEAR as String,
		"AQB__StopDay__c": value.END_DT_DAY as String,
		"AQB__StopMonth__c": value.END_DT_MONTH as String,
		"AQB__StopYear__c": value.END_DT_YEAR as String
}
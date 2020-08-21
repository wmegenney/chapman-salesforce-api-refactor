%dw 2.0
output application/java
fun status
(status) =
  status match {
    case 'active' -> 'Active'
    case 'retired' -> 'Retired'
    case 'historic' -> 'Historic'
    else -> 'Unknown'
  }

fun startedOrEnded
(arg) =
  arg match {
    case 'on' -> 'On'
    case 'on or after' -> 'On or After'
    case 'on or before' -> 'On or Before'
    else -> 'On'
  }
---
payload map (value, index) -> {
	"AQB__ContactId__r": {
		"AQB__ContactExternalID__c": value.EMPLID,
		"type": 'Contact'
	},
	"AQB__LinkedEmployer__r": {
		"AQB__AccountExternalID__c": value.EMPLID,
		"type": 'Account'
	},
	"AQB__EmploymentExternalID__c": value.EMPLID,
	"AQB__EndDate__c": value.END_DT as LocalDateTime {format: "yyyy-MM-dd'T'HH:mm:ss"} default '',
	"AQB__Ended__c": startedOrEnded(lower(value.XC_AQ_ENDED)),
	"AQB__StartDate__c": value.START_DT as LocalDateTime {format: "yyyy-MM-dd'T'HH:mm:ss"} default '',
	"AQB__Started__c": startedOrEnded(lower(value.XC_AQ_STARTED)),
	"AQB__Status__c": status(lower(value.XC_AQ_STATUS)),
	"AQB__Title__c": value.BUSINESS_TITLE,
	"Department_ID__c": value.DEPTID,
	"Department_Name__c": value.DEPTNAME,
	"AQB__Source__c": 'Campus Solutions'
}

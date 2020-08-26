%dw 2.0
fun RelType(RelTypeValue: String) =
  if (RelTypeValue == "Contact" or RelTypeValue == "Chapman Application Reference" or RelTypeValue == "Employee" or RelTypeValue == "Works For")
    "Business"
  else if (RelTypeValue == "Friend")
    "Friend"
  else if (RelTypeValue == "Never Married" or RelTypeValue == "None Indicated" or RelTypeValue == "Not Married" or RelTypeValue == "Unknown")
    "Unknown"
  else if (RelTypeValue == "Ex Child-In-Law" or RelTypeValue == "Ex Parent-In-Law" or RelTypeValue == "Ex Relationship" or RelTypeValue == "Ex Sibling-In-Law" or RelTypeValue == "Ex Spouse" or RelTypeValue == " Ex-Parent-in-law" or RelTypeValue == "Fiance" or RelTypeValue == "Godparent" or RelTypeValue == "Partner" or RelTypeValue == "Roommate" or RelTypeValue == "Separated Spouse" or RelTypeValue == "Ward")
    "Social"
  else
    "Family"
output application/java
---
payload default [] map (indexOfDBConData, dbConData) -> {
	"RecordTypeId": "0122E000000h0SVQAY",
	"AQB__ContactId__r": {
		"AQB__ContactExternalID__c": indexOfDBConData.EMPLID,
		"type": 'Contact'
	},
	"AQB__relatedContact__r": {
		"AQB__ContactExternalID__c": "00" ++ (indexOfDBConData.RELATEDEMPLID as String),
		"type": 'Contact'
	},
	"AQB__EndDate__c": indexOfDBConData.RELENDDATE,
	"AQB__Ended__c": indexOfDBConData.RELENDED,
	"AQB__Relationship__c": "Child",// indexOfDBConData.RELATIONSHIP,
	"AQB__ReverseRelationship__c": "Parent", //indexOfDBConData.REVRELATIONSHIP,
	"AQB__StartDate__c": indexOfDBConData.STARTDATE as Date {format: "yyyy-MM-dd'T'HH:mm:ss"},
	"AQB__Started__c": indexOfDBConData.STARTED,
	"AQB__Relationship_Type__c": RelType(indexOfDBConData.RELATIONSHIP as String),
	"AQB__Source__c": "Campus Solutions"
}
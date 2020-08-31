%dw 2.0
import * from dw::core::Strings
fun getRelationship(val) =
  if (val == "Child" or val == "Daughter" or val == "Son" or val == "")
    "Child"
  else if (val == "Daughter-in-Law" or val == "Son-In-Law")
    "Child-In-In-Law"
  else if (val == "Ex Daughter-in-Law" or val == "Ex Son-in-Law")
    "Ex Child-In-Law"
  else if (val == "Ex Parent-In-Law" or val == "Ex Father-in-Law" or val == "Ex Mother-in-Law")
    "Ex Parent-In-Law"
  else if (val == "Ex Brother-In-Law" or val == "Ex Sister-In-Law")
    "Ex Sibling-In-Law"
  else if (val == "Goddaughter" or val == "Godson" or val == "Godfather" or val == "Godmother")
    "Godparent"
  else if (val == "GrandChild" or val == "Granddaughter" or val == "Grandson")
    "Grandchild"
  else if (val == "Granddaughter-in-law" or val == "Grandson-In-Law")
    "Grandchild-In-Law"
  else if (val == "Grandfather" or val == "Grandmother" or val == "Grandparent")
    "Grandparent"
  else if (val == "Grand Mother-In-Law" or val == "Grandfather-in-Law")
    "Grandparent-In-Law"
  else if (val == "Great Granddaughter" or val == "Great Grandson")
    "Great Grandchild"
  else if (val == "Great Grandfather" or val == "Great Grandmother")
    "Great Grandparent"
  else if (val == "Great Great Granddaughter" or val == "Great Great Grandson")
    "Great Great Grandchild"
  else if (val == "Great Great Grandfather" or val == "Great Great Grandmother")
    "Great Great Grandparent"
  else if (val == "Great Great Great Grandson")
    "Great Great Great Grandchild"
  else if (val == "Great Great Great Grandfather")
    "Great Great Great Grandparent"
  else if (val == "Great Nephew" or val == "Great Niece")
    "Great Nephew/Niece"
  else if (val == "Great Aunt" or val == "Great Uncle")
    "Great Uncle/Aunt"
  else if (val == "Half Brother" or val == "Half Sister")
    "Half Sibling"
  else if (val == "Nephew" or val == "Nephew/Niece")
    "Nephew/Niece"
  else if (val == "Affiliated" or val == "Organization Affiliation")
    "Organization Affiliation"
  else if (val == "Father" or val == "Mother" or val == "Parent")
    "Parent"
  else if (val == "Father-in-Law" or val == "Mother-In-Law" or val == "Parent-In-Law")
    "Parent-In-Law"
  else if (val == "Companion" or val == "Domestic Partner" or val == "Life Partner" or val == "Partner")
    "Partner"
  else if (val == "Brother" or val == "Sibling" or val == "Sister")
    "Sibling"
  else if (val == "Brother-in-Law" or val == "Sibling-In-Law" or val == "Sister-In-Law")
    "Sibling-In-Law"
  else if (val == "Step Daughter" or val == "Step Son" or val == "Sister-In-Law")
    "Step Child"
  else if (val == "Step Daughter-In-law" or val == "Step Son-In-law")
    "Step Child-In-Law"
  else if (val == "Step Grandchild" or val == "Step Granddaughter" or val == "Step Grandson")
    "Step Grandchild"
  else if (val == "Step Grandfather" or val == "Step Grandmother" or val == "Step Grandson")
    "Step Grandparent"
  else if (val == "Step Nephew" or val == "Step Niece")
    "Step Nephew/Niece"
  else if (val == "Step Father" or val == "Step Mother" or val == "Step Parent")
    "Step Parent"
  else if (val == "Step Father-in-Law" or val == "Step Mother-in-Law")
    "Step Parent-In-Law"
  else if (val == "Step Brother" or val == "Step Sister")
    "Step Sibling"
  else if (val == "Step Aunt" or val == "Step Uncle")
    "Step Uncle/Aunt"
  else if (val == "Aunt" or val == "Uncle" or val == "Uncle/Aunt")
    "Uncle/Aunt"
  else if (val == "Widow(er)")
    "Widow/er"
  else if (val == "Executive Assistant")
    "Assisted By"
  else
    val
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
		"AQB__ContactExternalID__c": leftPad(indexOfDBConData.RELATEDEMPLID as String,9,"0"),
		"type": 'Contact'
	},
	"AQB__EndDate__c": indexOfDBConData.RELENDDATE,
	"AQB__Ended__c": indexOfDBConData.RELENDED,
	"AQB__Relationship__c": getRelationship(indexOfDBConData.RELATIONSHIP),
	"AQB__ReverseRelationship__c": getRelationship(indexOfDBConData.REVRELATIONSHIP),
	"AQB__StartDate__c": indexOfDBConData.STARTDATE as Date {format: "yyyy-MM-dd'T'HH:mm:ss"},
	"AQB__Started__c": indexOfDBConData.STARTED,
	"AQB__Relationship_Type__c": RelType(indexOfDBConData.RELATIONSHIP as String),
	"AQB__Source__c": "Campus Solutions"
}
%dw 2.0
output application/json
var obj =[payload]
---
obj map{
  "EMPLID": $."EMPLID",
  "ADDRESSLONG": $."ADDRESSLONG",
  "ADDRESS_TYPE": $."ADDR_TYPE_SHORT",
  "CITY": $."CITY",
  "COUNTY": $."COUNTY",
  "ADDR_TYPE_SHORT": $."ADDR_TYPE_SHORT",
  "STATE_DESCR": $."STATE_DESCR",
  "LAST_UPDT_DTTM": $."LAST_UPDT_DTTM",
  "COUNTRY_CD": $."COUNTRY_CD",
  "EMPLID": $."EMPLID",
  "COUNTRY_NM": $."COUNTRY_NM",
  "STATE": $."STATE",
  "POSTAL": $."POSTAL",
  "ADDRESSLINE": $."ADDRESSLINE",
  "STATUS": $."XC_AQ_STATUS"
}
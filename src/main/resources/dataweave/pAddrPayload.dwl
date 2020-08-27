%dw 2.0
import * from dw::core::Strings
output application/json
var obj =[payload]
---
obj map{
  "EMPLID": leftPad($."EMPLID", 9, "0"),
  "ADDRESSLONG": $."ADDRESSLONG",
  "ADDRESS_TYPE": $."ADDR_TYPE_SHORT",
  "CITY": $."CITY",
  "COUNTY": $."COUNTY",
  "ADDR_TYPE_SHORT": $."ADDR_TYPE_SHORT",
  "STATE_DESCR": $."STATE_DESCR",
  "LAST_UPDT_DTTM": $."LAST_UPDT_DTTM",
  "COUNTRY_CD": $."COUNTRY_CD",
  "COUNTRY_NM": $."COUNTRY_NM",
  "STATE": $."STATE",
  "POSTAL": $."POSTAL",
  "STATUS": $."XC_AQ_STATUS"
}
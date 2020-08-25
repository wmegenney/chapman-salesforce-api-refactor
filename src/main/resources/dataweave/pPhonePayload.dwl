%dw 2.0
import * from dw::core::Strings
output application/json
var obj=[payload]
---
obj map{
  
  
  "EMPLID":  leftPad($."EMPLID", 9, "0"),
  "PHONE_TYPE": $."SCC_PHONETYP_DESC",
  "PHONE": $."PHONE",
  "STATUS": $."XC_AQ_STATUS",
  "ADDRESS_TYPE": $."SCC_PHONETYP_DESC", // because its required in SF query further

}
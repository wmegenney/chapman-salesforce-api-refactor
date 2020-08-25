%dw 2.0
import * from dw::core::Strings
output application/json
var obj=[payload]
---
obj map{
  
  
    "EMPLID":leftPad($."EMPLID", 9, "0"),
    "EMAIL_ADDR": $."EMAIL_ADDR",
    "ADDRESS_TYPE": $."SCC_EMAILTYP_DESC",
    "STATUS": $."XC_AQ_STATUS"


}
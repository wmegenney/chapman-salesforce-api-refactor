%dw 2.0
output application/json
var obj=[payload]
---
obj map{
  
  
    "EMPLID": $."EMPLID",
    "EMAIL_ADDR": $."EMAIL_ADDR",
    "ADDRESS_TYPE": $."SCC_EMAILTYP_DESC",
    "STATUS": $."XC_AQ_STATUS"


}
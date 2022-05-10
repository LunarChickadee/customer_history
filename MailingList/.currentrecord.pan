global findcurrent
;, vSerialNum
findcurrent=0
;vSerialNum=""
//73229.DF9, 81405.swjgkecx
if vSerialNum contains info("serialnumber") 
local KeyStroke
KeyStroke=info("trigger")[5,-1]
;message KeyStroke //for debugging

waswindow = info("DatabaseName") 
if info("files") notcontains "customer_history"
stop
endif
;field «C#»
;copy

findcurrent=«C#»


window "customer_history:customeractivity"
find «C#»=findcurrent
window waswindow
;KeyStroke=info("trigger")[5,1]
if KeyStroke=chr(3)
call ".tab1"
endif
endif
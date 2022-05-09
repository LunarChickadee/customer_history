if vSerialNum notcontains info("serialnumber") 
message "Sorry, you can not use Coman+d without approval from Ken or Rachel"
stop
endif

global vsourcecust, vMem,  vTaxEx, vResale
vsourcecust=«C#»
vMem=«Mem?»
 vTaxEx=TaxEx
 vResale=resale
message "Customer "+str(«C#»)+ " selected!"
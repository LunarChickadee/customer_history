/*
if dbinfo(folderpath("folder"),"") notcontains lower("dedup") 
message "Sorry, you can not use CMD+d without approval from Ken or Lunar"
stop
endif
*/

global vsourcecust, vMem,  vTaxEx, vResale
vsourcecust=«C#»
vMem=«Mem?»
 vTaxEx=TaxEx
 vResale=resale
message "Customer "+str(«C#»)+ " selected!"

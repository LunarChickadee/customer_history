local vFieldsArray,vArraySize,vNum,vFinArray,vFolderName,vExportArray,vExportArray2
extendedexpressionstack



window "customer_historyUL"
if error 
message "customer_historyUL needs to be open"
endif
onerror {openfile "customer_historyUL"}

message "stop"
stop


/*
***This was used to copy field names into a tab delimited array to add to the top of this export, but it didn't work******
clipboard()=dbinfo("fields","")
vFieldsArray=dbinfo("fields","")
vArraySize=arraysize(vFieldsArray,¶)
vNum=0
vFinArray=""

loop
vNum=vNum+1
vFinArray=vFinArray+array(vFieldsArray,vNum,¶)+¬ //add quotes around ¬if you need them to show up in text form
until vNum=vArraySize

*******************************************************************************************************
*/

vFolderName=folder("patronageadmin:Desktop:PatDivUpdate:Backups:")

arraybuild vExportArray,¶,"",exportline()
;message "here"

/*
This line kept causing a stack overflow. No idea why it was too much sometimes, but not others
******************* 
vExportArray2=vFinArray+¶+vExportArray 
********************
*/



;stop
filesave vFolderName,"CH Backup"+datepattern(today(),"MMYY")+".txt","",vExportArray
window "PatDivTINs"
saveacopyas "patronageadmin:Desktop:PatDivUpdate:Backups:"+"PD Backup"+datepattern(today(),"MMYY")
normalexpressionstack
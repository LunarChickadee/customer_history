local vFieldsArray,vArraySize,vNum,vFinArray,vFolderName,vExportArray,vExportArray2
extendedexpressionstack



window "customer_history"

clipboard()=dbinfo("fields","")
vFieldsArray=dbinfo("fields","")
vArraySize=arraysize(vFieldsArray,¶)
vNum=0
vFinArray=""

loop
vNum=vNum+1
vFinArray=vFinArray+array(vFieldsArray,vNum,¶)+¬ //add quotes around ¬if you need them to show up in text form
until vNum=vArraySize

vFolderName=folder("patronageadmin:Desktop:PatDivUpdate:Backups:")

arraybuild vExportArray,¶,"",exportline()
message "here"

/*
This line keeps causing a stack overflow. No idea why. 
******************* 
vExportArray2=vFinArray+¶+vExportArray 
********************
*/



;stop
filesave vFolderName,"CH Backup"+datepattern(today(),"MMYY")+".txt","",vExportArray
window "PatDivTINs"
saveacopyas "patronageadmin:Desktop:PatDivUpdate:Backups:"+"PD Backup"+datepattern(today(),"MMYY")
normalexpressionstack
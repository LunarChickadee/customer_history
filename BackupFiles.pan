/**************Saves a copy with the date in the file 
and cleans up after there are more than 4*/

window "customer_history"
saveacopyas "patronageadmin:Desktop:PatDivUpdate:Backups:"+"CH Backup"+datepattern(today(),"MMYY")
window "PatDivTINs"
saveacopyas "patronageadmin:Desktop:PatDivUpdate:Backups:"+"PD Backup"+datepattern(today(),"MMYY")



///current version 1.1 below


/*
What this macro does:
1 - Get the proper folderpath
2 - Gets the name of all of the fields
3 - gets the bytecode for the folder
4 - saves a text copy of the linked file (so it can be used to get back data lost in a linked file issue)
5. saves a .pan copy of the unlinked file since that can't get overwritten by the server
*/

local vFieldsArray,vArraySize,vNum,vFinArray,vFolderName,vExportArray,vCurrentFolder,vCurrentFileName,vFileType
extendedexpressionstack



/*****gets folder Path. Uncomment to run this function once and point where your file is gonna go. 

It needs an actual file, so put a text file or something in the folder you want to save in if it's an empty folder*/
;openfiledialog vCurrentFolder,vCurrentFileName,vFileType,""
;clipboard()=folderpath(vCurrentFolder)
;stop

/******paste it after vFolderName=folder("x") if you're doing things across the network, otherwise, 
take out "folderpath" above to just get the bytecode and put that after the = sign of vFolderName below*/
//Holding spot for the Paste: patronageadmin:Desktop:PatDivUpdate:Backups:  //":" is Pan's version of "/" in file paths

vFieldsArray=dbinfo("fields","")
vArraySize=arraysize(vFieldsArray,¶)
vNum=0
vFinArray=""

loop
vNum=vNum+1
vFinArray=vFinArray+array(vFieldsArray,vNum,¶)+¬ //add quotes around ¬if you need them to show up in text form
until vNum=vArraySize

vFolderName=folder("patronageadmin:Desktop:PatDivUpdate:Backups:")

window "customer_history"
arraybuild vExportArray,¶,"",exportline()
vExportArray=vFinArray+¶+vExportArray
;stop
filesave vFolderName,"CH Backup"+datepattern(today(),"MMYY")+".txt","",vExportArray
window "PatDivTINs"
saveacopyas "patronageadmin:Desktop:PatDivUpdate:Backups:"+"PD Backup"+datepattern(today(),"MMYY")
normalexpressionstack



v2 *************************************


/*
What this macro does:
1 - Get the proper folderpath
2 - Gets the name of all of the fields
3 - gets the bytecode for the folder
4 - saves a text copy of the linked file (so it can be used to get back data lost in a linked file issue)
5. saves a .pan copy of the unlinked file since that can't get overwritten by the server
*/

local vFieldsArray,vArraySize,vNum,vFinArray,vExportArray,vCurrentFolder,vCurrentFileName,vFileType,vSecondSave

extendedexpressionstack


/*****gets folder Path. Uncomment to run this function once and point where your file is gonna go. 

It needs an actual file, so put a text file or something in the folder you want to save in if it's an empty folder*/
;openfiledialog vCurrentFolder,vCurrentFileName,vFileType,""
;clipboard()=folderpath(vCurrentFolder)
;stop

/******paste it after FolderName  =folder("x") if you're doing things across the network, otherwise, 
take out "folderpath" above to just get the bytecode and put that after the = sign of vFolderName below*/
//Holding spot for the Paste: patronageadmin:Desktop:PatDivUpdate:Backups: 

vFieldsArray=dbinfo("fields","")
vArraySize=arraysize(vFieldsArray,¶)
vNum=0
vFinArray=""

loop
vNum=vNum+1
vFinArray=vFinArray+array(vFieldsArray,vNum,¶)+¬ //add quotes around ¬if you need them to show up in text form
until vNum=vArraySize

vFolderName=folder("patronageadmin:Desktop:PatDivUpdate:Backups:")
vSecondSave=vFolderName  //for some reason this kept breaking if I didn't save it again
;clipboard()=vFolderName

window "customer_history"
arraybuild vExportArray,¶,"",exportline()
vExportArray=vFinArray+¶+vExportArray
;stop
filesave vSecondSave,"CH Backup"+datepattern(today(),"MMYY")+".txt","",vExportArray
window "PatDivTINs"
saveacopyas "patronageadmin:Desktop:PatDivUpdate:Backups:"+"PD Backup"+datepattern(today(),"MMYY")
normalexpressionstack
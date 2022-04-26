/**************Saves a copy with the date in the file 
and cleans up after there are more than 4*/

window "customer_history"
saveacopyas "CH Backup"+datepattern(today(),"MMYY")
window "PatDivTINs"
saveacopyas "PD Backup"+datepattern(today(),"MMYY")


//******Second Try

local vPath,vFolder

vPath=listfiles(folder(""),"")
vFolder=folder(vPath)

filesave "Backups","CH Backup"+datepattern(today(),"MMYY"),"TEXTttxt",""

///try 3

local vPath,vFolder

vPath=listfiles(folder(""),"")
message vPath
vFolder=folder(array(vPath,"Backups",¶))
message vFolder
clipboard=vFolder

filesave vFolder,"CH Backup"+datepattern(today(),"MMYY"),"TEXTttxt",""

//try 4
local vPath,vFolder

vPath=listfiles(folder(""),"")
message vPath
vFolder=folder(arraysearch(vPath,"Backups",1,¶))
message vFolder
clipboard=vFolder

filesave vFolder,"CH Backup"+datepattern(today(),"MMYY"),"TEXTttxt",""


//try 5

local vPath,vFolder

vPath=listfiles(folder(""),"")
message vPath
vFolder=folder("Backups")
message vFolder
clipboard=vFolder

filesave vFolder,"CH Backup"+datepattern(today(),"MMYY"),"TEXTttxt",""
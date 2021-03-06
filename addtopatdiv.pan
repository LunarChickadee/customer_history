/*
local file,folder,type
openfiledialog folder,file,type,"TEXT"
if file=""
stop 
endif
openfile "+"+folderpath((folder))+file
*/

global vPatDivFolder, vPatDivFileName,type
select TIN≠""

openfiledialog vPatDivFolder, vPatDivFileName,type,""
openfile folderpath(vPatDivFolder)+vPatDivFileName

put in cust history file
select TIN contains lookupselected("PatDivTINs","TINRedacted",«TIN»,"TINRedacted","",0)




//***********To fix windows for input in pat div file*******************\\

openfile "customer_history"

global windows,custwindow,patwindow,ToClose,vChoice


alertokcancel "This will now close all windows except for PatDivTINs and customer_history File on this computer to reduce errors"
if info("DialogTrigger") contains "cancel"
stop
endif  

arraybuild windows,¶,"",info("windows")

loop
ToClose=arraysearch(windows,"*:*",1,¶) /*this finds all the forms since they have a colon in them*/
if ToClose≠0
message ToClose
vChoice=array(windows,ToClose,¶)
window vChoice
closewindow
endif
until ToClose=0

custwindow=arraysearch(windows,"*cust*",1,¶)
patwindow=arraysearch(windows,"*pat*",1,¶)

window custwindow
select TIN≠""
select lookupselected(patwindow,"TINRedacted","TIN"[-4,-1],"TIN","",0)

select TIN contains lookupselected("PatDivTINs","TINRedacted",«TIN»,"TINRedacted","",0)







;if info("windows") contains "customeractivity"
;goform "customeractivity"
;endif

filedate(thefolder,thefile)
movefile
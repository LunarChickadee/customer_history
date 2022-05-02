local vFilesList,vFolder,Choice1,Choice2,vNum,vListCount,vTimeArray,vTextTime,vDictionary
local vTimeArray

vFilesList=listfiles(folder("patronageadmin:Desktop:PatDivUpdate:Backups:"),"")
vFolder=folder("patronageadmin:Desktop:PatDivUpdate:Backups:")
vListCount=arraysize(vFilesList,¶)
vNum=0

loop
vNum=vNum+1
Choice1=array(vFilesList,vNum,¶)

vTimeArray=vTimeArray+filedate(vFolder,Choice1)
vTextTime=vTextTime+datepattern(vTimeArray,"mm/dd/yy")

until vNum=vListCount

clipboard()=vTimeArray+vTextTime








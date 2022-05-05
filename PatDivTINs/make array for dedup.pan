local vCNum
vCNum=""

loop
if «C#»>0
vCNum=vCNum+str(«C#»)
downrecord
repeatloopif vCNum≠""
else
Group=vCNum
vCNum=""
endif
until info("stopped")

//////v2

local vCNum
vCNum=""

loop
if «C#»>0
vCNum=vCNum+¬+str(«C#»)
downrecord
else
Group=vCNum
vCNum=""
endif
until info("stopped")


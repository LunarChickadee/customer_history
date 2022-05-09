global CustNum1,CustNum2,CustNum3,CustNum4,TINstring,WinCust,
WinMailing,WinSSN,CustNumArray,SeedsLineItemArray,SeedsElement,SeedsNonBlankElement,SeedsIncrement,BulbsNonBlankElement,BulbsIncrement,MooseNonBlankElement,MooseIncrement,OGSNonBlankElement,OGSIncrement,TreesNonBlankElement,TreesIncrement,BulbsLineItemArray,MooseLineItemArray,OGSLineItemArray,TreesLineItemArray,TreesElement,BulbsElement,OGSElement,MooseElement,CustNumDict,CustNum2Dict,CustNum3Dict,CustNum4Dict,CustCount,CustNums,vChoice,Counter,SourceRecord,DestinationRecord

//window assignments
WinCust="customer_history"
WinMailing="44 mailing list"
WinSSN="ssn (delete after using)"

//variable initializing
CustNum1=""
CustNum2=""
CustNum3=""
CustNum4=""
SeedsElement=""
SeedsNonBlankElement=""
BulbsNonBlankElement=""
TreesElement=""
BulbsElement=""
OGSElement=""
MooseElement=""
CustNumDict=""
CustNum2Dict=""
CustNum3Dict=""
CustNum4Dict=""
Counter=0
SourceRecord=""
DestinationRecord=""


//loops

//set Customer Numbers
window WinSSN
CustNumArray=C1+¬+C2+¬+C3+¬+C4
CustNum1=array(CustNumArray,1,¬)
CustNum2=array(CustNumArray,2,¬)
CustNum3=array(CustNumArray,3,¬)
CustNum4=array(CustNumArray,4,¬)

CustNums=CustNum1+¬+CustNum2+¬+CustNum3+¬+CustNum4


//set customer history array for one Customer Number
window WinCust

CustCount=0

Repeat:
selectall

CustCount=CustCount+1
vChoice=val(CustCount)
if val(array(CustNumArray,CustCount,¬))>0
    
    select «C#»=val(array(CustNumArray,CustCount,¬))
    SeedsLineItemArray=lineitemarray("SΩ",";")
    BulbsLineItemArray=lineitemarray("BFΩ",";")
    OGSLineItemArray=lineitemarray("OGSΩ",";")
    TreesLineItemArray=lineitemarray("TΩ",";")
    MooseLineItemArray=lineitemarray("MΩ",";")

    /*
    The following tests every line item for each branch to find the most recent "year" that the customer has bought something under this account
    */
    //find first non-zero in the seeds lineitemarray and return that element 
    SeedsIncrement=1
    loop
    SeedsNonBlankElement=arraysearch(SeedsLineItemArray,"*.*",SeedsIncrement,";")
    if val(SeedsNonBlankElement)≠0
    SeedsIncrement=val(SeedsNonBlankElement)+1
    repeatloopif val(array(SeedsLineItemArray,SeedsNonBlankElement,";"))<0.01
    endif

    //find first non-zero in the bulbs lineitemarray and return that element 
    BulbsIncrement=1
    loop
    BulbsNonBlankElement=arraysearch(BulbsLineItemArray,"*.*",BulbsIncrement,";")
    if val(BulbsNonBlankElement)≠0
    BulbsIncrement=val(BulbsNonBlankElement)+1
    repeatloopif val(array(BulbsLineItemArray,BulbsNonBlankElement,";"))<0.01
    endif

    //find first non-zero in the trees lineitemarray and return that element 
    TreesIncrement=1
    loop
    TreesNonBlankElement=arraysearch(TreesLineItemArray,"*.*",TreesIncrement,";")
    if val(TreesNonBlankElement)≠0
    TreesIncrement=val(TreesNonBlankElement)+1
    repeatloopif val(array(TreesLineItemArray,TreesNonBlankElement,";"))<0.01
    endif

    //find first non-zero in the OGS lineitemarray and return that element 
    OGSIncrement=1
    loop
    OGSNonBlankElement=arraysearch(OGSLineItemArray,"*.*",OGSIncrement,";")
    if val(OGSNonBlankElement)≠0
    OGSIncrement=val(OGSNonBlankElement)+1
    repeatloopif val(array(OGSLineItemArray,OGSNonBlankElement,";"))<0.01
    endif

    //find first non-zero in the Moose lineitemarray and return that element 
    MooseIncrement=1
    loop
    MooseNonBlankElement=arraysearch(MooseLineItemArray,"*.*",MooseIncrement,";")
    if val(MooseNonBlankElement)≠0
    MooseIncrement=val(MooseNonBlankElement)+1
    repeatloopif val(array(MooseLineItemArray,MooseNonBlankElement,";"))<0.01
    endif

/*
Fill Account 
*/
if vChoice=1
setdictionaryvalue CustNumDict,CustNum1,str(SeedsNonBlankElement)+¬+str(BulbsNonBlankElement)+¬+str(TreesNonBlankElement)+¬+str(OGSNonBlankElement)+¬+str(MooseNonBlankElement)
endif
if vChoice=2
setdictionaryvalue CustNumDict,CustNum2,str(SeedsNonBlankElement)+¬+str(BulbsNonBlankElement)+¬+str(TreesNonBlankElement)+¬+str(OGSNonBlankElement)+¬+str(MooseNonBlankElement)
endif
if vChoice=3
setdictionaryvalue CustNumDict,CustNum3,str(SeedsNonBlankElement)+¬+str(BulbsNonBlankElement)+¬+str(TreesNonBlankElement)+¬+str(OGSNonBlankElement)+¬+str(MooseNonBlankElement)
endif
if vChoice=4
setdictionaryvalue CustNumDict,CustNum4,str(SeedsNonBlankElement)+¬+str(BulbsNonBlankElement)+¬+str(TreesNonBlankElement)+¬+str(OGSNonBlankElement)+¬+str(MooseNonBlankElement)
endif

endif

if vChoice≠4
goto Repeat
endif

loop
Counter=Counter+1
getdictionararykey CustNumDict,Counter,DestinationRecord
repeatloopif DestinationRecord=""

if length(DestinationRecord)>6
message "Please Choose Source/Destination Manually"
endif



select val(CustNum1)=«C#»
or val(CustNum2)=«C#»
or val(CustNum3)=«C#»
or val(CustNum4)=«C#»
selectwithin «C#»>0

clipboard()=CustNumDict
bigmessage listdictionarynames CustNumDict,""
/*
clipboard()=CustNumDict+¶+CustNum2Dict+¶+CustNum3Dict+¶+CustNum4Dict
7270	4	0	6	14	6
172174	3	0	0	8	4
*/

/*
˛7254ˇ15	0	6	12	17˛/7254ˇ
˛262068ˇ13	0	12	8	4˛/262068ˇ
˛391429ˇ0	0	3	0	0˛/391429ˇ
*/



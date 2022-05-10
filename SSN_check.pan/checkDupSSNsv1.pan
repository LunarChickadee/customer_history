global CustNum1,CustNum2,CustNum3,CustNum4,TINstring,WinCust,
WinMailing,WinSSN,CustNumArray,SeedsLineItemArray,SeedsElement,SeedsNonBlankElement,SeedsIncrement,BulbsNonBlankElement,BulbsIncrement,MooseNonBlankElement,MooseIncrement,OGSNonBlankElement,OGSIncrement,TreesNonBlankElement,TreesIncrement,BulbsLineItemArray,MooseLineItemArray,OGSLineItemArray,TreesLineItemArray,TreesElement,BulbsElement,OGSElement,MooseElement,CustNum1Array,CustNum2Array,CustNum3Array,CustNum4Array,CustCount,CustNums,vChoice,SourceRecordArray,DestinationRecord,Counter,Check1,Check2,Check3,Check4

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
CustNum1Array=""
CustNum2Array=""
CustNum3Array=""
CustNum4Array=""
SourceRecordArray=""
DestinationRecord=""
Counter=0
Check1=""
Check2=""
Check3=""
Check4=""




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
CustNum1Array=CustNum1+¬+str(SeedsNonBlankElement)+¬+str(BulbsNonBlankElement)+¬+str(TreesNonBlankElement)+¬+str(OGSNonBlankElement)+¬+str(MooseNonBlankElement)
endif
if vChoice=2
CustNum2Array=CustNum2+¬+str(SeedsNonBlankElement)+¬+str(BulbsNonBlankElement)+¬+str(TreesNonBlankElement)+¬+str(OGSNonBlankElement)+¬+str(MooseNonBlankElement)
endif
if vChoice=3
CustNum3Array=CustNum3+¬+str(SeedsNonBlankElement)+¬+str(BulbsNonBlankElement)+¬+str(TreesNonBlankElement)+¬+str(OGSNonBlankElement)+¬+str(MooseNonBlankElement)
endif
if vChoice=4
CustNum4Array=CustNum4+¬+str(SeedsNonBlankElement)+¬+str(BulbsNonBlankElement)+¬+str(TreesNonBlankElement)+¬+str(OGSNonBlankElement)+¬+str(MooseNonBlankElement)
endif

endif

if vChoice≠4
goto Repeat
endif

bigmessage CustNum1Array+¶+CustNum2Array+¶+CustNum3Array+¶+CustNum4Array
clipboard()=CustNum1Array+¶+CustNum2Array+¶+CustNum3Array+¶+CustNum4Array


Check1=arrayrange(CustNum1Array,2,5,¬)
Check2=arrayrange(CustNum2Array,2,5,¬)
Check3=arrayrange(CustNum3Array,2,5,¬)
Check4=arrayrange(CustNum4Array,2,5,¬)


loop
Counter=Counter+1
if ArrayContains(Check1,str(Counter),¬)
DestinationRecord=array(CustNum1Array,1,¬)
endif
if ArrayContains(Check2,str(Counter),¬)
DestinationRecord=array(CustNum2Array,1,¬)
endif
if ArrayContains(Check3,str(Counter),¬)
DestinationRecord=array(CustNum3Array,1,¬)
endif
if ArrayContains(Check4,str(Counter),¬)
DestinationRecord=array(CustNum4Array,1,¬)
endif
repeatloopif DestinationRecord=""

message DestinationRecord
/*
7254	15	0	6	12	17
262068	13	0	12	8	4
391429	0	0	3	0	0
*/
;loop 



/*
Counter=Counter+1

loop
Counter=Counter+1
if ArrayContains CustNum1Array,str(Counter),¬)
DestinationRecord=array(CustNum1Array,1,¬)
if ArrayContains CustNum2Array,str(Counter),¬)
DestinationRecord=array(CustNum2Array,1,¬)

repeatloopif DestinationRecord=""

setArrayionaryvalue SArray,
message val(array(CustNum1Array,2,¬))
if val(array(CustNum1Array,2,¬))>0
SArray=val(array(CustNum1Array,1,¬))
endif
*/


select val(CustNum1)=«C#»
or val(CustNum2)=«C#»
or val(CustNum3)=«C#»
or val(CustNum4)=«C#»
selectwithin «C#»>0

selectwithin «C#»≠val(DestinationRecord)

farcall 44mailinglist, SelectSourceRecord



global CustNum1,CustNum2,CustNum3,CustNum4,TINstring,WinCust,
WinMailing,WinSSN,CustNumArray,SeedsLineItemArray,SeedsElement,SeedsNonBlankElement,SeedsIncrement,BulbsNonBlankElement,BulbsIncrement,MooseNonBlankElement,MooseIncrement,OGSNonBlankElement,OGSIncrement,TreesNonBlankElement,TreesIncrement,BulbsLineItemArray,MooseLineItemArray,OGSLineItemArray,TreesLineItemArray,TreesElement,BulbsElement,OGSElement,MooseElement,CustNum1Array,CustNum2Array,CustNum3Array,CustNum4Array

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


//loops

//set Customer Numbers
window WinSSN
CustNumArray=C1+¬+C2+¬+C3+¬+C4
CustNum1=array(CustNumArray,1,¬)
CustNum2=array(CustNumArray,2,¬)
CustNum3=array(CustNumArray,3,¬)
CustNum4=array(CustNumArray,4,¬)


//set customer history array for one Customer Number
window WinCust

select «C#»=val(CustNum1)
SeedsLineItemArray=lineitemarray("SΩ",";")
BulbsLineItemArray=lineitemarray("BFΩ",";")
OGSLineItemArray=lineitemarray("OGSΩ",";")
TreesLineItemArray=lineitemarray("TΩ",";")

/*
The following tests every line item for each branch to find the most recent "year" that the customer has bought something under this account
*/
//find first non-zero in the seeds lineitemarray and return that element 
SeedsIncrement=1
loop
SeedsNonBlankElement=arraysearch(SeedsLineItemArray,"*.*",SeedsIncrement,";")
SeedsIncrement=val(SeedsNonBlankElement)+1
repeatloopif val(array(SeedsLineItemArray,SeedsNonBlankElement,";"))<0.01


//find first non-zero in the bulbs lineitemarray and return that element 
BulbsIncrement=1
loop
BulbsNonBlankElement=arraysearch(BulbsLineItemArray,"*.*",BulbsIncrement,";")
BulbsIncrement=val(BulbsNonBlankElement)+1
repeatloopif val(array(BulbsLineItemArray,BulbsNonBlankElement,";"))<0.01

//find first non-zero in the trees lineitemarray and return that element 
TreesIncrement=1
loop
TreesNonBlankElement=arraysearch(TreesLineItemArray,"*.*",TreesIncrement,";")
TreesIncrement=val(TreesNonBlankElement)+1
repeatloopif val(array(TreesLineItemArray,TreesNonBlankElement,";"))<0.01

//find first non-zero in the OGS lineitemarray and return that element 
OGSIncrement=1
loop
OGSNonBlankElement=arraysearch(OGSLineItemArray,"*.*",OGSIncrement,";")
OGSIncrement=val(OGSNonBlankElement)+1
repeatloopif val(array(OGSLineItemArray,OGSNonBlankElement,";"))<0.01

//find first non-zero in the Moose lineitemarray and return that element 
MooseIncrement=1
loop
MooseNonBlankElement=arraysearch(MooseLineItemArray,"*.*",MooseIncrement,";")
MooseIncrement=val(MooseNonBlankElement)+1
repeatloopif val(array(MooseLineItemArray,MooseNonBlankElement,";"))<0.01

/*
Fill Account 1
*/

if val(CustNum1)>0
CustNum1Array=CustNum1+¬+SeedsNonBlankElement+¬+BulbsNonBlankElement+¬+TreesNonBlankElement+¬+OGSNonBlankElement+¬+MooseNonBlankElement
endif

//Repeats for account 2*******************************

if val(CustNum2)>0
select «C#»=val(CustNum2)
SeedsLineItemArray=lineitemarray("SΩ",";")
BulbsLineItemArray=lineitemarray("BFΩ",";")
OGSLineItemArray=lineitemarray("OGSΩ",";")
TreesLineItemArray=lineitemarray("TΩ",";")


/*
The following tests every line item for each branch to find the most recent "year" that the customer has bought something under this account
*/
//find first non-zero in the seeds lineitemarray and return that element 
SeedsIncrement=1
loop
SeedsNonBlankElement=arraysearch(SeedsLineItemArray,"*.*",SeedsIncrement,";")
SeedsIncrement=val(SeedsNonBlankElement)+1
repeatloopif val(array(SeedsLineItemArray,SeedsNonBlankElement,";"))<0.01


//find first non-zero in the bulbs lineitemarray and return that element 
BulbsIncrement=1
loop
BulbsNonBlankElement=arraysearch(BulbsLineItemArray,"*.*",BulbsIncrement,";")
BulbsIncrement=val(BulbsNonBlankElement)+1
repeatloopif val(array(BulbsLineItemArray,BulbsNonBlankElement,";"))<0.01

//find first non-zero in the trees lineitemarray and return that element 
TreesIncrement=1
loop
TreesNonBlankElement=arraysearch(TreesLineItemArray,"*.*",TreesIncrement,";")
TreesIncrement=val(TreesNonBlankElement)+1
repeatloopif val(array(TreesLineItemArray,TreesNonBlankElement,";"))<0.01

//find first non-zero in the OGS lineitemarray and return that element 
OGSIncrement=1
loop
OGSNonBlankElement=arraysearch(OGSLineItemArray,"*.*",OGSIncrement,";")
OGSIncrement=val(OGSNonBlankElement)+1
repeatloopif val(array(OGSLineItemArray,OGSNonBlankElement,";"))<0.01

//find first non-zero in the Moose lineitemarray and return that element 
MooseIncrement=1
loop
MooseNonBlankElement=arraysearch(MooseLineItemArray,"*.*",MooseIncrement,";")
MooseIncrement=val(MooseNonBlankElement)+1
repeatloopif val(array(MooseLineItemArray,MooseNonBlankElement,";"))<0.01
endif
/*
Fill Account 2
*/

if val(CustNum2)>0
CustNum2Array=CustNum2+¬+SeedsNonBlankElement+¬+BulbsNonBlankElement+¬+TreesNonBlankElement+¬+OGSNonBlankElement+¬+MooseNonBlankElement
endif


//Repeats for account 3*******************************

if val(CustNum3)>0
select «C#»=val(CustNum3)
SeedsLineItemArray=lineitemarray("SΩ",";")
BulbsLineItemArray=lineitemarray("BFΩ",";")
OGSLineItemArray=lineitemarray("OGSΩ",";")
TreesLineItemArray=lineitemarray("TΩ",";")


/*
The following tests every line item for each branch to find the most recent "year" that the customer has bought something under this account
*/
//find first non-zero in the seeds lineitemarray and return that element 
SeedsIncrement=1
loop
SeedsNonBlankElement=arraysearch(SeedsLineItemArray,"*.*",SeedsIncrement,";")
SeedsIncrement=val(SeedsNonBlankElement)+1
repeatloopif val(array(SeedsLineItemArray,SeedsNonBlankElement,";"))<0.01


//find first non-zero in the bulbs lineitemarray and return that element 
BulbsIncrement=1
loop
BulbsNonBlankElement=arraysearch(BulbsLineItemArray,"*.*",BulbsIncrement,";")
BulbsIncrement=val(BulbsNonBlankElement)+1
repeatloopif val(array(BulbsLineItemArray,BulbsNonBlankElement,";"))<0.01

//find first non-zero in the trees lineitemarray and return that element 
TreesIncrement=1
loop
TreesNonBlankElement=arraysearch(TreesLineItemArray,"*.*",TreesIncrement,";")
TreesIncrement=val(TreesNonBlankElement)+1
repeatloopif val(array(TreesLineItemArray,TreesNonBlankElement,";"))<0.01

//find first non-zero in the OGS lineitemarray and return that element 
OGSIncrement=1
loop
OGSNonBlankElement=arraysearch(OGSLineItemArray,"*.*",OGSIncrement,";")
OGSIncrement=val(OGSNonBlankElement)+1
repeatloopif val(array(OGSLineItemArray,OGSNonBlankElement,";"))<0.01

//find first non-zero in the Moose lineitemarray and return that element 
MooseIncrement=1
loop
MooseNonBlankElement=arraysearch(MooseLineItemArray,"*.*",MooseIncrement,";")
MooseIncrement=val(MooseNonBlankElement)+1
repeatloopif val(array(MooseLineItemArray,MooseNonBlankElement,";"))<0.01

/*
Fill Account 2
*/

if val(CustNum3)>0
CustNum3Array=CustNum3+¬+SeedsNonBlankElement+¬+BulbsNonBlankElement+¬+TreesNonBlankElement+¬+OGSNonBlankElement+¬+MooseNonBlankElement
endif


//Repeats for account 4*******************************

if val(CustNum4)>0
select «C#»=val(CustNum4)
SeedsLineItemArray=lineitemarray("SΩ",";")
BulbsLineItemArray=lineitemarray("BFΩ",";")
OGSLineItemArray=lineitemarray("OGSΩ",";")
TreesLineItemArray=lineitemarray("TΩ",";")
else
stop

/*
The following tests every line item for each branch to find the most recent "year" that the customer has bought something under this account
*/
//find first non-zero in the seeds lineitemarray and return that element 
SeedsIncrement=1
loop
SeedsNonBlankElement=arraysearch(SeedsLineItemArray,"*.*",SeedsIncrement,";")
SeedsIncrement=val(SeedsNonBlankElement)+1
repeatloopif val(array(SeedsLineItemArray,SeedsNonBlankElement,";"))<0.01


//find first non-zero in the bulbs lineitemarray and return that element 
BulbsIncrement=1
loop
BulbsNonBlankElement=arraysearch(BulbsLineItemArray,"*.*",BulbsIncrement,";")
BulbsIncrement=val(BulbsNonBlankElement)+1
repeatloopif val(array(BulbsLineItemArray,BulbsNonBlankElement,";"))<0.01

//find first non-zero in the trees lineitemarray and return that element 
TreesIncrement=1
loop
TreesNonBlankElement=arraysearch(TreesLineItemArray,"*.*",TreesIncrement,";")
TreesIncrement=val(TreesNonBlankElement)+1
repeatloopif val(array(TreesLineItemArray,TreesNonBlankElement,";"))<0.01

//find first non-zero in the OGS lineitemarray and return that element 
OGSIncrement=1
loop
OGSNonBlankElement=arraysearch(OGSLineItemArray,"*.*",OGSIncrement,";")
OGSIncrement=val(OGSNonBlankElement)+1
repeatloopif val(array(OGSLineItemArray,OGSNonBlankElement,";"))<0.01

//find first non-zero in the Moose lineitemarray and return that element 
MooseIncrement=1
loop
MooseNonBlankElement=arraysearch(MooseLineItemArray,"*.*",MooseIncrement,";")
MooseIncrement=val(MooseNonBlankElement)+1
repeatloopif val(array(MooseLineItemArray,MooseNonBlankElement,";"))<0.01
endif
/*
Fill Account 4
*/

if val(CustNum4)>0
CustNum4Array=CustNum4+¬+SeedsNonBlankElement+¬+BulbsNonBlankElement+¬+TreesNonBlankElement+¬+OGSNonBlankElement+¬+MooseNonBlankElement
endif



//the following is an example of using a dictionary and the various outputs for panorama 6

global CustNumDict,AddressDict


//C# = 250783 and SpareText2 = 375260
////using str(C#) because I am using this to loop through a DB

CustNumDict="" 
//you have to initialize a variable for the dict or use "initializeddictionary" (pg 605 form/prog)
setdictionaryvalue CustNumDict,str(«C#»),SpareText2 
//Dict,Key,Value

//result CustNumDict = ˛250783ˇ375260˛/250783ˇ
//syntax_of_Dict = ˛start_dictˇvalues˛/end_dictˇ
//to change the value, you can use setdictvalue again with the correspoinding Key
////ex: setdictionaryvalue CustNumDict,str(«C#»),SpareText1

//to delete a key/value pair use deldict
////deletedictionaryvalue CustNumDict,str(«C#»),SpareText2

//To get values:
message getdictionaryvalue(CustNumDict,str(«C#»))
//////this would give you "375260"
/////you can also put a variable in front to hold it instead of message
///Dict = ˛250783ˇ375260˛/250783ˇ
Message listdictionarynames(CustNumDict) 
/////this will get you 250783 and any other Keys in the dictionary
////dict = ˛250783ˇ375260˛/250783ˇ

appenddictionaryvalue CustNumDict,str(«C#»),";",Con
message getdictionaryvalue(CustNumDict,str(«C#»)) 
// this gets you "375260;Liora Alschuler"
////Dict = ˛250783ˇ375260;Liora Alschuler˛/250783ˇ

changedictionaryname CustNumDict,str(«C#»),"123456"
message listdictionarynames(CustNumDict) 
//this gets you 123456
//dict = ˛123456ˇ375260;Liora Alschuler˛/123456ˇ

///using dictionary lookups for if statments
if dictionaryvalueexsts(CustNumDict,"250783")
//checks if 250783 has a value
///it doesn't, cause it's now it's now 123456
message getdictionaryvalue(CustNumDict,"250783")
//puts the value wherever you want it if it exists
else 
if dictionaryvalueexsts(CustNumDict,"123456")
message getdictionaryvalue(CustNumDict,"123456")
endif

The dumpdictionary statement outputs a carriage return delimited array that contains both the keys and
the values, separated by an equals sign.
local CustNumDict,DictDump
dumpdictionary CustNumDict,DictDump
message DictDump

clipboard()=dumpdictionary(CustNumDict)
;output  123456=375260;Liora Alschuler

/*/if you need quotes
The dumpdictionaryquoted statement is similar, but each key is surrounded by chevrons and each value
is surrounded by quotes.*/
local CustNumDict,DictDump
dumpdictionaryquoted CustNumDict,DictDump
message DictDump

;output  «123456»="375260;Liora Alschuler"

extra bits

;If you have fields or variables with the same names as the keys in your database, you can use this output with
;the execute statement to initialize all of the fields or variables at once.

local ColorPalette,PaletteDump
dumpdictionaryquoted ColorPalette,PaletteDump
execute PaletteDump


;Another Technique For Initializing a Dictionary
;Earlier we showed you a method for setting up and initializing a dictionary.

local ColorPalette
ColorPalette=""
setdictionaryvalue ColorPalette,"TextColor","red"
setdictionaryvalue ColorPalette,"ButtonColor","blue"
setdictionaryvalue ColorPalette,"Background","white"

;Panorama also includes a special statement for this task, initializedictionary. Here is the same task
;performed with this statement.

local ColorPalette
initializedictionary ColorPalette,
"TextColor","red",
"ButtonColor","blue",
"Background","white"

;You can include as many key/value pairs as you need. Using this statement instead of separate setdictionaryvalue
;statements has two advantages — it takes less typing, and it runs faster. Of course you can always
;modify individual key/value pairs later with the setdictionaryvalue statement.

Looking Up a Dictionary Key Given Its Value
/*
In some cases it may be possible to look up a key if all you know is the value. This is the reverse of the normal
operation, which is to look up the value given the key. The getdictionarykey statement has three parameters:
*/
getdictionarykey dictionary,value,key
/*
The dictionary parameter is of course the name of the field or variable that contains the dictionary. The value
parameter is the value you are looking for. If this value is not unique (if more than one key/value pair have
the same value) then it is unpredictable what key will be returned, so you should only use this statement if
you know that the value is unique. The key parameter is the name of a field or variable that will be filled with
the key name (if any matching value is found, otherwise it will be filled with "").


The example below will find out what key has been set to the value white. If this dictionary is set up as it was
in the previous examples, the item variable will be filled with the value Background. (This isn’t really a great
example, since more than one item could be assigned the color white. If you use this statement, be very careful
that you know that there are no duplicate values in the dictionary.)
*/
local item
getdictionararykey ColorPalette,"white",item

;One other point to keep in mind about this statement — it’s a bit on the slow side. It is much slower than the
;getdictionaryvalue( function.
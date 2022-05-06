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




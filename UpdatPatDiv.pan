
selectall
select TIN≠""
selectwithin TIN contains lookupselected("PatDivTINs","TIN",«TIN»[-4,-1],"TIN","",0)
selectreverse
selectwithin TIN≠""

yesno "Add These Records?"
if clipboard()="Yes"
window "PatDivTINs"
addrecord
window "customer_history"
loop
copyrecord
window "PatDivTINs"
pasterecord
window "customer_history"
downrecord
endif
until info("stopped")
lastrecord
deleterecord




/*

global vPatDivFolder, vPatDivFileName,type
select TIN≠""

openfiledialog vPatDivFolder, vPatDivFileName,type,""
openfile folderpath(vPatDivFolder)+vPatDivFileName
*/

;select lookupselected("PatDivTINs",«TIN»,«TIN»,"TIN","",0)

/*
none of these seem to work over the server

;select lookupselected(PatDivTins,TIN,«TIN»[-4,-1]
select lookupselected("PatDivTINs","TIN[-4,-1]","TIN[-4,-1]","TIN","",0)
;lookupselected("PatDivTINs","TIN",«TIN»,"TIN","",0)
;lookupselected("PatDivTINs","2ndAdd",«C#»,"TIN","",0)
*/ 




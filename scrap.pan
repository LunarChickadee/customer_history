global vPatDivFolder, vPatDivFileName,type,vSelect1,vSelect2


/*#Selects the appropriate info and keeps a record of how many records are selected
 #to make sure that you don't overwrite the whole Patronage file*/
selectall
select TIN=""
vSelect1=info("selected")
selectall

/*#In the selection of customer_history with TINs, find all the records that have
the same customer number in the PatronageDividend file*/ 
select TIN≠""
selectwithin str(«C#») contains str(lookupselected("customer_history","C#",«C#»,"C#",0,0))

/*#find the ones that don't match*/
selectreverse
selectwithin TIN≠""
vSelect2=info("selected")

/*#this is the safety check for overwriting*/
if vSelect1=vSelect2
message "Nothing New to select! Macro will stop now."
stop
endif

/*#this appends the proper records and clears the extra blank record that gets created*/
yesno "Add These Records?"
if clipboard()="Yes"
    window "customer_history"
    addrecord
    window "PatDivTINs"
    loop
        copyrecord
        window "customer_history"
        pasterecord
        window "PatDivTINs"
        downrecord
        until info("stopped")
else
    stop
endif
        
lastrecord
window "customer_history"
lastrecord
deleterecord
nop






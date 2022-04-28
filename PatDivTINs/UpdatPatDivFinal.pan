global vPatDivFolder, vPatDivFileName,type,vSelect1,vSelect2

openfile "customer_history"

/**************Saves a copy with the date in the file 
and cleans up after there are more than 4*/
message "Please wait, saving a backup of both files"

call BackupFiles //this might not be the right name

/*#Selects the appropriate info and keeps a record of how many records are selected
 #to make sure that you don't overwrite the whole Patronage file*/
selectall
select TIN=""
vSelect1=info("selected")
selectall

/*#In the selection of PatDivTINs file, find all the records that have
the same customer number in the customer_history file*/ 
bigmessage "This next step may take a few minutes to search the Customer History File. Please do not click anything else until it finishes"
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
    Message "if there's an issue, please contact tech support"
    stop
endif
        
lastrecord
window "customer_history"
lastrecord
deleterecord
nop


////******Note, this is set the the Unlinked file currently
Message "All SSN's in customer_history will be shortened to the last 4 numbers, now." 
window "customer_historyUL"
field «TIN»
select TIN≠""
selectwithin length(«TIN»)>4
formulafill «TIN»[-4,-1]

Message "Finished!"




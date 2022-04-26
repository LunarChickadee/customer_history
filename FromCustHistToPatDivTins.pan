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
selectwithin str(«C#») contains str(lookupselected("PatDivTINs","C#",«C#»,"C#",0,0))

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
    window "PatDivTINs"
    addrecord
    window "customer_history"
    loop
        copyrecord
        window "PatDivTINs"
        pasterecord
        window "customer_history"
        downrecord
        until info("stopped")
else
    stop
endif
        
lastrecord
window "PatDivTINs"
lastrecord
deleterecord
nop

/******************Alternate Method, this was replaced by using an alias of the file on the local computer running this macro
This allows you to save over the network because Panorama is not designed to do 
it without enerprise, the CMD-S and File->Save will throw up an error, but it does work after 
you've run it.

Message "Please select the Correct File on the PatronageDividend computer to Save."
openfiledialog vPatDivFolder, vPatDivFileName,type,""
saveas folderpath(vPatDivFolder)+vPatDivFileName
message "File Saved!"

*/


patronageadmin:Desktop:PatDivUpdate:Backups:PD Backup0422




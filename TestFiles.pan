global vPatDivFolder, vPatDivFileName,type

/*#This allows you to save over the network because Panorama is not designed to do
#it without enerprise, the CMD-S and File->Save will throw up an error, but it does work after
#you've run it.*/

 
Message "Please select the Correct File on the PatronageDividend computer to Save."
openfiledialog vPatDivFolder, vPatDivFileName,type,""
saveacopyas folderpath(vPatDivFolder)+vPatDivFileName

clipboard()=folderpath(vPatDivFolder)+vPatDivFileName
message "File Saved!"

//patronageadmin:Desktop:PatDivUpdate:Backups:PD Backup0422

/*

/**************Saves a copy with the date in the file 
and cleans up after there are more than 4*/

window "customer_history"
saveacopyas "PatronageAdmin:Desktop:PatDiv Update:Backups"+"CH Backup"+datepattern(today(),"MMYY")
window "PatDivTINs"
saveacopyas "PD Backup"+datepattern(today(),"MMYY")

*/


/**************Saves a copy with the date in the file 
and cleans up after there are more than 4*/

window "customer_history"
saveacopyas "patronageadmin:Desktop:PatDivUpdate:Backups:"+"CH Backup"+datepattern(today(),"MMYY")
window "PatDivTINs"
saveacopyas "patronageadmin:Desktop:PatDivUpdate:Backups:"+"PD Backup"+datepattern(today(),"MMYY")
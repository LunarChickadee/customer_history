/**************Saves a copy with the date in the file 
and cleans up after there are more than 4*/

window "customer_history"
saveacopyas "CH Backup"+datepattern(today(),"MMYY")
window "PatDivTins"
saveacopyas "PD Backup"+datepattern(today(),"MMYY")



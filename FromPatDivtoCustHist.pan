global vPatDivCount,vSelectionCount
selectall
vPatDivCount=info("records")
select TIN≠""
selectwithin str(«C#») contains str(lookupselected("customer_history","C#",«C#»,"C#",0,0))
selectreverse
vSelectionCount=info("selected")

if vPatDivCount=vSelectionCount
message "No New TINs to Add" 
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




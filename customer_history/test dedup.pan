local vArray1,vTINcount,vNewTINs,vDupCount
vSelect1=""
vTINcount=0
vNewTINs=""
vDupCount=0

Message "This next part will help you merge any duplicates."
field «TIN»

select TIN≠""
vTINcount=info("selected")


selectwithin length(«TIN»)>4
if info("selected")=vTINcount
    vNewTINs="N"
endif

if vNewTINs="N"
yesno "No recently added TINs found. Would you like to check for other duplicates?"
if clipboard() contains "No"
    message "Stopping Procedure"
    stop
else
    field «C#»
    selectduplicates ""
    vDupCount=info("selected")
    selectwithin TIN≠""
    if vDupCount=info("selected")
        message "no Duplicates with TINs found"
    else
       message "please copy/paste the TIN to the record with the most info. If you're unsure, ask the Office Manager for help with deduplication"
    endif
endif
endif


if vNewTINs≠"N"
    field «C#»
    arrayselectedbuild vArray1,¶,"",«C#»
    select str(«C#») contains vArray1
    message "Please confirm manually if there are two records for this customer. Please add their TIN to the most complete record."
endif



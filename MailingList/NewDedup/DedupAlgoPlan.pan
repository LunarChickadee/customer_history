global DupCustomer

consider upping scratch memory
-and triple check the variables that they're assigning right (no text instead of num and vice versa) 

goals: 

-choose source records and destination record
-consolidate sales data for all years
-hold onto previous customer numbers, addresses, and any other info (needed) 
    -double check what's needed 
-lock the dedup to only when it's in a "Dedup" folder
    -see "folder lock"



Current Algo:
Starts in window Mailing List 
User selects Duplicate Record, holding onto:
    Cust Number
    Membership
    Tax Exemption
    Resale info(#)

User Selects record to merge duplicate into 
    if mem, taxex, and resale are blank, it adds the duplicate's info (to) the new record. 

goes to Customer History window 
    tries to find the duplicate, and stops if it can't 
    then sets variables

Variables Set: 
    vTaxName =""
    vTIN=""
    vConsent=""
    vNotified=""
    vMem=""
    vEquity=0


    vTaxName=taxname
    vTIN=TIN
    vConsent=Consent
    vNotified=Notified
    vEquity=Equity
        to Add? 
            vPastAddress=str(«C#»)+","+Con+","+" "+MAd+" "+City+" "+St+" "+str(Zip)+";"
    All Branches are initialized and then filled for each year

    Fills the following on the master record
        if CChistory=""
            CChistory=str(vsourcecust)
        else
            CChistory=CChistory+", "+str(vsourcecust)
        endif

        if vTaxName≠""
            if taxname=""
                taxname=vTaxName
            else 
                taxname=vTaxName+", "+taxname
            endif
        endif

        if vTIN≠""
            if TIN=""
               TIN=vTIN
            else 
                TIN=vTIN+", "+TIN
            endif
        endif

        if vConsent≠""
            if Consent=""
                Consent=vConsent
            else 
                Consent=vConsent+", "+Consent
            endif
        endif

        if vNotified≠""
            if Notified=""
                Notified=vNotified
            else 
                Notified=vNotified+", "+Notified
            endif
        endif

        *************This one seems like it might not be preserving data?
        if vEquity≠0
            if Equity=0
                Equity=vEquity
            endif
        endif

    Does the math for all the Branches Totals Ex:
        «44Total»=S44+Bf44+M44+T44
        «43Total»=S43+Bf43+M43+T43
        «42Total»=S42+Bf42+M42+T42
        «41Total»=S41+Bf41+M41+T41
        «40Total»=S40+Bf40+M40+OGS40+T40
        «39Total»=S39+Bf39+M39+OGS39+T39   
        
    Goes to the window mailing list
        finds the duplicate customer 
            asks if you'd like to delete
                deletes them with .History Delete
                    window "customer_history:customeractivity"
                    find «C#»=vsourcecust

                    YesNo "delete this record in customer history?" +" "+ str(«C#») + " "+ Con
                    if clipboard()="Yes"
                    deleterecord
                    endif
                    window "44 mailing list"



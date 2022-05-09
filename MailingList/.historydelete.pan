window "customer_history:customeractivity"
find «C#»=vsourcecust

YesNo "delete this record in customer history?" +" "+ str(«C#») + " "+ Con
if clipboard()="Yes"
deleterecord
endif
window "44 mailing list"

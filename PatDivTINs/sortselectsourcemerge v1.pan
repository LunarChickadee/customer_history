local vGetText1
gettext "Password?",vGetText1
if vGetText1≠"123"
stop
endif

//[[[[[[[]]]]]]]*****Checked to here

if vSerialNum notcontains info("serialnumber") 
message "Sorry, you can not use Coman+d without approval from Ken or Rachel"
stop
endif

global vsourcecust, vMem,  vTaxEx, vResale
vsourcecust=«C#»
vMem=«Mem?»
 vTaxEx=TaxEx
 vResale=resale
message "Customer "+str(«C#»)+ " selected!"

if vSerialNum notcontains info("serialnumber") 
message "Sorry, you can not use Coman+0 without approval."
stop
endif


global vtargetcust
global vS45, vS44, vS43, vS42, vS41, vS40, vS39, vS38, vS37, vS36, vS35, vS34, vS33, vS32, vS31, vS30, vS29, 
vS28, vS27, vS26, vS25, vS24, vS23, vS22, vS21, vS20, vS19, 
vBf45, vBf44, vBf43, vBf42, vBf41, vBf40, vBf39, vBf38, vBf37, vBf36, vBf35, vBf34, vBf33, vBf32, vBf31, vBf30, vBf29, vBf28, vBf27, vBf26, vBf25, 
vBf24, vBf23, vBf22, vBf21, vBf20, vBf19, 
vM45, vM44, vM43, vM42, vM41, vM40, vM39, vM38, vM37, vM36, vM35, vM34, vM33, vM32, vM31, vM30, 
vM29, vM28, vM27, vM26, vM25, vM24, vM23, vM22, vM21, vM20, vM19,
vOGS45, vOGS44, vOGS43, vOGS42, vOGS41, vOGS40, vOGS39, vOGS38, vOGS37, vOGS36, vOGS35, vOGS34, vOGS33, 
vOGS32, vOGS31, vOGS30, vOGS29, vOGS28, vOGS27, vOGS26, vOGS25, vOGS24, vOGS23, 
vOGS22, vOGS21, vOGS20, 
vT42, vT43, vT44, vT45, vT41, vT40, vT39, vT38, vT37, vT36, vT35, vT34, vT33, vT32, vT31, vT30, 
vT29, vT28, vT27, vT26, vT25, vT24, vT23, vT22, vT21, vT20, vT19,
vTaxName, vTIN, vConsent, vNotified, vEquity

///**********select source

vtargetcust=«C#»

if «Mem?»=""
    «Mem?»=vMem
    ;stop
endif

if «TaxEx»=""
    «TaxEx»=vTaxEx
    ;stop
endif

if «resale»=""
    «resale»=vResale
    ;stop
endif



window "customer_history:customeractivity"
if «C#»≠vsourcecust
    find «C#»=vsourcecust
        if info("found")=0
            window "44 mailing list"
            
             "Nothing found!"
            Stop
        ;else
            ;Message "found source record"
        endif
endif

farcall "44 mailing list", .SetVariables
//**** This if clause may be an unnecessary diplication of the step above
if «C#»≠vtargetcust
    find «C#»=vtargetcust
        if info("found")=0
            message "target not found! Process stopped, nothing merged."
            Stop
        else
            ;Message "found target record" 
        endif
endif
//**************************
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

if vEquity≠0
   if Equity=0
    Equity=vEquity
    endif
endif

farcall "44 mailing list", .FillTargetFields

«44Total»=S44+Bf44+M44+T44
«43Total»=S43+Bf43+M43+T43
«42Total»=S42+Bf42+M42+T42
«41Total»=S41+Bf41+M41+T41
«40Total»=S40+Bf40+M40+OGS40+T40
«39Total»=S39+Bf39+M39+OGS39+T39
«38Total»=S38+Bf38+M38+OGS38+T38
«37Total»=S37+Bf37+M37+OGS37+T37
«36Total»=S36+Bf36+M36+OGS36+T36
«35Total»=S35+Bf35+M35+OGS35+T35
«34Total»=S34+Bf34+M34+OGS34+T34
«33Total»=S33+Bf33+M33+OGS33+T33
«32Total»=S32+Bf32+M32+OGS32+T32
«31Total»=S31+Bf31+M31+OGS31+T31
«30Total»=S30+Bf30+M30+OGS30+T30
«29Total»=S29+Bf29+M29+OGS29+T29
«28Total»=S28+Bf28+M28+OGS28+T28
«27Total»=S27+Bf27+M27+OGS27+T27
«26Total»=S26+Bf26+M26+OGS26+T26
«25Total»=S25+Bf25+M25+OGS25+T25
«24Total»=S24+Bf24+M24+OGS24+T24
«23Total»=S23+Bf23+M23+OGS23+T23
«22Total»=S22+Bf22+M22+OGS22+T22
«21Total»=S21+Bf21+M21+OGS21+T21
«20Total»=S20+Bf20+M20+OGS20+T20
«19Total»=S19+Bf19+M19+T19
;Message "Totals run"
window "44 mailing list"

find «C#» = vsourcecust
field «C#»
    copycell
YESNO "do you want to delete the customer number " + str(vsourcecust)+" "+Con+" from the mailinglist?"
    if clipboard()="Yes"
    field «C#»
    copycell
        deleterecord
        call .HistoryDelete
    endif
;vsourcecust

///***********SetVariables

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

vS44=0
vS43=0
vS42=0
vS41=0
vS40=0
vS39=0
vS38=0
vS37=0
vS36=0
vS35=0
vS34=0
vS33=0
vS32=0
vS31=0
vS30=0
vS29=0
vS28=0
vS27=0
vS26=0
vS25=0
vS24=0
vS23=0
vS22=0
vS21=0
vS20=0
vS19=0

vBf44=0
vBf43=0
vBf42=0
vBf41=0
vBf40=0
vBf39=0
vBf38=0
vBf37=0
vBf36=0
vBf35=0
vBf34=0
vBf33=0
vBf32=0
vBf31=0
vBf30=0
vBf29=0
vBf28=0
vBf27=0
vBf26=0
vBf25=0
vBf24=0
vBf23=0
vBf22=0
vBf21=0
vBf20=0
vBf19=0

vM44=0
vM43=0
vM42=0
vM41=0
vM40=0
vM39=0
vM38=0
vM37=0
vM36=0
vM35=0
vM34=0
vM33=0
vM32=0
vM31=0
vM30=0
vM29=0
vM28=0
vM27=0
vM26=0
vM25=0
vM24=0
vM23=0
vM22=0
vM21=0
vM20=0
vM19=0

//No longer relevant, do not add new ones
vOGS40=0
vOGS39=0
vOGS38=0
vOGS37=0
vOGS36=0
vOGS35=0
vOGS34=0
vOGS33=0
vOGS32=0
vOGS31=0
vOGS30=0
vOGS29=0
vOGS28=0
vOGS27=0
vOGS26=0
vOGS25=0
vOGS24=0
vOGS23=0
vOGS22=0
vOGS21=0
vOGS20=0

vT44=0
vT43=0
vT42=0
vT41=0
vT40=0
vT39=0
vT38=0
vT37=0
vT36=0
vT35=0
vT34=0
vT33=0
vT32=0
vT31=0
vT30=0
vT29=0
vT28=0
vT27=0
vT26=0
vT25=0
vT24=0
vT23=0
vT22=0
vT21=0
vT20=0
vT19=0

vS44=S44
vS43=S43
vS42=S42
vS41=S41
vS40=S40
vS39=S39
vS38=S38
vS37=S37
vS36=S36
vS35=S35
vS34=S34
vS33=S33
vS32=S32
vS31=S31
vS30=S30
vS29=S29
vS28=S28
vS27=S27
vS26=S26
vS25=S25
vS24=S24
vS23=S23
vS22=S22
vS21=S21
vS20=S20
vS19=S19

//No longer Needing to be added to each year. In 43, bulbs became part of OGS
vBf44=Bf44
vBf43=Bf43
vBf42=Bf42
vBf41=Bf41
vBf40=Bf40
vBf39=Bf39
vBf38=Bf38
vBf37=Bf37
vBf36=Bf36
vBf35=Bf35
vBf34=Bf34
vBf33=Bf33
vBf32=Bf32
vBf31=Bf31
vBf30=Bf30
vBf29=Bf29
vBf28=Bf28
vBf27=Bf27
vBf26=Bf26
vBf25=Bf25
vBf24=Bf24
vBf23=Bf23
vBf22=Bf22
vBf21=Bf21
vBf20=Bf20
vBf19=Bf19

vOGS40=OGS40
vOGS39=OGS39
vOGS38=OGS38
vOGS37=OGS37
vOGS36=OGS36
vOGS35=OGS35
vOGS34=OGS34
vOGS33=OGS33
vOGS32=OGS32
vOGS31=OGS31
vOGS30=OGS30
vOGS29=OGS29
vOGS28=OGS28
vOGS27=OGS27
vOGS26=OGS26
vOGS25=OGS25
vOGS24=OGS24
vOGS23=OGS23
vOGS22=OGS22
vOGS21=OGS21
vOGS20=OGS20 

vM44=M44
vM43=M43
vM42=M42
vM41=M41
vM40=M40
vM39=M39
vM38=M38
vM37=M37
vM36=M36
vM35=M35
vM34=M34
vM33=M33
vM32=M32
vM31=M31
vM30=M30
vM29=M29
vM28=M28
vM27=M27
vM26=M26
vM25=M25
vM24=M24
vM23=M23
vM22=M22
vM21=M21
vM20=M20
vM19=M19

vT44=T44
vT43=T43
vT42=T42
vT41=T41
vT40=T40
vT39=T39
vT38=T38
vT37=T37
vT36=T36
vT35=T35
vT34=T34
vT33=T33
vT32=T32
vT31=T31
vT30=T30
vT29=T29
vT28=T28
vT27=T27
vT26=T26
vT25=T25
vT24=T24
vT23=T23
vT22=T22
vT21=T21
vT20=T20
vT19=T19

;Message "variables set" +" - " +str(vS44)



///**********Filll target Fields


if vS44>0
S44=vS44+S44
endif
if vS43>0
S43=vS43+S43
endif
if vS42>0
S42=vS42+S42
endif
if vS41>0
S41=vS41+S41
endif
if vS40>0
S40=vS40+S40
endif
if vS39>0
S39=vS39+S39
endif
if vS38>0
S38=vS38+S38
endif
if vS37>0
S37=vS37+S37
endif
if vS36>0
S36=vS36+S36
endif
if vS35>0
S35=vS35+S35
endif
if vS34>0
S34=vS34+S34
endif
if vS33>0
S33=vS33+S33
endif
if vS32>0
S32=vS32+S32
endif
if vS31>0
S31=vS31+S31
endif
if vS30>0
S30=vS30+S30
endif
if vS29>0
S29=vS29+S29
endif
if vS28>0
S28=vS28+S28
endif
if vS27>0
S27=vS27+S27
endif
if vS26>0
S26=vS26+S26
endif
if vS25>0
S25=vS25+S25
endif
if vS24>0
S24=vS24+S24
endif
if vS23>0
S23=vS23+S23
endif
if vS22>0
S22=vS22+S22
endif
if vS21>0
S21=vS21+S21
endif
if vS20>0
S20=vS20+S20
endif
if vS19>0
S19=vS19+S19
endif

if vBf44>0
Bf44=vBf44+Bf44
endif
if vBf43>0
Bf43=vBf43+Bf43
endif
if vBf42>0
Bf42=vBf42+Bf42
endif
if vBf41>0
Bf41=vBf41+Bf41
endif
if vBf40>0
Bf40=vBf40+Bf40
endif
if vBf39>0
Bf39=vBf39+Bf39
endif
if vBf38>0
Bf38=vBf38+Bf38
endif
if vBf37>0
Bf37=vBf37+Bf37
endif
if vBf36>0
Bf36=vBf36+Bf36
endif
if vBf35>0
Bf35=vBf35+Bf35
endif
if vBf34>0
Bf34=vBf34+Bf34
endif
if vBf33>0
Bf33=vBf33+Bf33
endif
if vBf32>0
Bf32=vBf32+Bf32
endif
if vBf31>0
Bf31=vBf31+Bf31
endif
if vBf30>0
Bf30=vBf30+Bf30
endif
if vBf29>0
Bf29=vBf29+Bf29
endif
if vBf28>0
Bf28=vBf28+Bf28
endif
if vBf27>0
Bf27=vBf27+Bf27
endif
if vBf26>0
Bf26=vBf26+Bf26
endif
if vBf25>0
Bf25=vBf25+Bf25
endif
if vBf24>0
Bf24=vBf24+Bf24
endif
if vBf23>0
Bf23=vBf23+Bf23
endif
if vBf22>0
Bf22=vBf22+Bf22
endif
if vBf21>0
Bf21=vBf21+Bf21
endif
if vBf20>0
Bf20=vBf20+Bf20
endif
if vBf19>0
Bf19=vBf19+Bf19
endif


if vOGS40>0
OGS40=vOGS40+OGS40
endif
if vOGS39>0
OGS39=vOGS39+OGS39
endif
if vOGS38>0
OGS38=vOGS38+OGS38
endif
if vOGS37>0
OGS37=vOGS37+OGS37
endif
if vOGS36>0
OGS36=vOGS36+OGS36
endif
if vOGS35>0
OGS35=vOGS35+OGS35
endif
if vOGS34>0
OGS34=vOGS34+OGS34
endif
if vOGS33>0
OGS33=vOGS33+OGS33
endif
if vOGS32>0
OGS32=vOGS32+OGS32
endif
if vOGS31>0
OGS31=vOGS31+OGS31
endif
if vOGS30>0
OGS30=vOGS30+OGS30
endif
if vOGS29>0
OGS29=vOGS29+OGS29
endif
if vOGS28>0
OGS28=vOGS28+OGS28
endif
if vOGS27>0
OGS27=vOGS27+OGS27
endif
if vOGS26>0
OGS26=vOGS26+OGS26
endif
if vOGS25>0
OGS25=vOGS25+OGS25
endif
if vOGS24>0
OGS24=vOGS24+OGS24
endif
if vOGS23>0
OGS23=vOGS23+OGS23
endif
if vOGS22>0
OGS22=vOGS22+OGS22
endif
if vOGS21>0
OGS21=vOGS21+OGS21
endif
if vOGS20>0
OGS20=vOGS20+OGS20
endif

if vM44>0
M44=vM44+M44
endif
if vM43>0
M43=vM43+M43
endif
if vM42>0
M42=vM42+M42
endif
if vM41>0
M41=vM41+M41
endif
if vM40>0
M40=vM40+M40
endif
if vM39>0
M39=vM39+M39
endif
if vM38>0
M38=vM38+M38
endif
if vM37>0
M37=vM37+M37
endif
if vM36>0
M36=vM36+M36
endif
if vM35>0
M35=vM35+M35
endif
if vM34>0
M34=vM34+M34
endif
if vM33>0
M33=vM33+M33
endif
if vM32>0
M32=vM32+M32
endif
if vM31>0
M31=vM31+M31
endif
if vM30>0
M30=vM30+M30
endif
if vM29>0
M29=vM29+M29
endif
if vM28>0
M28=vM28+M28
endif
if vM27>0
M27=vM27+M27
endif
if vM26>0
M26=vM26+M26
endif
if vM25>0
M25=vM25+M25
endif
if vM24>0
M24=vM24+M24
endif
if vM23>0
M23=vM23+M23
endif
if vM22>0
M22=vM22+M22
endif
if vM21>0
M21=vM21+M21
endif
if vM20>0
M20=vM20+M20
endif
if vM19>0
M19=vM19+M19
endif

if vT44>0
T44=vT44+T44
endif
if vT43>0
T43=vT43+T43
endif
if vT42>0
T42=vT42+T42
endif
if vT41>0
T41=vT41+T41
endif
if vT40>0
T40=vT40+T40
endif
if vT39>0
T39=vT39+T39
endif
if vT38>0
T38=vT38+T38
endif
if vT37>0
T37=vT37+T37
endif
if vT36>0
T36=vT36+T36
endif
if vT35>0
T35=vT35+T35
endif
if vT34>0
T34=vT34+T34
endif
if vT33>0
T33=vT33+T33
endif
if vT32>0
T32=vT32+T32
endif
if vT31>0
T31=vT31+T31
endif
if vT30>0
T30=vT30+T30
endif
if vT29>0
T29=vT29+T29
endif
if vT28>0
T28=vT28+T28
endif
if vT27>0
T27=vT27+T27
endif
if vT26>0
T26=vT26+T26
endif
if vT25>0
T25=vT25+T25
endif
if vT24>0
T24=vT24+T24
endif
if vT23>0
T23=vT23+T23
endif
if vT22>0
T22=vT22+T22
endif
if vT21>0
T21=vT21+T21
endif
if vT20>0
T20=vT20+T20
endif
if vT19>0
T19=vT19+T19
endif

;Message "targets filled" 


///***History Delete*********


window "customer_history:customeractivity"
find «C#»=vsourcecust

YesNo "delete this record in customer history?" +" "+ str(«C#») + " "+ Con
if clipboard()="Yes"
deleterecord
endif
window "44 mailing list"

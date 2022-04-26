local vSelection


loop
vSelection=«Field Name»
if vSelection contains "TIN"
stop
else
deleterecord
nop
endif
until vSelection contains "TIN"


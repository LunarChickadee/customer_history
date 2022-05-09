//find first non-zero in the lineitemarray and return that element 
MooseIncrement=1
loop
MooseNonBlankElement=arraysearch(MooseLineItemArray,"*.*",MooseIncrement,";")
MooseIncrement=val(MooseNonBlankElement)+1
repeatloopif val(array(MooseLineItemArray,MooseNonBlankElement,";"))<0.01
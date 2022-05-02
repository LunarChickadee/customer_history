Reading and Writing Resource Forks
On the Macintosh each file may consist of two separate partitions called forks, the data fork and the resource
fork. The resource fork is normally accessed only indirectly through special statements (see “Working with
Resources” on page 433) and not through the standard file i/o statements and functions. However, sometimes
it is necessary to read and write the resource fork directly (for example to copy a file you must copy
both forks). To do this you must use the resourefork statement to switch Panorama into resource fork
mode (see “RESOURCEFORK” on page 5668 of the Panorama Reference). In this mode all of Panorama’s normal
file i/o statements and functions access the resource fork instead of the data fork. To go back to normal
data fork mode use the datafork statement (see “DATAFORK” on page 5141 of the Panorama Reference).
Here is a procedure that makes a copy of a file named My File. The copy is called Copy of My File, and
includes both the data and resource forks from the original file.

local theOriginalFile,typecreator,data
theOriginalFile="My File"
typecreator=array(fileinfo("",theOriginalFile,2,¶)
datafork
data=fileload("",theOriginalFile)
filesave "","Copy of "+theOriginalFile,typecreator,data
resourcefork
data=fileload("",theOriginalFile)
filesave "","Copy of "+theOriginalFile,typecreator,data
datafork


On Windows PC systems files do not have resource forks and the resourcefork statement does absolutely
nothing. If you want your program to work on both Mac and PC systems you must check which system you
are using and only copy the resource fork if the database is on a Macintosh. Here is a revised copy of the procedure
which shows one way to perform this check.
local theOriginalFile,typecreator,data,computerType
computerType="Macintosh"
if folderpath(dbinfo("folder","")) match "?:\*"
computerType="Windows"
endif
theOriginalFile="My File"
typecreator=array(fileinfo("",theOriginalFile,2,¶)
datafork
data=fileload("",theOriginalFile)
filesave "","Copy of "+theOriginalFile,typecreator,data
if computerType="Macintosh"
resourcefork
data=fileload("",theOriginalFile)
filesave "","Copy of "+theOriginalFile,typecreator,data
datafork
endif
///THIS MACRO SHOULD ONLY BE RUN ONCE SIZES AND ITEMS ARE FINALIZED AND CATALOG WORK IS DONE. AFTER
///ALL CHANGES WILL NEED TO BE ENTERED MANUALLY

global vOuiImportAll, vOuiImportA, vOuiImportB, vOuiImportC, vOuiImportD, VOuiImportE

Yesno "Are you creating a new file?"
    if clipboard()="N"
        Stop
    endif
    
vOuiImportAll=""

deleteall

///This imports and creates size codes and new records for all size codes from the PriceSheetExport file

arraybuild vOuiImportA,¶,"PriceSheetExport", str(ItemNum)+","+"A"+","+Name+","+str(SizeA)
arraybuild vOuiImportB,¶,"PriceSheetExport", str(ItemNum)+","+"B"+","+Name+","+str(SizeB)
arraybuild vOuiImportC,¶,"PriceSheetExport", str(ItemNum)+","+"C"+","+Name+","+str(SizeC)
arraybuild vOuiImportD,¶,"PriceSheetExport", str(ItemNum)+","+"D"+","+Name+","+str(SizeD)
arraybuild VOuiImportE,¶,"PriceSheetExport", str(ItemNum)+","+"E"+","+Name+","+str(1)

vOuiImportAll=vOuiImportA+¶+vOuiImportB+¶+vOuiImportC+¶+vOuiImportD+¶+VOuiImportE

///Exporting into Ouija for Lora

//export "OuijaExport.csv",vOuiImportAll

openfile "&OuiConvert.csv"

//field ItemNum

//sortup
//select SizeQty≤0
//selectadditional ItemName=""
//removeselected
//test
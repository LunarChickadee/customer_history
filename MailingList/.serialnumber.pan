

;vSerialNum="" //uncomment this to clear serial numbers
vSerialNum=?(vSerialNum="",info("serialnumber"),vSerialNum+", "+info("serialnumber"))
rudemessage vSerialNum
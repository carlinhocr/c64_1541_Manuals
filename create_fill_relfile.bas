1020 open 15,8,15 : rem open command channel
1030 input "enter relative file name";fi$ : rem select file parameters
1040 input "enter max # of records";nr : rem select file parameters
1050 input "enter record lenght";rl : rem select file parameters
1410 open 1,8,2,"0:"+fi$+",l,"+chr$(rl)
1420 gosub 59990
1430 rh = int(nr/256)
1440 rl = nr-256*rh
1445 rem uses 2 because it is the channel, position to last record number
1448 print "first positioning"
1450 print#15,"p"+chr$(96+2)+chr$(rl)+chr$(rh) 
1460 gosub 59990
1465 print "writing chr$(255);"
1470 print#1,chr$(255) : rem send default character to the record
1480 gosub 59990
1485 print "second positioning"
1490 print#15,"p"+chr$(96+2)+chr$(rl)+chr$(rh) : rem reposition for safety
1500 gosub 59990
1510 close 1
1520 gosub 59990
9980 close 15 : rem close command channel
9990 end : rem end the program
59980 rem error check subroutine
59990 input#15,en,em$,et,es
59995 rem ignore "record not present"
60000 if en >1 and en <>50 and en <> 51 then print en,em$,et,es:stop
60010 return
330 input "file name";f$
340 input "file channel";fc
350 input "input record size in bytes";rz
360 if tr <1 or tr > 65536 then 350
370 open fc,8,fc,f$+",l,"+chr$(rz)

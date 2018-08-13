PRO READ_TXT
  inFilePath = 'J:\HbThunderStorm\01.Datasets\01.ThunderStorm\2013-01.txt'
  
  OPENR, lun, inFilePath, /GET_LUN
  if lun eq -1 then return
  
  line = strarr(14651)
  while (~EOF(lun)) do begin
    READF, lun, line
    
    print, line[0:10]
  endwhile
END
;+
; :Description:
;    Describe the procedure.
;
; :Params:
;    InTxtPath
;    Xs
;    Xe
;    Ys
;    Ye
;    CellSize
;    OutImgPath
;
;
;
; :Author: HP
;-

PRO StormTxt2Img, InputPath, StormParaFile
  COMPILE_OPT IDL2
  ENVI, /RESTORE_BASE_SAVES_FILES
  ENVI_BATCH_INIT, LOG_FILE = 'batch.log'
  
  ;l. Read Storm Meta
  ReadStormMeta, StormParaFile, Xs=Xs, Xe=Xe, Ys=Ys, Ye=Ye,$
    CellSize=CellSize, HourInterleave=HourInterleave
 
  ;
  ;2. Transform Thunder Storm Data By Month
  ;
  FileList = file_search(InputPath+'\*.txt', COUNT=nFileCount)
  for i=0, N_Elements(FileList) DO begin
    if strlen(FileList[i]) eq 0 then continue
      
    pos = strpos(FileList[i], '.txt', /REVERSE_SEARCH)
    OutImgFile = strMid(FileList[i], 0, pos) + '.img'
    
    MonthTxt2Img, FileList[i], Xs, Xe, Ys, Ye, CellSize, HourInterleave, OutImgFile
  endfor
    
  ENVI_BATCH_EXIT
END




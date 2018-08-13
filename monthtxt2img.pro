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
;    HourInterleave
;
; :Keywords:
;    img
;    bnames
;
; :Author: HP
;-
PRO MonthTxt2Img, InTxtPath, Xs, Xe, Ys, Ye, CellSize, HourInterleave,outImgPath
  
  ; image size
  nl = long((Ye-Ys)/CellSize) + 1L;
  ns = long((Xe-Xs)/CellSize) + 1L;
  nb = 31 * 24 / HourInterleave

  img = bytarr(ns, nl, nb)
  lineData = strarr(ns*nl)
  
  ; open file
  openr, lun, InTxtPath, /GET_LUN
  if lun eq -1 then begin
    print, 'Open [', InTxtPath, '] Failed.'
    goto, cleanup
  endif

;  FORMAT_Txt = STRING(ns*nl) + '(I4, 1X, I2, 1X, I2, 1X, I2, 1X, I2, 1X, I2, F6.4, F6.4, B))'
;  STRTRIM(FORMAT_TXT, 1)
;  FORMAT_TXT = '(' + FORMAT_TXT;
  ;
  ; While there is text left, output it:
  k = 0;
  WHILE ~EOF(lun) DO BEGIN
    READF, lun, lineData  ; read 1 hour(ns*nl) line data
        
    for i=0L,ns do begin           
      for j=0, nl do begin
        
      endfor
      
      img[*,j,k] = ;
    endfor
    
    k++
  ENDWHILE
  
  ;
  ;
 

cleanup:
  ; Close the files and deallocate the units:
  if lun ne -1 then FREE_LUN, lun
  img = 0
  line = ''
END


FUNCTION, ParseTxt2Thunder, Txt
  COMPILE_OPT, 

END
;+
; :Description:
;    读取雷暴数据的经纬度范围和网格间距.
;
; :Params:
;    StormParaFile - 雷暴元数据文件
;
; :Keywords:
;    Xs - 起始经度
;    Xe - 结束经度
;    Ys - 起始纬度
;    Ye - 结束纬度
;    CellSize - 像素大小
;
; :Author: HP
;-

PRO ReadStormMeta, StormParaFile, Xs=Xs, Xe=Xe, Ys=Ys, Ye=Ye, $
  CellSize=CellSize, HourInterleave=HourInterleave
  COMPILE_OPT IDL2
  
  Xs = 108.2  ; Start Longitude
  Xe = 116.2  ; Longitude End
  Ys = 29.0   ; Start Latitude
  Ye = 33.5   ; Latitude End
  CellSize = 0.05 ; 0.05 Degree
  HourInterleave = 1  ;l Hours
END
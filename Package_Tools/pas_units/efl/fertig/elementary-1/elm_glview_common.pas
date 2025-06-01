unit elm_glview_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_GLView_Func_Cb = procedure(obj: PEvas_Object); cdecl;

  // === Konventiert am: 1-6-25 13:22:35 ===


implementation



end.

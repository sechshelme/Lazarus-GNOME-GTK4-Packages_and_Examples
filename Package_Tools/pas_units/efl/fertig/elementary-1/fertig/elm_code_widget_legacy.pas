unit elm_code_widget_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_code_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_code_widget_add(parent: PEvas_Object; code: PElm_Code): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 26-5-25 16:41:45 ===


implementation



end.

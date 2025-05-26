unit elm_code_diff_widget;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_code_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_code_diff_widget_add(parent: PEvas_Object; code: PElm_Code): PEvas_Object; cdecl; external libelementary;
procedure elm_code_diff_widget_font_set(widget: PEvas_Object; name: pchar; size: longint); cdecl; external libelementary;

// === Konventiert am: 26-5-25 16:41:32 ===


implementation



end.

unit elm_inwin_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_win_inwin_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_win_inwin_content_set(obj: PEvas_Object; content: PEvas_Object); cdecl; external libelementary;
function elm_win_inwin_content_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_win_inwin_content_unset(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:23 ===


implementation



end.

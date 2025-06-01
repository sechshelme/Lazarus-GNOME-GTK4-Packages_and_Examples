unit elm_menu_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_menu_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_menu_parent_set(obj: PEvas_Object; parent: PEvas_Object); cdecl; external libelementary;
function elm_menu_parent_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:41:59 ===


implementation



end.

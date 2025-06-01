unit elm_notify_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_notify_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_notify_parent_set(obj: PEvas_Object; parent: PEvas_Object); cdecl; external libelementary;
function elm_notify_parent_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:54:45 ===


implementation



end.

unit elc_naviframe_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure elm_naviframe_item_style_set(obj: PElm_Object_Item; style: pchar); cdecl; external libelementary;
function elm_naviframe_item_style_get(obj: PElm_Object_Item): pchar; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:47:00 ===


implementation



end.

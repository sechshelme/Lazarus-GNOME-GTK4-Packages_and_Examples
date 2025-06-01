unit elm_genlist_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_genlist_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_genlist_nth_item_get(obj: PEvas_Object; nth: dword): PElm_Object_Item; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:22:27 ===


implementation



end.

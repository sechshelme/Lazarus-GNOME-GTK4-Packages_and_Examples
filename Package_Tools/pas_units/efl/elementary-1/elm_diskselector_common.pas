unit elm_diskselector_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



procedure elm_diskselector_item_selected_set(it:PElm_Object_Item; selected:TEina_Bool);cdecl;external libelementary;
function elm_diskselector_item_selected_get(it:PElm_Object_Item):TEina_Bool;cdecl;external libelementary;
function elm_diskselector_item_prev_get(it:PElm_Object_Item):PElm_Object_Item;cdecl;external libelementary;
function elm_diskselector_item_next_get(it:PElm_Object_Item):PElm_Object_Item;cdecl;external libelementary;

// === Konventiert am: 1-6-25 12:57:18 ===


implementation



end.

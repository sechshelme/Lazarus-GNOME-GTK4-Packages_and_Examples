unit elm_toolbar_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_icon_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_toolbar_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_toolbar_reorder_mode_set(obj: PEvas_Object; reorder_mode: TEina_Bool); cdecl; external libelementary;
function elm_toolbar_reorder_mode_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_toolbar_transverse_expanded_set(obj: PEvas_Object; transverse_expanded: TEina_Bool); cdecl; external libelementary;
function elm_toolbar_transverse_expanded_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_toolbar_icon_order_lookup_set(obj: PEvas_Object; order: TElm_Icon_Lookup_Order); cdecl; external libelementary;
function elm_toolbar_icon_order_lookup_get(obj: PEvas_Object): TElm_Icon_Lookup_Order; cdecl; external libelementary;
procedure elm_toolbar_horizontal_set(obj: PEvas_Object; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_toolbar_horizontal_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 26-5-25 17:07:25 ===


implementation



end.

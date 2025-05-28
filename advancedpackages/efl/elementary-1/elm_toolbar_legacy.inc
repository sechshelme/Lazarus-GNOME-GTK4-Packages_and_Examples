{$IFDEF read_interface}


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


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

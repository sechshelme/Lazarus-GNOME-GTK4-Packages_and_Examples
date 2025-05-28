{$IFDEF read_interface}


type
  PElm_Prefs = ^TElm_Prefs;
  TElm_Prefs = TEo;

function elm_prefs_data_set(obj: PElm_Prefs; data: PElm_Prefs_Data): TEina_Bool; cdecl; external libelementary;
function elm_prefs_data_get(obj: PElm_Prefs): PElm_Prefs_Data; cdecl; external libelementary;
procedure elm_prefs_autosave_set(obj: PElm_Prefs; autosave: TEina_Bool); cdecl; external libelementary;
function elm_prefs_autosave_get(obj: PElm_Prefs): TEina_Bool; cdecl; external libelementary;
procedure elm_prefs_reset(obj: PElm_Prefs; mode: TElm_Prefs_Reset_Mode); cdecl; external libelementary;
function elm_prefs_item_value_set(obj: PElm_Prefs; name: pchar; value: PEina_Value): TEina_Bool; cdecl; external libelementary;
function elm_prefs_item_value_get(obj: PElm_Prefs; name: pchar; value: PEina_Value): TEina_Bool; cdecl; external libelementary;
function elm_prefs_item_object_get(obj: PElm_Prefs; name: pchar): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_prefs_item_disabled_set(obj: PElm_Prefs; name: pchar; disabled: TEina_Bool); cdecl; external libelementary;
function elm_prefs_item_disabled_get(obj: PElm_Prefs; name: pchar): TEina_Bool; cdecl; external libelementary;
function elm_prefs_item_swallow(obj: PElm_Prefs; name: pchar; child: PEfl_Canvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_prefs_item_editable_set(obj: PElm_Prefs; name: pchar; editable: TEina_Bool); cdecl; external libelementary;
function elm_prefs_item_editable_get(obj: PElm_Prefs; name: pchar): TEina_Bool; cdecl; external libelementary;
function elm_prefs_item_unswallow(obj: PElm_Prefs; name: pchar): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_prefs_item_visible_set(obj: PElm_Prefs; name: pchar; visible: TEina_Bool); cdecl; external libelementary;
function elm_prefs_item_visible_get(obj: PElm_Prefs; name: pchar): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:31:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

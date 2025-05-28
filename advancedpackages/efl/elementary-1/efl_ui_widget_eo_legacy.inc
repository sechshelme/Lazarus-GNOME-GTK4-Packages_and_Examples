{$IFDEF read_interface}


procedure elm_widget_resize_object_set(obj: PEfl_Ui_Widget; sobj: PEfl_Canvas_Object); cdecl; external libelementary;
procedure elm_widget_disabled_set(obj: PEfl_Ui_Widget; disabled: TEina_Bool); cdecl; external libelementary;
function elm_widget_disabled_get(obj: PEfl_Ui_Widget): TEina_Bool; cdecl; external libelementary;
function elm_widget_style_set(obj: PEfl_Ui_Widget; style: pchar): TEina_Error; cdecl; external libelementary;
function elm_widget_style_get(obj: PEfl_Ui_Widget): pchar; cdecl; external libelementary;
procedure elm_widget_can_focus_set(obj: PEfl_Ui_Widget; can_focus: TEina_Bool); cdecl; external libelementary;
function elm_widget_can_focus_get(obj: PEfl_Ui_Widget): TEina_Bool; cdecl; external libelementary;
procedure elm_widget_parent_set(obj: PEfl_Ui_Widget; parent: PEfl_Ui_Widget); cdecl; external libelementary;
function elm_widget_parent_get(obj: PEfl_Ui_Widget): PEfl_Ui_Widget; cdecl; external libelementary;
function elm_widget_sub_object_add(obj: PEfl_Ui_Widget; sub_obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_widget_sub_object_del(obj: PEfl_Ui_Widget; sub_obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_widget_theme_apply(obj: PEfl_Ui_Widget): TEina_Error; cdecl; external libelementary;
function elm_widget_focus_region_get(obj: PEfl_Ui_Widget): TEina_Rect; cdecl; external libelementary;
function elm_widget_focus_highlight_geometry_get(obj: PEfl_Ui_Widget): TEina_Rect; cdecl; external libelementary;
function elm_widget_focus_state_apply(obj: PEfl_Ui_Widget; current_state: TEfl_Ui_Widget_Focus_State; configured_state: PEfl_Ui_Widget_Focus_State; redirect: PEfl_Ui_Widget): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 25-5-25 18:55:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

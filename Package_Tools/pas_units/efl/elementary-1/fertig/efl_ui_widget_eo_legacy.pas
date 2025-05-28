unit efl_ui_widget_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, efl_ui_focus_object_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Widget = ^TEfl_Ui_Widget;
  TEfl_Ui_Widget = TEo;

type
  TEfl_Ui_Widget_Focus_State = record
    manager: PEfl_Ui_Focus_Manager;
    parent: PEfl_Ui_Focus_Object;
    logical: TEina_Bool;
  end;
  PEfl_Ui_Widget_Focus_State = ^TEfl_Ui_Widget_Focus_State;

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


implementation



end.

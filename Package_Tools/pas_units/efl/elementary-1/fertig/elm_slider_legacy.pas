unit elm_slider_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_general, elm_slider_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Slider = ^TElm_Slider;
  TElm_Slider = TEo;


function elm_slider_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_slider_horizontal_set(obj: PEvas_Object; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_slider_horizontal_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_slider_value_set(obj: PEvas_Object; val: double); cdecl; external libelementary;
function elm_slider_value_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_slider_inverted_set(obj: PEvas_Object; inverted: TEina_Bool); cdecl; external libelementary;
function elm_slider_inverted_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_slider_span_size_set(obj: PEvas_Object; size: TEvas_Coord); cdecl; external libelementary;
function elm_slider_span_size_get(obj: PEvas_Object): TEvas_Coord; cdecl; external libelementary;
procedure elm_slider_unit_format_set(obj: PEvas_Object; units: pchar); cdecl; external libelementary;
function elm_slider_unit_format_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_slider_units_format_function_set(obj: PEvas_Object; func: Tslider_func_type; free_func: Tslider_freefunc_type); cdecl; external libelementary;
procedure elm_slider_units_format_function_set_full(obj: PEvas_Object; func: Tslider_func_full_type; free_func: Tslider_freefunc_type; data: pointer); cdecl; external libelementary;
procedure elm_slider_min_max_set(obj: PEvas_Object; min: double; max: double); cdecl; external libelementary;
procedure elm_slider_min_max_get(obj: PEvas_Object; min: Pdouble; max: Pdouble); cdecl; external libelementary;
procedure elm_slider_range_enabled_set(obj: PEvas_Object; enable: TEina_Bool); cdecl; external libelementary;
function elm_slider_range_enabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_slider_range_set(obj: PEvas_Object; from: double; to_: double); cdecl; external libelementary;
procedure elm_slider_range_get(obj: PEvas_Object; from: Pdouble; to_: Pdouble); cdecl; external libelementary;
procedure elm_slider_indicator_format_set(obj: PEvas_Object; indicator: pchar); cdecl; external libelementary;
function elm_slider_indicator_format_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_slider_indicator_format_function_set(obj: PEvas_Object; func: Tslider_func_type; free_func: Tslider_freefunc_type); cdecl; external libelementary;
procedure elm_slider_indicator_format_function_set_full(obj: PEvas_Object; func: Tslider_func_full_type; free_func: Tslider_freefunc_type; data: pointer); cdecl; external libelementary;
procedure elm_slider_indicator_show_on_focus_set(obj: PEvas_Object; flag: TEina_Bool); cdecl; external libelementary;
function elm_slider_indicator_show_on_focus_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_slider_indicator_show_set(obj: PEvas_Object; show: TEina_Bool); cdecl; external libelementary;
function elm_slider_indicator_show_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_slider_indicator_visible_mode_set(obj: PEvas_Object; indicator_visible_mode: TElm_Slider_Indicator_Visible_Mode); cdecl; external libelementary;
function elm_slider_indicator_visible_mode_get(obj: PEvas_Object): TElm_Slider_Indicator_Visible_Mode; cdecl; external libelementary;
function elm_slider_step_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_slider_step_set(obj: PEvas_Object; step: double); cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:44:36 ===


implementation



end.

unit efl_canvas_object_eo;

interface

uses
  ctypes, efl, eina_rectangle, eina_types, Evas_Common, efl_input_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Object = ^TEfl_Canvas_Object;
  TEfl_Canvas_Object = TEo;

type
  PEfl_Event_Animator_Tick = ^TEfl_Event_Animator_Tick;

  TEfl_Event_Animator_Tick = record
    update_area: TEina_Rect;
  end;

function efl_canvas_object_class_get: PEfl_Class; cdecl; external libevas;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_object_pointer_mode_by_device_set(obj: PEo; dev: PEfl_Input_Device; pointer_mode: TEfl_Input_Object_Pointer_Mode): TEina_Bool; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_object_pointer_mode_by_device_get(obj: PEo; dev: PEfl_Input_Device): TEfl_Input_Object_Pointer_Mode; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_object_pointer_mode_set(obj: PEo; pointer_mode: TEfl_Input_Object_Pointer_Mode): TEina_Bool; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_object_pointer_mode_get(obj: PEo): TEfl_Input_Object_Pointer_Mode; cdecl; external libevas;
{$endif}
procedure efl_canvas_object_render_op_set(obj: PEo; render_op: TEfl_Gfx_Render_Op); cdecl; external libevas;
function efl_canvas_object_render_op_get(obj: PEo): TEfl_Gfx_Render_Op; cdecl; external libevas;
procedure efl_canvas_object_clipper_set(obj: PEo; clipper: PEfl_Canvas_Object); cdecl; external libevas;
function efl_canvas_object_clipper_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libevas;
{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_canvas_object_has_fixed_size_set(obj: PEo; enable: TEina_Bool); cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_object_has_fixed_size_get(obj: PEo): TEina_Bool; cdecl; external libevas;
{$endif}
procedure efl_canvas_object_repeat_events_set(obj: PEo; _repeat: TEina_Bool); cdecl; external libevas;
function efl_canvas_object_repeat_events_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_object_key_focus_set(obj: PEo; focus: TEina_Bool); cdecl; external libevas;
function efl_canvas_object_key_focus_get(obj: PEo): TEina_Bool; cdecl; external libevas;
function efl_canvas_object_seat_focus_get(obj: PEo): TEina_Bool; cdecl; external libevas;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_object_seat_focus_check(obj: PEo; seat: PEfl_Input_Device): TEina_Bool; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_object_seat_focus_add(obj: PEo; seat: PEfl_Input_Device): TEina_Bool; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_object_seat_focus_del(obj: PEo; seat: PEfl_Input_Device): TEina_Bool; cdecl; external libevas;
{$endif}
procedure efl_canvas_object_precise_is_inside_set(obj: PEo; precise: TEina_Bool); cdecl; external libevas;
function efl_canvas_object_precise_is_inside_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_object_propagate_events_set(obj: PEo; propagate: TEina_Bool); cdecl; external libevas;
function efl_canvas_object_propagate_events_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_object_pass_events_set(obj: PEo; pass: TEina_Bool); cdecl; external libevas;
function efl_canvas_object_pass_events_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_object_anti_alias_set(obj: PEo; anti_alias: TEina_Bool); cdecl; external libevas;
function efl_canvas_object_anti_alias_get(obj: PEo): TEina_Bool; cdecl; external libevas;
function efl_canvas_object_clipped_objects_get(obj: PEo): PEina_Iterator; cdecl; external libevas;
{$ifdef EFL_CANVAS_OBJECT_PROTECTED}
function efl_canvas_object_render_parent_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libevas;
{$endif}
procedure efl_canvas_object_paragraph_direction_set(obj: PEo; dir: TEfl_Text_Bidirectional_Type); cdecl; external libevas;
function efl_canvas_object_paragraph_direction_get(obj: PEo): TEfl_Text_Bidirectional_Type; cdecl; external libevas;
function efl_canvas_object_clipped_objects_count(obj: PEo): dword; cdecl; external libevas;
function efl_canvas_object_key_grab(obj: PEo; keyname: pchar; modifiers: TEfl_Input_Modifier; not_modifiers: TEfl_Input_Modifier; exclusive: TEina_Bool): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_object_key_ungrab(obj: PEo; keyname: pchar; modifiers: TEfl_Input_Modifier; not_modifiers: TEfl_Input_Modifier); cdecl; external libevas;
procedure efl_canvas_object_no_render_set(obj: PEo; enable: TEina_Bool); cdecl; external libevas;
function efl_canvas_object_no_render_get(obj: PEo): TEina_Bool; cdecl; external libevas;
function efl_canvas_object_coords_inside_get(obj: PEo; pos: TEina_Position2D): TEina_Bool; cdecl; external libevas;

var
  _EFL_CANVAS_OBJECT_EVENT_ANIMATOR_TICK: TEfl_Event_Description; cvar;external libevas;


function EFL_CANVAS_OBJECT_CLASS: PEfl_Class;
function EFL_CANVAS_OBJECT_EVENT_ANIMATOR_TICK: PEfl_Event_Description;


// === Konventiert am: 12-5-25 19:37:40 ===


implementation


function EFL_CANVAS_OBJECT_CLASS: PEfl_Class;
begin
  EFL_CANVAS_OBJECT_CLASS := efl_canvas_object_class_get;
end;

function EFL_CANVAS_OBJECT_EVENT_ANIMATOR_TICK: PEfl_Event_Description;
begin
  EFL_CANVAS_OBJECT_EVENT_ANIMATOR_TICK := @_EFL_CANVAS_OBJECT_EVENT_ANIMATOR_TICK;
end;


end.

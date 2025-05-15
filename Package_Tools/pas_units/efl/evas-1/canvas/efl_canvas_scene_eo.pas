unit efl_canvas_scene_eo;

interface

uses
  ctypes, efl, eina_rectangle, eina_types, eina_iterator, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Scene = ^TEfl_Canvas_Scene;
  TEfl_Canvas_Scene = TEo;

function EFL_CANVAS_SCENE_INTERFACE: PEfl_Class;

function efl_canvas_scene_interface_get: PEfl_Class; cdecl; external libevas;
function efl_canvas_scene_image_max_size_get(obj: PEo; max: PEina_Size2D): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_scene_group_objects_calculate(obj: PEo); cdecl; external libevas;
function efl_canvas_scene_group_objects_calculating_get(obj: PEo): TEina_Bool; cdecl; external libevas;
function efl_canvas_scene_objects_at_xy_get(obj: PEo; pos: TEina_Position2D; include_pass_events_objects: TEina_Bool; include_hidden_objects: TEina_Bool): PEina_Iterator; cdecl; external libevas;
function efl_canvas_scene_object_top_at_xy_get(obj: PEo; pos: TEina_Position2D; include_pass_events_objects: TEina_Bool; include_hidden_objects: TEina_Bool): PEfl_Gfx_Entity; cdecl; external libevas;
function efl_canvas_scene_objects_in_rectangle_get(obj: PEo; rect: TEina_Rect; include_pass_events_objects: TEina_Bool; include_hidden_objects: TEina_Bool): PEina_Iterator; cdecl; external libevas;
function efl_canvas_scene_object_top_in_rectangle_get(obj: PEo; rect: TEina_Rect; include_pass_events_objects: TEina_Bool; include_hidden_objects: TEina_Bool): PEfl_Gfx_Entity; cdecl; external libevas;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_scene_seats(obj: PEo): PEina_Iterator; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_scene_device_get(obj: PEo; name: pchar): PEfl_Input_Device; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_scene_seat_get(obj: PEo; id: longint): PEfl_Input_Device; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_scene_seat_default_get(obj: PEo): PEfl_Input_Device; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_scene_pointer_position_get(obj: PEo; seat: PEfl_Input_Device; pos: PEina_Position2D): TEina_Bool; cdecl; external libevas;
{$endif}
var
  _EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN: TEfl_Event_Description; cvar;external libevas;
  _EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT: TEfl_Event_Description; cvar;external libevas;
  _EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN: TEfl_Event_Description; cvar;external libevas;
  _EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT: TEfl_Event_Description; cvar;external libevas;
  _EFL_CANVAS_SCENE_EVENT_RENDER_PRE: TEfl_Event_Description; cvar;external libevas;

function EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN: PEfl_Event_Description;
function EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT: PEfl_Event_Description;
function EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN: PEfl_Event_Description;
function EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT: PEfl_Event_Description;
function EFL_CANVAS_SCENE_EVENT_RENDER_PRE: PEfl_Event_Description;

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_CANVAS_SCENE_EVENT_RENDER_POST: TEfl_Event_Description; cvar;external libevas;
  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED: TEfl_Event_Description; cvar;external libevas;
  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED: TEfl_Event_Description; cvar;external libevas;
  {$endif}
  {$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED: TEfl_Event_Description; cvar;external libevas;

function EFL_CANVAS_SCENE_EVENT_RENDER_POST: PEfl_Event_Description;
function EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED: PEfl_Event_Description;
function EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED: PEfl_Event_Description;
function EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 13-5-25 16:50:29 ===


implementation



function EFL_CANVAS_SCENE_INTERFACE: PEfl_Class;
begin
  EFL_CANVAS_SCENE_INTERFACE := efl_canvas_scene_interface_get;
end;


function EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN: PEfl_Event_Description;
begin
  EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN := @(_EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN);
end;


function EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT: PEfl_Event_Description;
begin
  EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT := @(_EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT);
end;


function EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN: PEfl_Event_Description;
begin
  EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN := @(_EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN);
end;


function EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT: PEfl_Event_Description;
begin
  EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT := @(_EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT);
end;


function EFL_CANVAS_SCENE_EVENT_RENDER_PRE: PEfl_Event_Description;
begin
  EFL_CANVAS_SCENE_EVENT_RENDER_PRE := @(_EFL_CANVAS_SCENE_EVENT_RENDER_PRE);
end;


function EFL_CANVAS_SCENE_EVENT_RENDER_POST: PEfl_Event_Description;
begin
  EFL_CANVAS_SCENE_EVENT_RENDER_POST := @(_EFL_CANVAS_SCENE_EVENT_RENDER_POST);
end;


function EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED: PEfl_Event_Description;
begin
  EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED := @(_EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED);
end;


function EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED: PEfl_Event_Description;
begin
  EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED := @(_EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED);
end;


function EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED: PEfl_Event_Description;
begin
  EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED := @(_EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED);
end;


end.

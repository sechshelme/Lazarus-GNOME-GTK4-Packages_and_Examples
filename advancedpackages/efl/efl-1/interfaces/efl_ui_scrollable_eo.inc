{$IFDEF read_interface}


type
  PEfl_Ui_Scrollable = ^TEfl_Ui_Scrollable;
  TEfl_Ui_Scrollable = TEo;

function EFL_UI_SCROLLABLE_INTERFACE: PEfl_Class;

function efl_ui_scrollable_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_scrollable_content_pos_set(obj: PEo; pos: TEina_Position2D); cdecl; external libefl;
function efl_ui_scrollable_content_pos_get(obj: PEo): TEina_Position2D; cdecl; external libefl;
function efl_ui_scrollable_content_size_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
function efl_ui_scrollable_viewport_geometry_get(obj: PEo): TEina_Rect; cdecl; external libefl;
procedure efl_ui_scrollable_bounce_enabled_set(obj: PEo; horiz: TEina_Bool; vert: TEina_Bool); cdecl; external libefl;
procedure efl_ui_scrollable_bounce_enabled_get(obj: PEo; horiz: PEina_Bool; vert: PEina_Bool); cdecl; external libefl;
procedure efl_ui_scrollable_scroll_freeze_set(obj: PEo; freeze: TEina_Bool); cdecl; external libefl;
function efl_ui_scrollable_scroll_freeze_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_ui_scrollable_scroll_hold_set(obj: PEo; hold: TEina_Bool); cdecl; external libefl;
function efl_ui_scrollable_scroll_hold_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_ui_scrollable_looping_set(obj: PEo; loop_h: TEina_Bool; loop_v: TEina_Bool); cdecl; external libefl;
procedure efl_ui_scrollable_looping_get(obj: PEo; loop_h: PEina_Bool; loop_v: PEina_Bool); cdecl; external libefl;
procedure efl_ui_scrollable_movement_block_set(obj: PEo; block: TEfl_Ui_Layout_Orientation); cdecl; external libefl;
function efl_ui_scrollable_movement_block_get(obj: PEo): TEfl_Ui_Layout_Orientation; cdecl; external libefl;
procedure efl_ui_scrollable_gravity_set(obj: PEo; x: double; y: double); cdecl; external libefl;
procedure efl_ui_scrollable_gravity_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libefl;
procedure efl_ui_scrollable_match_content_set(obj: PEo; w: TEina_Bool; h: TEina_Bool); cdecl; external libefl;
procedure efl_ui_scrollable_step_size_set(obj: PEo; step: TEina_Position2D); cdecl; external libefl;
function efl_ui_scrollable_step_size_get(obj: PEo): TEina_Position2D; cdecl; external libefl;
procedure efl_ui_scrollable_scroll(obj: PEo; rect: TEina_Rect; animation: TEina_Bool); cdecl; external libefl;

var
  _EFL_UI_EVENT_SCROLL_STARTED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_FINISHED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_UP: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_DOWN: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_LEFT: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_RIGHT: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_EDGE_UP: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_EDGE_LEFT: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_EDGE_DOWN: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_EDGE_RIGHT: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_ANIM_STARTED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_ANIM_FINISHED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_DRAG_STARTED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_SCROLL_DRAG_FINISHED: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_EVENT_SCROLL_STARTED: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_CHANGED: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_FINISHED: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_UP: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_DOWN: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_LEFT: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_RIGHT: PEfl_Event_Description;
function EFL_UI_EVENT_EDGE_UP: PEfl_Event_Description;
function EFL_UI_EVENT_EDGE_DOWN: PEfl_Event_Description;
function EFL_UI_EVENT_EDGE_LEFT: PEfl_Event_Description;
function EFL_UI_EVENT_EDGE_RIGHT: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_ANIM_STARTED: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_ANIM_FINISHED: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_DRAG_STARTED: PEfl_Event_Description;
function EFL_UI_EVENT_SCROLL_DRAG_FINISHED: PEfl_Event_Description;


// === Konventiert am: 18-5-25 19:36:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_SCROLLABLE_INTERFACE: PEfl_Class;
begin
  EFL_UI_SCROLLABLE_INTERFACE := efl_ui_scrollable_interface_get;
end;

function EFL_UI_EVENT_SCROLL_STARTED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_STARTED := @(_EFL_UI_EVENT_SCROLL_STARTED);
end;

function EFL_UI_EVENT_SCROLL_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_CHANGED := @(_EFL_UI_EVENT_SCROLL_CHANGED);
end;

function EFL_UI_EVENT_SCROLL_FINISHED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_FINISHED := @(_EFL_UI_EVENT_SCROLL_FINISHED);
end;

function EFL_UI_EVENT_SCROLL_UP: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_UP := @(_EFL_UI_EVENT_SCROLL_UP);
end;

function EFL_UI_EVENT_SCROLL_DOWN: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_DOWN := @(_EFL_UI_EVENT_SCROLL_DOWN);
end;

function EFL_UI_EVENT_SCROLL_LEFT: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_LEFT := @(_EFL_UI_EVENT_SCROLL_LEFT);
end;

function EFL_UI_EVENT_SCROLL_RIGHT: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_RIGHT := @(_EFL_UI_EVENT_SCROLL_RIGHT);
end;

function EFL_UI_EVENT_EDGE_UP: PEfl_Event_Description;
begin
  EFL_UI_EVENT_EDGE_UP := @(_EFL_UI_EVENT_EDGE_UP);
end;

function EFL_UI_EVENT_EDGE_DOWN: PEfl_Event_Description;
begin
  EFL_UI_EVENT_EDGE_DOWN := @(_EFL_UI_EVENT_EDGE_DOWN);
end;

function EFL_UI_EVENT_EDGE_LEFT: PEfl_Event_Description;
begin
  EFL_UI_EVENT_EDGE_LEFT := @(_EFL_UI_EVENT_EDGE_LEFT);
end;

function EFL_UI_EVENT_EDGE_RIGHT: PEfl_Event_Description;
begin
  EFL_UI_EVENT_EDGE_RIGHT := @(_EFL_UI_EVENT_EDGE_RIGHT);
end;

function EFL_UI_EVENT_SCROLL_ANIM_STARTED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_ANIM_STARTED := @(_EFL_UI_EVENT_SCROLL_ANIM_STARTED);
end;

function EFL_UI_EVENT_SCROLL_ANIM_FINISHED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_ANIM_FINISHED := @(_EFL_UI_EVENT_SCROLL_ANIM_FINISHED);
end;

function EFL_UI_EVENT_SCROLL_DRAG_STARTED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_DRAG_STARTED := @(_EFL_UI_EVENT_SCROLL_DRAG_STARTED);
end;

function EFL_UI_EVENT_SCROLL_DRAG_FINISHED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SCROLL_DRAG_FINISHED := @(_EFL_UI_EVENT_SCROLL_DRAG_FINISHED);
end;


{$ENDIF read_implementation}

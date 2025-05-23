{$IFDEF read_interface}


type
  PEfl_Gfx_Hint = ^TEfl_Gfx_Hint;
  TEfl_Gfx_Hint = TEo;

const
  EFL_GFX_HINT_EXPAND = 1.000000;
  EFL_GFX_HINT_ALIGN_LEFT = 0.000000;
  EFL_GFX_HINT_ALIGN_RIGHT = 1.000000;
  EFL_GFX_HINT_ALIGN_TOP = 0.000000;
  EFL_GFX_HINT_ALIGN_BOTTOM = 1.000000;
  EFL_GFX_HINT_ALIGN_CENTER = 0.500000;

function EFL_GFX_HINT_INTERFACE: PEfl_Class;

function efl_gfx_hint_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_hint_aspect_set(obj: PEo; mode: TEfl_Gfx_Hint_Aspect; sz: TEina_Size2D); cdecl; external libefl;
procedure efl_gfx_hint_aspect_get(obj: PEo; mode: PEfl_Gfx_Hint_Aspect; sz: PEina_Size2D); cdecl; external libefl;
procedure efl_gfx_hint_size_max_set(obj: PEo; sz: TEina_Size2D); cdecl; external libefl;
function efl_gfx_hint_size_max_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
procedure efl_gfx_hint_size_restricted_max_set(obj: PEo; sz: TEina_Size2D); cdecl; external libefl;
function efl_gfx_hint_size_restricted_max_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
function efl_gfx_hint_size_combined_max_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
procedure efl_gfx_hint_size_min_set(obj: PEo; sz: TEina_Size2D); cdecl; external libefl;
function efl_gfx_hint_size_min_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
procedure efl_gfx_hint_size_restricted_min_set(obj: PEo; sz: TEina_Size2D); cdecl; external libefl;
function efl_gfx_hint_size_restricted_min_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
function efl_gfx_hint_size_combined_min_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
procedure efl_gfx_hint_margin_set(obj: PEo; l: longint; r: longint; t: longint; b: longint); cdecl; external libefl;
procedure efl_gfx_hint_margin_get(obj: PEo; l: Plongint; r: Plongint; t: Plongint; b: Plongint); cdecl; external libefl;
procedure efl_gfx_hint_weight_set(obj: PEo; x: double; y: double); cdecl; external libefl;
procedure efl_gfx_hint_weight_get(obj: PEo; x: Pdouble; y: Pdouble); cdecl; external libefl;
procedure efl_gfx_hint_align_set(obj: PEo; x: TEfl_Gfx_Align; y: TEfl_Gfx_Align); cdecl; external libefl;
procedure efl_gfx_hint_align_get(obj: PEo; x: PEfl_Gfx_Align; y: PEfl_Gfx_Align); cdecl; external libefl;
procedure efl_gfx_hint_fill_set(obj: PEo; x: TEina_Bool; y: TEina_Bool); cdecl; external libefl;
procedure efl_gfx_hint_fill_get(obj: PEo; x: PEina_Bool; y: PEina_Bool); cdecl; external libefl;

var
  _EFL_GFX_ENTITY_EVENT_HINTS_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_GFX_ENTITY_EVENT_HINTS_CHANGED: PEfl_Event_Description;


// === Konventiert am: 18-5-25 19:36:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_GFX_HINT_INTERFACE: PEfl_Class;
begin
  EFL_GFX_HINT_INTERFACE := efl_gfx_hint_interface_get;
end;

function EFL_GFX_ENTITY_EVENT_HINTS_CHANGED: PEfl_Event_Description;
begin
  EFL_GFX_ENTITY_EVENT_HINTS_CHANGED := @(_EFL_GFX_ENTITY_EVENT_HINTS_CHANGED);
end;


{$ENDIF read_implementation}

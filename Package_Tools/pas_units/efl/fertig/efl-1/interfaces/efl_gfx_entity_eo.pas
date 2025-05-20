unit efl_gfx_entity_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Entity = ^TEfl_Gfx_Entity;
  TEfl_Gfx_Entity = TEo;

function EFL_GFX_ENTITY_INTERFACE: PEfl_Class;

function efl_gfx_entity_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_entity_position_set(obj: PEo; pos: TEina_Position2D); cdecl; external libefl;
function efl_gfx_entity_position_get(obj: PEo): TEina_Position2D; cdecl; external libefl;
procedure efl_gfx_entity_size_set(obj: PEo; size: TEina_Size2D); cdecl; external libefl;
function efl_gfx_entity_size_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
procedure efl_gfx_entity_geometry_set(obj: PEo; rect: TEina_Rect); cdecl; external libefl;
function efl_gfx_entity_geometry_get(obj: PEo): TEina_Rect; cdecl; external libefl;
procedure efl_gfx_entity_visible_set(obj: PEo; v: TEina_Bool); cdecl; external libefl;
function efl_gfx_entity_visible_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_gfx_entity_scale_set(obj: PEo; scale: double); cdecl; external libefl;
function efl_gfx_entity_scale_get(obj: PEo): double; cdecl; external libefl;

var
  _EFL_GFX_ENTITY_EVENT_VISIBILITY_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_GFX_ENTITY_EVENT_POSITION_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_GFX_ENTITY_EVENT_SIZE_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_GFX_ENTITY_EVENT_VISIBILITY_CHANGED: PEfl_Event_Description;
function EFL_GFX_ENTITY_EVENT_POSITION_CHANGED: PEfl_Event_Description;
function EFL_GFX_ENTITY_EVENT_SIZE_CHANGED: PEfl_Event_Description;


// === Konventiert am: 19-5-25 17:22:11 ===


implementation


function EFL_GFX_ENTITY_INTERFACE: PEfl_Class;
begin
  EFL_GFX_ENTITY_INTERFACE := efl_gfx_entity_interface_get;
end;

function EFL_GFX_ENTITY_EVENT_VISIBILITY_CHANGED: PEfl_Event_Description;
begin
  EFL_GFX_ENTITY_EVENT_VISIBILITY_CHANGED := @(_EFL_GFX_ENTITY_EVENT_VISIBILITY_CHANGED);
end;

function EFL_GFX_ENTITY_EVENT_POSITION_CHANGED: PEfl_Event_Description;
begin
  EFL_GFX_ENTITY_EVENT_POSITION_CHANGED := @(_EFL_GFX_ENTITY_EVENT_POSITION_CHANGED);
end;

function EFL_GFX_ENTITY_EVENT_SIZE_CHANGED: PEfl_Event_Description;
begin
  EFL_GFX_ENTITY_EVENT_SIZE_CHANGED := @(_EFL_GFX_ENTITY_EVENT_SIZE_CHANGED);
end;


end.

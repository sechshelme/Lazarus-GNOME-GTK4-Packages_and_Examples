unit efl_gfx_stack_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Stack = ^TEfl_Gfx_Stack;
  TEfl_Gfx_Stack = TEo;

const
  EFL_GFX_STACK_LAYER_MIN = -(32768);
  EFL_GFX_STACK_LAYER_MAX = 32767;

function EFL_GFX_STACK_INTERFACE: PEfl_Class;

function efl_gfx_stack_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_stack_layer_set(obj: PEo; l: smallint); cdecl; external libefl;
function efl_gfx_stack_layer_get(obj: PEo): smallint; cdecl; external libefl;
function efl_gfx_stack_below_get(obj: PEo): PEfl_Gfx_Stack; cdecl; external libefl;
function efl_gfx_stack_above_get(obj: PEo): PEfl_Gfx_Stack; cdecl; external libefl;
procedure efl_gfx_stack_below(obj: PEo; below: PEfl_Gfx_Stack); cdecl; external libefl;
procedure efl_gfx_stack_raise_to_top(obj: PEo); cdecl; external libefl;
procedure efl_gfx_stack_above(obj: PEo; above: PEfl_Gfx_Stack); cdecl; external libefl;
procedure efl_gfx_stack_lower_to_bottom(obj: PEo); cdecl; external libefl;

var
  _EFL_GFX_ENTITY_EVENT_STACKING_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_GFX_ENTITY_EVENT_STACKING_CHANGED: PEfl_Event_Description;


// === Konventiert am: 19-5-25 19:23:26 ===


implementation


function EFL_GFX_STACK_INTERFACE: PEfl_Class;
begin
  EFL_GFX_STACK_INTERFACE := efl_gfx_stack_interface_get;
end;

function EFL_GFX_ENTITY_EVENT_STACKING_CHANGED: PEfl_Event_Description;
begin
  EFL_GFX_ENTITY_EVENT_STACKING_CHANGED := @(_EFL_GFX_ENTITY_EVENT_STACKING_CHANGED);
end;


end.

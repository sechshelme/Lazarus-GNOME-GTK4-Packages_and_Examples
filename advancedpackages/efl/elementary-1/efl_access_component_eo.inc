{$IFDEF read_interface}


type
  PEfl_Access_Component = ^TEfl_Access_Component;
  TEfl_Access_Component = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_COMPONENT_MIXIN: PEfl_Class;

function efl_access_component_mixin_get: PEfl_Class; cdecl; external libelementary;
function efl_access_component_z_order_get(obj: PEo): longint; cdecl; external libelementary;
function efl_access_component_extents_set(obj: PEo; screen_coords: TEina_Bool; rect: TEina_Rect): TEina_Bool; cdecl; external libelementary;
function efl_access_component_extents_get(obj: PEo; screen_coords: TEina_Bool): TEina_Rect; cdecl; external libelementary;
function efl_access_component_screen_position_set(obj: PEo; x: longint; y: longint): TEina_Bool; cdecl; external libelementary;
procedure efl_access_component_screen_position_get(obj: PEo; x: Plongint; y: Plongint); cdecl; external libelementary;
function efl_access_component_contains(obj: PEo; screen_coords: TEina_Bool; x: longint; y: longint): TEina_Bool; cdecl; external libelementary;
function efl_access_component_focus_grab(obj: PEo): TEina_Bool; cdecl; external libelementary;
function efl_access_component_accessible_at_point_get(obj: PEo; screen_coords: TEina_Bool; x: longint; y: longint): PEfl_Object; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 13:11:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_COMPONENT_MIXIN: PEfl_Class;
begin
  EFL_ACCESS_COMPONENT_MIXIN := efl_access_component_mixin_get;
end;
{$endif}


{$ENDIF read_implementation}

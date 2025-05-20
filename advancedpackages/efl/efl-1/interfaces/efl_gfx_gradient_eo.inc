{$IFDEF read_interface}


type
  PEfl_Gfx_Gradient = ^TEfl_Gfx_Gradient;
  TEfl_Gfx_Gradient = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_GRADIENT_INTERFACE: PEfl_Class;

function efl_gfx_gradient_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_gradient_stop_set(obj: PEo; colors: PEfl_Gfx_Gradient_Stop; length: dword); cdecl; external libefl;
procedure efl_gfx_gradient_stop_get(obj: PEo; colors: PPEfl_Gfx_Gradient_Stop; length: Pdword); cdecl; external libefl;
procedure efl_gfx_gradient_spread_set(obj: PEo; s: TEfl_Gfx_Gradient_Spread); cdecl; external libefl;
function efl_gfx_gradient_spread_get(obj: PEo): TEfl_Gfx_Gradient_Spread; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:47:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname def_expr }
function EFL_GFX_GRADIENT_INTERFACE: PEfl_Class;
begin
  EFL_GFX_GRADIENT_INTERFACE := efl_gfx_gradient_interface_get;
end;


{$ENDIF read_implementation}

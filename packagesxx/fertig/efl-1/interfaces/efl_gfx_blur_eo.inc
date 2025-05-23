{$IFDEF read_interface}


type
  PEfl_Gfx_Blur = ^TEfl_Gfx_Blur;
  TEfl_Gfx_Blur = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_BLUR_INTERFACE: PEfl_Class;

function efl_gfx_blur_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_blur_radius_set(obj: PEo; rx: double; ry: double); cdecl; external libefl;
procedure efl_gfx_blur_radius_get(obj: PEo; rx: Pdouble; ry: Pdouble); cdecl; external libefl;
procedure efl_gfx_blur_offset_set(obj: PEo; ox: double; oy: double); cdecl; external libefl;
procedure efl_gfx_blur_offset_get(obj: PEo; ox: Pdouble; oy: Pdouble); cdecl; external libefl;
procedure efl_gfx_blur_grow_set(obj: PEo; radius: double); cdecl; external libefl;
function efl_gfx_blur_grow_get(obj: PEo): double; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:05:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_BLUR_INTERFACE: PEfl_Class;
begin
  EFL_GFX_BLUR_INTERFACE := efl_gfx_blur_interface_get;
end;
{$endif}


{$ENDIF read_implementation}

{$IFDEF read_interface}


type
  PEfl_Gfx_Color = ^TEfl_Gfx_Color;
  TEfl_Gfx_Color = TEo;

function EFL_GFX_COLOR_MIXIN: PEfl_Class;

function efl_gfx_color_mixin_get: PEfl_Class; cdecl; external libefl;
procedure efl_gfx_color_set(obj: PEo; r: longint; g: longint; b: longint; a: longint); cdecl; external libefl;
procedure efl_gfx_color_get(obj: PEo; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libefl;
procedure efl_gfx_color_code_set(obj: PEo; colorcode: pchar); cdecl; external libefl;
function efl_gfx_color_code_get(obj: PEo): pchar; cdecl; external libefl;

// === Konventiert am: 20-5-25 13:05:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_GFX_COLOR_MIXIN: PEfl_Class;
begin
  EFL_GFX_COLOR_MIXIN := efl_gfx_color_mixin_get;
end;


{$ENDIF read_implementation}

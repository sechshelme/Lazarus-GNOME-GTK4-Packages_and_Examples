{$IFDEF read_interface}


type
  PEfl_Screen = ^TEfl_Screen;
  TEfl_Screen = TEo;

function EFL_SCREEN_INTERFACE: PEfl_Class;

function efl_screen_interface_get: PEfl_Class; cdecl; external libefl;
function efl_screen_size_in_pixels_get(obj: PEo): TEina_Size2D; cdecl; external libefl;
function efl_screen_scale_factor_get(obj: PEo): single; cdecl; external libefl;
function efl_screen_rotation_get(obj: PEo): longint; cdecl; external libefl;
procedure efl_screen_dpi_get(obj: PEo; xdpi: Plongint; ydpi: Plongint); cdecl; external libefl;

// === Konventiert am: 20-5-25 13:48:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_SCREEN_INTERFACE: PEfl_Class;
begin
  EFL_SCREEN_INTERFACE := efl_screen_interface_get;
end;


{$ENDIF read_implementation}

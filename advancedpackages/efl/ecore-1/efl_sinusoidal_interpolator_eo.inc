{$IFDEF read_interface}


type
  PEfl_Sinusoidal_Interpolator = ^TEfl_Sinusoidal_Interpolator;
  TEfl_Sinusoidal_Interpolator = TEo;

function EFL_SINUSOIDAL_INTERPOLATOR_CLASS: PEfl_Class;

function efl_sinusoidal_interpolator_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_sinusoidal_interpolator_slope_set(obj: PEo; slope: double); cdecl; external libecore;
function efl_sinusoidal_interpolator_slope_get(obj: PEo): double; cdecl; external libecore;

// === Konventiert am: 21-5-25 16:49:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_SINUSOIDAL_INTERPOLATOR_CLASS: PEfl_Class;
begin
  EFL_SINUSOIDAL_INTERPOLATOR_CLASS := efl_sinusoidal_interpolator_class_get;
end;


{$ENDIF read_implementation}

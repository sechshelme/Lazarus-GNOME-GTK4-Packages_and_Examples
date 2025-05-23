{$IFDEF read_interface}


type
  PEfl_Interpolator = ^TEfl_Interpolator;
  TEfl_Interpolator = TEo;

function EFL_INTERPOLATOR_INTERFACE: PEfl_Class;

function efl_interpolator_interface_get: PEfl_Class; cdecl; external libefl;
function efl_interpolator_interpolate(obj: PEo; progress: double): double; cdecl; external libefl;

// === Konventiert am: 20-5-25 14:43:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_INTERPOLATOR_INTERFACE: PEfl_Class;
begin
  EFL_INTERPOLATOR_INTERFACE := efl_interpolator_interface_get;
end;


{$ENDIF read_implementation}

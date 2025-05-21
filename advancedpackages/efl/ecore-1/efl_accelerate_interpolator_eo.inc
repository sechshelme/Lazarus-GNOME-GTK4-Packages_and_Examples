{$IFDEF read_interface}


type
  PEfl_Accelerate_Interpolator = ^TEfl_Accelerate_Interpolator;
  TEfl_Accelerate_Interpolator = TEo;

function EFL_ACCELERATE_INTERPOLATOR_CLASS: PEfl_Class;

function efl_accelerate_interpolator_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_accelerate_interpolator_slope_set(obj: PEo; slope: double); cdecl; external libecore;
function efl_accelerate_interpolator_slope_get(obj: PEo): double; cdecl; external libecore;

// === Konventiert am: 21-5-25 16:48:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_ACCELERATE_INTERPOLATOR_CLASS: PEfl_Class;
begin
  EFL_ACCELERATE_INTERPOLATOR_CLASS := efl_accelerate_interpolator_class_get;
end;


{$ENDIF read_implementation}

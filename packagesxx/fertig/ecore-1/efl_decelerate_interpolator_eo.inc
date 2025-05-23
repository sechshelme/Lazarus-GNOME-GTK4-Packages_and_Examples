{$IFDEF read_interface}


type
  PEfl_Decelerate_Interpolator = ^TEfl_Decelerate_Interpolator;
  TEfl_Decelerate_Interpolator = TEo;

function EFL_DECELERATE_INTERPOLATOR_CLASS: PEfl_Class;

function efl_decelerate_interpolator_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_decelerate_interpolator_slope_set(obj: PEo; slope: double); cdecl; external libecore;
function efl_decelerate_interpolator_slope_get(obj: PEo): double; cdecl; external libecore;

// === Konventiert am: 21-5-25 16:49:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_DECELERATE_INTERPOLATOR_CLASS: PEfl_Class;
begin
  EFL_DECELERATE_INTERPOLATOR_CLASS := efl_decelerate_interpolator_class_get;
end;


{$ENDIF read_implementation}

{$IFDEF read_interface}


type
  PEfl_Linear_Interpolator = ^TEfl_Linear_Interpolator;
  TEfl_Linear_Interpolator = TEo;

function EFL_LINEAR_INTERPOLATOR_CLASS: PEfl_Class;

function efl_linear_interpolator_class_get: PEfl_Class; cdecl; external libecore;

// === Konventiert am: 21-5-25 17:19:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_LINEAR_INTERPOLATOR_CLASS: PEfl_Class;
begin
  EFL_LINEAR_INTERPOLATOR_CLASS := efl_linear_interpolator_class_get;
end;


{$ENDIF read_implementation}

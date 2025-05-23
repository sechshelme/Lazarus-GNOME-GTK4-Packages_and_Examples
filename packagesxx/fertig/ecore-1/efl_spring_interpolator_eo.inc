{$IFDEF read_interface}


type
  PEfl_Spring_Interpolator = ^TEfl_Spring_Interpolator;
  TEfl_Spring_Interpolator = TEo;

function EFL_SPRING_INTERPOLATOR_CLASS: PEfl_Class;

function efl_spring_interpolator_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_spring_interpolator_decay_set(obj: PEo; decay: double); cdecl; external libecore;
function efl_spring_interpolator_decay_get(obj: PEo): double; cdecl; external libecore;
procedure efl_spring_interpolator_oscillations_set(obj: PEo; oscillations: longint); cdecl; external libecore;
function efl_spring_interpolator_oscillations_get(obj: PEo): longint; cdecl; external libecore;

// === Konventiert am: 21-5-25 16:49:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_SPRING_INTERPOLATOR_CLASS: PEfl_Class;
begin
  EFL_SPRING_INTERPOLATOR_CLASS := efl_spring_interpolator_class_get;
end;


{$ENDIF read_implementation}

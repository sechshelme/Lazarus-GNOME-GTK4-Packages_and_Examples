{$IFDEF read_interface}


type
  PEfl_Bounce_Interpolator = ^TEfl_Bounce_Interpolator;
  TEfl_Bounce_Interpolator = TEo;

function EFL_BOUNCE_INTERPOLATOR_CLASS: PEfl_Class;

function efl_bounce_interpolator_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_bounce_interpolator_bounces_set(obj: PEo; bounces: longint); cdecl; external libecore;
function efl_bounce_interpolator_bounces_get(obj: PEo): longint; cdecl; external libecore;
procedure efl_bounce_interpolator_rigidness_set(obj: PEo; rigidness: double); cdecl; external libecore;
function efl_bounce_interpolator_rigidness_get(obj: PEo): double; cdecl; external libecore;

// === Konventiert am: 21-5-25 16:49:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_BOUNCE_INTERPOLATOR_CLASS: PEfl_Class;
begin
  EFL_BOUNCE_INTERPOLATOR_CLASS := efl_bounce_interpolator_class_get;
end;


{$ENDIF read_implementation}

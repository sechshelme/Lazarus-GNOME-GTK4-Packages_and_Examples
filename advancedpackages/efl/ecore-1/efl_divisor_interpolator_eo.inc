{$IFDEF read_interface}


type
  PEfl_Divisor_Interpolator = ^TEfl_Divisor_Interpolator;
  TEfl_Divisor_Interpolator = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_DIVISOR_INTERPOLATOR_CLASS: PEfl_Class;

function efl_divisor_interpolator_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_divisor_interpolator_divisor_set(obj: PEo; divisor: double); cdecl; external libecore;
function efl_divisor_interpolator_divisor_get(obj: PEo): double; cdecl; external libecore;
procedure efl_divisor_interpolator_power_set(obj: PEo; power: longint); cdecl; external libecore;
function efl_divisor_interpolator_power_get(obj: PEo): longint; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 17:02:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_DIVISOR_INTERPOLATOR_CLASS: PEfl_Class;
begin
  EFL_DIVISOR_INTERPOLATOR_CLASS := efl_divisor_interpolator_class_get;
end;
{$endif}


{$ENDIF read_implementation}

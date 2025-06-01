{$IFDEF read_interface}


type
  PEfl_Access_Value = ^TEfl_Access_Value;
  TEfl_Access_Value = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_VALUE_INTERFACE: PEfl_Class;

function efl_access_value_interface_get: PEfl_Class; cdecl; external libelementary;
function efl_access_value_and_text_set(obj: PEo; value: double; text: pchar): TEina_Bool; cdecl; external libelementary;
procedure efl_access_value_and_text_get(obj: PEo; value: Pdouble; text: PPchar); cdecl; external libelementary;
procedure efl_access_value_range_get(obj: PEo; lower_limit: Pdouble; upper_limit: Pdouble; description: PPchar); cdecl; external libelementary;
function efl_access_value_increment_get(obj: PEo): double; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 13:24:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_VALUE_INTERFACE: PEfl_Class;
begin
  EFL_ACCESS_VALUE_INTERFACE := efl_access_value_interface_get;
end;
{$endif}


{$ENDIF read_implementation}

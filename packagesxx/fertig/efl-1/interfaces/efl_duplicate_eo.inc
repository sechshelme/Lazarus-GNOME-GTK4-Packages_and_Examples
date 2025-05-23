{$IFDEF read_interface}


type
  PEfl_Duplicate = ^TEfl_Duplicate;
  TEfl_Duplicate = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_DUPLICATE_INTERFACE: PEfl_Class;

function efl_duplicate_interface_get: PEfl_Class; cdecl; external libefl;
function efl_duplicate(obj: PEo): PEfl_Duplicate; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 14:59:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_DUPLICATE_INTERFACE: PEfl_Class;
begin
  EFL_DUPLICATE_INTERFACE := efl_duplicate_interface_get;
end;
{$endif}


{$ENDIF read_implementation}

{$IFDEF read_interface}


type
  PEfl_Part = ^TEfl_Part;
  TEfl_Part = TEo;

function EFL_PART_INTERFACE: PEfl_Class;

function efl_part_interface_get: PEfl_Class; cdecl; external libefl;
function efl_part_get(obj: PEo; name: pchar): PEfl_Object; cdecl; external libefl;

// === Konventiert am: 20-5-25 14:43:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_PART_INTERFACE: PEfl_Class;
begin
  EFL_PART_INTERFACE := efl_part_interface_get;
end;


{$ENDIF read_implementation}

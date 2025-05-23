{$IFDEF read_interface}


type
  PEfl_Text = ^TEfl_Text;
  TEfl_Text = TEo;

function EFL_TEXT_INTERFACE: PEfl_Class;

function efl_text_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_text_set(obj: PEo; text: pchar); cdecl; external libefl;
function efl_text_get(obj: PEo): pchar; cdecl; external libefl;

// === Konventiert am: 20-5-25 15:00:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_TEXT_INTERFACE: PEfl_Class;
begin
  EFL_TEXT_INTERFACE := efl_text_interface_get;
end;


{$ENDIF read_implementation}

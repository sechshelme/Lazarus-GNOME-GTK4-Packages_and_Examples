{$IFDEF read_interface}


function IBUS_ERROR: TGQuark;

function ibus_error_quark: TGQuark; cdecl; external libibus;

// === Konventiert am: 26-7-25 16:17:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function IBUS_ERROR: TGQuark;
begin
  IBUS_ERROR := ibus_error_quark;
end;


{$ENDIF read_implementation}

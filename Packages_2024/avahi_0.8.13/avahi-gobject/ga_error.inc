{$IFDEF read_interface}



function ga_error_quark: TGQuark; cdecl; external libavahi_gobject;

function GA_ERROR: TGQuark;


// === Konventiert am: 25-12-25 15:56:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GA_ERROR: TGQuark;
begin
  GA_ERROR := ga_error_quark;
end;


{$ENDIF read_implementation}

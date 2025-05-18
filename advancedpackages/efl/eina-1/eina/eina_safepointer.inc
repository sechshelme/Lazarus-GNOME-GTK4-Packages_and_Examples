{$IFDEF read_interface}


type
  TEina_Safepointer = record
  end;
  PEina_Safepointer = ^TEina_Safepointer;

function eina_safepointer_register(target: pointer): PEina_Safepointer; cdecl; external libeina;
procedure eina_safepointer_unregister(safe: PEina_Safepointer); cdecl; external libeina;

// === Konventiert am: 17-5-25 16:24:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

{$IFDEF read_interface}


type
  TEfl_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
    flavor: pchar;
    build_id: pchar;
  end;
  PEfl_Version = ^TEfl_Version;

  // === Konventiert am: 20-5-25 15:00:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

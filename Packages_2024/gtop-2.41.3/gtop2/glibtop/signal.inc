{$IFDEF read_interface}


type
  Tglibtop_signame = record
    number: longint;
    name: pchar;
    _label: pchar;
  end;
  Pglibtop_signame = ^Tglibtop_signame;

var
  glibtop_sys_siglist: Pglibtop_signame; cvar;external libgtop2;

  // === Konventiert am: 26-10-25 12:04:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

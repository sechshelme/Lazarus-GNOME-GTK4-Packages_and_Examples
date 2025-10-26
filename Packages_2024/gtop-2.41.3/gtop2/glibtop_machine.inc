{$IFDEF read_interface}


type
  Tglibtop_machine = record
      uid : Tuid_t;
      euid : Tuid_t;
      gid : Tgid_t;
      egid : Tgid_t;
    end;
  Pglibtop_machine = ^Tglibtop_machine;


// === Konventiert am: 23-10-25 19:35:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

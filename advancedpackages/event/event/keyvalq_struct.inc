{$IFDEF read_interface}


type
  Pevkeyval = ^Tevkeyval;

  Tevkeyval = record
    next: record
      tqe_next: Pevkeyval;
      tqe_prev: ^Pevkeyval;
      end;
    key: pchar;
    value: pchar;
  end;

  Pevkeyvalq = ^Tevkeyvalq;

  Tevkeyvalq = record
    tqh_first: Pevkeyval;
    tqh_last: ^Pevkeyval;
  end;


  // === Konventiert am: 26-8-25 19:37:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

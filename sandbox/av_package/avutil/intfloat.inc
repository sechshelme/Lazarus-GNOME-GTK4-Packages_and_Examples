{$IFDEF read_interface}


type
  Tav_intfloat32 = record
    case longint of
      0: (i: Tuint32_t);
      1: (f: single);
  end;
  Pav_intfloat32 = ^Tav_intfloat32;

  Tav_intfloat64 = record
    case longint of
      0: (i: Tuint64_t);
      1: (f: double);
  end;
  Pav_intfloat64 = ^Tav_intfloat64;

  // === Konventiert am: 14-12-25 17:31:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

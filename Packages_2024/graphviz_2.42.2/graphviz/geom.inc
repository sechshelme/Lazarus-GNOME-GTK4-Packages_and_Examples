{$IFDEF read_interface}


type
  Tpoint = record
    x: longint;
    y: longint;
  end;
  Ppoint = ^Tpoint;

  Tpointf_s = record
    x: double;
    y: double;
  end;
  Ppointf_s = ^Tpointf_s;

  Tpointf = Tpointf_s;
  Ppointf = ^Tpointf;

  Tbox = record
    LL: Tpoint;
    UR: Tpoint;
  end;
  Pbox = ^Tbox;

  Tboxf = record
    LL: Tpointf;
    UR: Tpointf;
  end;
  Pboxf = ^Tboxf;

const
  MILLIPOINT = 0.001;
  MICROPOINT = 0.000001;

  // === Konventiert am: 3-12-25 15:08:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

{$IFDEF read_interface}


type
  TTCOD_mouse_t = record
    x: longint;
    y: longint;
    dx: longint;
    dy: longint;
    cx: longint;
    cy: longint;
    dcx: longint;
    dcy: longint;
    lbutton: Tbool;
    rbutton: Tbool;
    mbutton: Tbool;
    lbutton_pressed: Tbool;
    rbutton_pressed: Tbool;
    mbutton_pressed: Tbool;
    wheel_up: Tbool;
    wheel_down: Tbool;
  end;
  PTCOD_mouse_t = ^TTCOD_mouse_t;

  // === Konventiert am: 10-9-25 15:53:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

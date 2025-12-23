{$IFDEF read_interface}


type
  TAVMediaCodecDeviceContext = record
    surface: pointer;
    native_window: pointer;
    create_window: longint;
  end;
  PAVMediaCodecDeviceContext = ^TAVMediaCodecDeviceContext;

  // === Konventiert am: 14-12-25 17:15:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

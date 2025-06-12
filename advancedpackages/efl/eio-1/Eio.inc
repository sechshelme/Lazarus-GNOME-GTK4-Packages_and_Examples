{$IFDEF read_interface}


type
  TEio_File = record
  end;
  PEio_File = ^TEio_File;

  TEio_Filter_Direct_Cb = function(data: pointer; handler: PEio_File; info: PEina_File_Direct_Info): TEina_Bool; cdecl;

procedure eio_monitoring_interval_set(interval: double); cdecl; external libeio;

const
  EIO_VERSION_MAJOR = EFL_VERSION_MAJOR;
  EIO_VERSION_MINOR = EFL_VERSION_MINOR;

  // === Konventiert am: 12-6-25 16:09:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

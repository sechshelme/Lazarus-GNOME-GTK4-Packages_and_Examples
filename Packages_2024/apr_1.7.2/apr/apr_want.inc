{$IFDEF read_interface}


type
  Piovec = ^Tiovec;
  Tiovec = record
    iov_base: pointer;
    iov_len: SizeUInt;
  end;


  // === Konventiert am: 10-9-26 16:58:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

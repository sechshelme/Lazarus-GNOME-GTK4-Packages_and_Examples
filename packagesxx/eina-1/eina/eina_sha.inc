{$IFDEF read_interface}


type
  TdstArr = array[0..19] of byte;

procedure eina_sha1(data: pbyte; size: longint; dst: TdstArr); cdecl; external libeina;

// === Konventiert am: 17-5-25 16:32:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

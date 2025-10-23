{$IFDEF read_interface}


type
  TsfJoystickIdentification = record
    name: pchar;
    vendorId: dword;
    productId: dword;
  end;
  PsfJoystickIdentification = ^TsfJoystickIdentification;

  // === Konventiert am: 24-9-25 16:58:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

unit JoystickIdentification;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfJoystickIdentification = record
    name: pchar;
    vendorId: dword;
    productId: dword;
  end;
  PsfJoystickIdentification = ^TsfJoystickIdentification;

  // === Konventiert am: 24-9-25 16:58:17 ===


implementation



end.

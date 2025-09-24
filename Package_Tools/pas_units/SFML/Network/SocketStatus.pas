unit SocketStatus;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfSocketStatus = ^TsfSocketStatus;
  TsfSocketStatus = longint;

const
  sfSocketDone = 0;
  sfSocketNotReady = 1;
  sfSocketPartial = 2;
  sfSocketDisconnected = 3;
  sfSocketError = 4;

  // === Konventiert am: 24-9-25 16:56:32 ===


implementation



end.

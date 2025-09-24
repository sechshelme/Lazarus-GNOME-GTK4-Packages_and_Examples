unit NetWork_Types;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfFtpDirectoryResponse = type Pointer;
  PsfFtpListingResponse = type Pointer;
  PsfFtpResponse = type Pointer;
  PsfFtp = type Pointer;
  PsfHttpRequest = type Pointer;
  PsfHttpResponse = type Pointer;
  PsfHttp = type Pointer;
  PsfPacket = type Pointer;
  PsfSocketSelector = type Pointer;
  PsfTcpListener = type Pointer;
  PsfTcpSocket = type Pointer;
  PPsfTcpSocket = ^PsfTcpSocket;
  PsfUdpSocket = type Pointer;


  // === Konventiert am: 24-9-25 16:56:40 ===


implementation



end.

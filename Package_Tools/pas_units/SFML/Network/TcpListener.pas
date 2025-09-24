unit TcpListener;

interface

uses
  fp_sfml, Config, Network_Types, IpAddress, SocketStatus;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function sfTcpListener_create: PsfTcpListener; cdecl; external libsfml_network;
procedure sfTcpListener_destroy(listener: PsfTcpListener); cdecl; external libsfml_network;
procedure sfTcpListener_setBlocking(listener: PsfTcpListener; blocking: TsfBool); cdecl; external libsfml_network;
function sfTcpListener_isBlocking(listener: PsfTcpListener): TsfBool; cdecl; external libsfml_network;
function sfTcpListener_getLocalPort(listener: PsfTcpListener): word; cdecl; external libsfml_network;
function sfTcpListener_listen(listener: PsfTcpListener; port: word; address: TsfIpAddress): TsfSocketStatus; cdecl; external libsfml_network;
function sfTcpListener_accept(listener: PsfTcpListener; connected: PPsfTcpSocket): TsfSocketStatus; cdecl; external libsfml_network;

// === Konventiert am: 24-9-25 16:56:29 ===


implementation



end.

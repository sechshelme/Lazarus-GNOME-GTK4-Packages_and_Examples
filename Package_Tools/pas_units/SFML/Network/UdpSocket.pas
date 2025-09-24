unit UdpSocket;

interface

uses
  fp_sfml, Config, NetWork_Types, IpAddress, SocketStatus;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function sfUdpSocket_create: PsfUdpSocket; cdecl; external libsfml_network;
procedure sfUdpSocket_destroy(socket: PsfUdpSocket); cdecl; external libsfml_network;
procedure sfUdpSocket_setBlocking(socket: PsfUdpSocket; blocking: TsfBool); cdecl; external libsfml_network;
function sfUdpSocket_isBlocking(socket: PsfUdpSocket): TsfBool; cdecl; external libsfml_network;
function sfUdpSocket_getLocalPort(socket: PsfUdpSocket): word; cdecl; external libsfml_network;
function sfUdpSocket_bind(socket: PsfUdpSocket; port: word; address: TsfIpAddress): TsfSocketStatus; cdecl; external libsfml_network;
procedure sfUdpSocket_unbind(socket: PsfUdpSocket); cdecl; external libsfml_network;
function sfUdpSocket_send(socket: PsfUdpSocket; data: pointer; size: Tsize_t; remoteAddress: TsfIpAddress; remotePort: word): TsfSocketStatus; cdecl; external libsfml_network;
function sfUdpSocket_receive(socket: PsfUdpSocket; data: pointer; size: Tsize_t; received: Psize_t; remoteAddress: PsfIpAddress; remotePort: Pword): TsfSocketStatus; cdecl; external libsfml_network;
function sfUdpSocket_sendPacket(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: TsfIpAddress; remotePort: word): TsfSocketStatus; cdecl; external libsfml_network;
function sfUdpSocket_receivePacket(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: PsfIpAddress; remotePort: Pword): TsfSocketStatus; cdecl; external libsfml_network;
function sfUdpSocket_maxDatagramSize: dword; cdecl; external libsfml_network;

// === Konventiert am: 24-9-25 16:56:20 ===


implementation



end.

{$IFDEF read_interface}



function sfTcpSocket_create: PsfTcpSocket; cdecl; external libcsfml_network;
procedure sfTcpSocket_destroy(socket: PsfTcpSocket); cdecl; external libcsfml_network;
procedure sfTcpSocket_setBlocking(socket: PsfTcpSocket; blocking: TsfBool); cdecl; external libcsfml_network;
function sfTcpSocket_isBlocking(socket: PsfTcpSocket): TsfBool; cdecl; external libcsfml_network;
function sfTcpSocket_getLocalPort(socket: PsfTcpSocket): word; cdecl; external libcsfml_network;
function sfTcpSocket_getRemoteAddress(socket: PsfTcpSocket): TsfIpAddress; cdecl; external libcsfml_network;
function sfTcpSocket_getRemotePort(socket: PsfTcpSocket): word; cdecl; external libcsfml_network;
function sfTcpSocket_connect(socket: PsfTcpSocket; remoteAddress: TsfIpAddress; remotePort: word; timeout: TsfTime): TsfSocketStatus; cdecl; external libcsfml_network;
procedure sfTcpSocket_disconnect(socket: PsfTcpSocket); cdecl; external libcsfml_network;
function sfTcpSocket_send(socket: PsfTcpSocket; data: pointer; size: Tsize_t): TsfSocketStatus; cdecl; external libcsfml_network;
function sfTcpSocket_sendPartial(socket: PsfTcpSocket; data: pointer; size: Tsize_t; sent: Psize_t): TsfSocketStatus; cdecl; external libcsfml_network;
function sfTcpSocket_receive(socket: PsfTcpSocket; data: pointer; size: Tsize_t; received: Psize_t): TsfSocketStatus; cdecl; external libcsfml_network;
function sfTcpSocket_sendPacket(socket: PsfTcpSocket; packet: PsfPacket): TsfSocketStatus; cdecl; external libcsfml_network;
function sfTcpSocket_receivePacket(socket: PsfTcpSocket; packet: PsfPacket): TsfSocketStatus; cdecl; external libcsfml_network;

// === Konventiert am: 24-9-25 16:56:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

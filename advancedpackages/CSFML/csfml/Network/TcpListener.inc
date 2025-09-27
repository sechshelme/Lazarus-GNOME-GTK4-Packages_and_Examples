{$IFDEF read_interface}



function sfTcpListener_create: PsfTcpListener; cdecl; external libcsfml_network;
procedure sfTcpListener_destroy(listener: PsfTcpListener); cdecl; external libcsfml_network;
procedure sfTcpListener_setBlocking(listener: PsfTcpListener; blocking: TsfBool); cdecl; external libcsfml_network;
function sfTcpListener_isBlocking(listener: PsfTcpListener): TsfBool; cdecl; external libcsfml_network;
function sfTcpListener_getLocalPort(listener: PsfTcpListener): word; cdecl; external libcsfml_network;
function sfTcpListener_listen(listener: PsfTcpListener; port: word; address: TsfIpAddress): TsfSocketStatus; cdecl; external libcsfml_network;
function sfTcpListener_accept(listener: PsfTcpListener; connected: PPsfTcpSocket): TsfSocketStatus; cdecl; external libcsfml_network;

// === Konventiert am: 24-9-25 16:56:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

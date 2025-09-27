{$IFDEF read_interface}



function sfSocketSelector_create: PsfSocketSelector; cdecl; external libcsfml_network;
function sfSocketSelector_copy(selector: PsfSocketSelector): PsfSocketSelector; cdecl; external libcsfml_network;
procedure sfSocketSelector_destroy(selector: PsfSocketSelector); cdecl; external libcsfml_network;
procedure sfSocketSelector_addTcpListener(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl; external libcsfml_network;
procedure sfSocketSelector_addTcpSocket(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl; external libcsfml_network;
procedure sfSocketSelector_addUdpSocket(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl; external libcsfml_network;
procedure sfSocketSelector_removeTcpListener(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl; external libcsfml_network;
procedure sfSocketSelector_removeTcpSocket(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl; external libcsfml_network;
procedure sfSocketSelector_removeUdpSocket(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl; external libcsfml_network;
procedure sfSocketSelector_clear(selector: PsfSocketSelector); cdecl; external libcsfml_network;
function sfSocketSelector_wait(selector: PsfSocketSelector; timeout: TsfTime): TsfBool; cdecl; external libcsfml_network;
function sfSocketSelector_isTcpListenerReady(selector: PsfSocketSelector; socket: PsfTcpListener): TsfBool; cdecl; external libcsfml_network;
function sfSocketSelector_isTcpSocketReady(selector: PsfSocketSelector; socket: PsfTcpSocket): TsfBool; cdecl; external libcsfml_network;
function sfSocketSelector_isUdpSocketReady(selector: PsfSocketSelector; socket: PsfUdpSocket): TsfBool; cdecl; external libcsfml_network;

// === Konventiert am: 24-9-25 16:56:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

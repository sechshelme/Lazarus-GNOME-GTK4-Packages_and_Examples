
{$IFDEF read_interface}


procedure BufferStorage(target: TGLenum; para2: TGLsizeiptr; Data: pointer; flags: TGLbitfield); cdecl; external libgstgl;
procedure FlushMappedBufferRange(target: TGLenum; offset: TGLintptr; length: TGLsizeiptr); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:17:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}


{$IFDEF read_interface}


function FenceSync(condition: TGLenum; flags: TGLbitfield): TGLsync; cdecl; external libgstgl;
function IsSync(sync: TGLsync): TGLboolean; cdecl; external libgstgl;
procedure DeleteSync(sync: TGLsync); cdecl; external libgstgl;
function ClientWaitSync(sync: TGLsync; flags: TGLbitfield; timeout: TGLuint64): TGLenum; cdecl; external libgstgl;
procedure WaitSync(sync: TGLsync; flags: TGLbitfield; timeout: TGLuint64); cdecl; external libgstgl;
procedure GetSynciv(sync: TGLsync; Name: TGLenum; buf_size: TGLsizei; length: PGLsizei; values: PGLint); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:18:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

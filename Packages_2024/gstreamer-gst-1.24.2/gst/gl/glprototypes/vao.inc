
{$IFDEF read_interface}


procedure GenVertexArrays(n: TGLsizei; arrays: PGLuint); cdecl; external libgstgl;
procedure DeleteVertexArrays(n: TGLsizei; arrays: PGLuint); cdecl; external libgstgl;
procedure BindVertexArray(arr: TGLuint); cdecl; external libgstgl;
function IsVertexArray(arr: TGLuint): TGLboolean; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:18:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

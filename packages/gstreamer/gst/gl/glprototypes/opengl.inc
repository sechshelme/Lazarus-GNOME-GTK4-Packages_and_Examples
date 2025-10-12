
{$IFDEF read_interface}


procedure GetTexLevelParameteriv(target: TGLenum; level: TGLint; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure GetTexImage(target: TGLenum; level: TGLint; format: TGLenum; _type: TGLenum; pixels: PGLvoid); cdecl; external libgstgl;
procedure DepthRange(near_val: double; far_val: double); cdecl; external libgstgl;
procedure DrawBuffer(mode: TGLenum); cdecl; external libgstgl;
procedure ClearDepth(depth: double); cdecl; external libgstgl;
procedure ClipPlane(plane: TGLenum; equation: Pdouble); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:18:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

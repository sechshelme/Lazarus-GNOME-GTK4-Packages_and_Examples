
{$IFDEF read_interface}

procedure DepthRangef(near_val: TGLfloat; far_val: TGLfloat); cdecl; external libgstgl;
procedure ClearDepthf(depth: TGLclampf); cdecl; external libgstgl;
procedure ClipPlanef(plane: TGLenum; equation: PGLfloat); cdecl; external libgstgl;
procedure ReleaseShaderCompiler; cdecl; external libgstgl;
procedure GetShaderPrecisionFormat(shadertype: TGLenum; precisiontype: TGLenum; range: PGLint; precision: PGLint); cdecl; external libgstgl;
procedure ShaderBinary(n: TGLsizei; shaders: PGLuint; binaryformat: TGLenum; binary: PGLvoid; length: TGLsizei); cdecl; external libgstgl;
procedure RenderbufferStorageMultisampleIMG(target: TGLenum; samples: TGLsizei; internal_format: TGLenum; Width: TGLsizei; Height: TGLsizei); cdecl; external libgstgl;
procedure FramebufferTexture2DMultisampleIMG(target: TGLenum; attachment: TGLenum; textarget: TGLenum; texture: TGLuint; level: TGLint;
  samples: TGLsizei); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:18:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

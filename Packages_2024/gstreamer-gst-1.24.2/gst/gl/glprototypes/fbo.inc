
{$IFDEF read_interface}

procedure GenRenderbuffers(n: TGLsizei; renderbuffers: PGLuint); cdecl; external libgstgl;
procedure DeleteRenderbuffers(n: TGLsizei; renderbuffers: PGLuint); cdecl; external libgstgl;
procedure BindRenderbuffer(target: TGLenum; renderbuffer: TGLuint); cdecl; external libgstgl;
procedure RenderbufferStorage(target: TGLenum; internalformat: TGLenum; Width: TGLsizei; Height: TGLsizei); cdecl; external libgstgl;
procedure GenFramebuffers(n: TGLsizei; framebuffers: PGLuint); cdecl; external libgstgl;
procedure BindFramebuffer(target: TGLenum; framebuffer: TGLuint); cdecl; external libgstgl;
procedure FramebufferTexture2D(target: TGLenum; attachment: TGLenum; textarget: TGLenum; texture: TGLuint; level: TGLint); cdecl; external libgstgl;
procedure FramebufferRenderbuffer(target: TGLenum; attachment: TGLenum; renderbuffertarget: TGLenum; renderbuffer: TGLuint); cdecl; external libgstgl;
function IsRenderbuffer(renderbuffer: TGLuint): TGLboolean; cdecl; external libgstgl;
function CheckFramebufferStatus(target: TGLenum): TGLenum; cdecl; external libgstgl;
procedure DeleteFramebuffers(n: TGLsizei; framebuffers: PGLuint); cdecl; external libgstgl;
procedure GenerateMipmap(target: TGLenum); cdecl; external libgstgl;
procedure GetFramebufferAttachmentParameteriv(target: TGLenum; attachment: TGLenum; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure GetRenderbufferParameteriv(target: TGLenum; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
function IsFramebuffer(framebuffer: TGLuint): TGLboolean; cdecl; external libgstgl;
procedure BlitFramebuffer(srcX0: TGLint; srcY0: TGLint; srcX1: TGLint; srcY1: TGLint; dstX0: TGLint;
  dstY0: TGLint; dstX1: TGLint; dstY1: TGLint; mask: TGLbitfield; filter: TGLenum); cdecl; external libgstgl;
procedure DiscardFramebuffer(target: TGLenum; numAttachments: TGLsizei; attachments: PGLenum); cdecl; external libgstgl;
procedure ReadBuffer(mode: TGLenum); cdecl; external libgstgl;
procedure DrawBuffers(n: TGLsizei; bufs: PGLenum); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:17:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

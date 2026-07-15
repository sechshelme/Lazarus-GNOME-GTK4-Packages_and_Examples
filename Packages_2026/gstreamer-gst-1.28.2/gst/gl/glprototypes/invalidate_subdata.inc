

{$IFDEF read_struct}
procedure InvalidateFramebuffer(target:TGLenum; numAttachments:TGLsizei; attachments:PGLenum);cdecl;external libgstgl;
procedure InvalidateSubFramebuffer(target:TGLenum; numAttachments:TGLsizei; attachments:PGLenum; x:TGLint; y:TGLint; 
            width:TGLsizei; height:TGLsizei);cdecl;external libgstgl;
procedure InvalidateTexSubImage(texture:TGLuint; level:TGLint; xoffset:TGLint; yoffset:TGLint; zoffset:TGLint; 
            width:TGLsizei; height:TGLsizei; depth:TGLsizei);cdecl;external libgstgl;
procedure InvalidateTexImage(texture:TGLuint; level:TGLint);cdecl;external libgstgl;
procedure InvalidateBufferSubData(buffer:TGLuint; offset:TGLintptr; length:TGLsizeiptr);cdecl;external libgstgl;
procedure InvalidateBufferData(buffer:TGLuint);cdecl;external libgstgl;
{$ENDIF read_struct}

// === Konventiert am: 15-7-26 11:02:07 ===

{$IFDEF read_implementation}



{$ENDIF read_implementation}

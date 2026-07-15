
{$IFDEF read_interface}


procedure ClientActiveTexture(texture:TGLenum);cdecl;external libgstgl;
procedure AlphaFunc(func:TGLenum; ref:TGLclampf);cdecl;external libgstgl;
procedure Fogf(pname:TGLenum; param:TGLfloat);cdecl;external libgstgl;
procedure Fogfv(pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure LoadMatrixf(m:PGLfloat);cdecl;external libgstgl;
procedure Materialfv(face:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure PointSize(size:TGLfloat);cdecl;external libgstgl;
procedure TexEnvfv(target:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure Color4ub(red:TGLubyte; green:TGLubyte; blue:TGLubyte; alpha:TGLubyte);cdecl;external libgstgl;
procedure ColorPointer(size:TGLint; _type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external libgstgl;
procedure DisableClientState(arr:TGLenum);cdecl;external libgstgl;
procedure EnableClientState(arr:TGLenum);cdecl;external libgstgl;
procedure LoadIdentity;cdecl;external libgstgl;
procedure MatrixMode(mode:TGLenum);cdecl;external libgstgl;
procedure NormalPointer(_type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external libgstgl;
procedure TexCoordPointer(size:TGLint; _type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external libgstgl;
procedure TexEnvi(target:TGLenum; pname:TGLenum; param:TGLint);cdecl;external libgstgl;
procedure VertexPointer(size:TGLint; _type:TGLenum; stride:TGLsizei; pointer:PGLvoid);cdecl;external libgstgl;
procedure PushMatrix;cdecl;external libgstgl;
procedure PopMatrix;cdecl;external libgstgl;
procedure PushAttrib(mask:TGLbitfield);cdecl;external libgstgl;
procedure PopAttrib;cdecl;external libgstgl;
procedure TexImage1D(target:TGLenum; level:TGLint; internalFormat:TGLint; width:TGLsizei; border:TGLint; 
            format:TGLenum; _type:TGLenum; data:PGLvoid);cdecl;external libgstgl;
procedure Rotatef(angle:TGLfloat; x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external libgstgl;
procedure Translatef(x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external libgstgl;
procedure Scalef(x:TGLfloat; y:TGLfloat; z:TGLfloat);cdecl;external libgstgl;
procedure Lightfv(light:TGLenum; pname:TGLenum; params:PGLfloat);cdecl;external libgstgl;
procedure ColorMaterial(face:TGLenum; pname:TGLenum);cdecl;external libgstgl;
procedure ShadeModel(value:TGLenum);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:18:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

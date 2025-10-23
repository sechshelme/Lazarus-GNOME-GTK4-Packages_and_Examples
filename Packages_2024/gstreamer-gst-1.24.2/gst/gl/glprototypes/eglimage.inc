
{$IFDEF read_interface}


procedure EGLImageTargetTexture2D(target: TGLenum; image: TGLeglImageOES); cdecl; external libgstgl;
procedure EGLImageTargetRenderbufferStorage(target: TGLenum; image: TGLeglImageOES); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:17:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

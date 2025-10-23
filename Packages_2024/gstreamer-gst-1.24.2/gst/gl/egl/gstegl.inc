
{$IFDEF read_interface}

const
  __VCCOREVER__ = $04000000;

const
  EGL_EGLEXT_PROTOTYPES = 1;

type
  PEGLAttrib = ^TEGLAttrib;
  TEGLAttrib = Tgintptr;

type
  PEGLuint64KHR = ^TEGLuint64KHR;
  TEGLuint64KHR = Tguint64;

function gst_egl_get_error_string(err: TEGLint): Pgchar; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 08:59:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

unit gstegl;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  __VCCOREVER__ = $04000000;
  EGL_EGLEXT_PROTOTYPES = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PEGLAttrib = ^TEGLAttrib;
  TEGLAttrib = Tgintptr;
type
  PEGLuint64KHR = ^TEGLuint64KHR;
  TEGLuint64KHR = Tguint64;
  {$ENDIF read_function}

{$IFDEF read_function}
function gst_egl_get_error_string(err: TEGLint): Pgchar; cdecl; external libgstgl;
{$ENDIF read_function}

// === Konventiert am: 14-7-26 19:32:24 ===


implementation



end.

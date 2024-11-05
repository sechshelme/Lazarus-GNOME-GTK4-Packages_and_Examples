/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstGLAPI = ^TGstGLAPI;
  TGstGLAPI = longint;

const
  extern_NONE = 0;
  extern_OPENGL = 1 shl 0;
  extern_OPENGL3 = 1 shl 1;
  extern_GLES1 = 1 shl 15;
  extern_GLES2 = 1 shl 16;
  extern_ANY = G_MAXUINT32;

const
  extern_OPENGL_NAME = 'opengl';
  extern_OPENGL3_NAME = 'opengl3';
  extern_GLES1_NAME = 'gles1';
  extern_GLES2_NAME = 'gles2';

type
  PGstGLPlatform = ^TGstGLPlatform;
  TGstGLPlatform = longint;

const
  GST_GL_PLATFORM_NONE = 0;
  GST_GL_PLATFORM_EGL = 1 shl 0;
  GST_GL_PLATFORM_GLX = 1 shl 1;
  GST_GL_PLATFORM_WGL = 1 shl 2;
  GST_GL_PLATFORM_CGL = 1 shl 3;
  GST_GL_PLATFORM_EAGL = 1 shl 4;
  GST_GL_PLATFORM_ANY = G_MAXUINT32;

function gst_gl_api_to_string(api: TGstGLAPI): Pgchar; cdecl; external libgstgl;
function gst_gl_api_from_string(api_s: Pgchar): TGstGLAPI; cdecl; external libgstgl;
function gst_gl_platform_to_string(platform: TGstGLPlatform): Pgchar; cdecl; external libgstgl;
function gst_gl_platform_from_string(platform_s: Pgchar): TGstGLPlatform; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 09:12:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

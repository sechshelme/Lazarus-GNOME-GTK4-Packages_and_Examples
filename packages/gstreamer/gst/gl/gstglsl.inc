/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_glsl_error_quark: TGQuark; cdecl; external libgstgl;

type
  PGstGLSLError = ^TGstGLSLError;
  TGstGLSLError = longint;

const
  GST_GLSL_ERROR_COMPILE = 0;
  GST_GLSL_ERROR_LINK = 1;
  GST_GLSL_ERROR_PROGRAM = 2;

type
  PGstGLSLVersion = ^TGstGLSLVersion;
  TGstGLSLVersion = longint;

const
  GST_GLSL_VERSION_NONE = 0;
  GST_GLSL_VERSION_100 = 100;
  GST_GLSL_VERSION_110 = 110;
  GST_GLSL_VERSION_120 = 120;
  GST_GLSL_VERSION_130 = 130;
  GST_GLSL_VERSION_140 = 140;
  GST_GLSL_VERSION_150 = 150;
  GST_GLSL_VERSION_300 = 300;
  GST_GLSL_VERSION_310 = 310;
  GST_GLSL_VERSION_320 = 320;
  GST_GLSL_VERSION_330 = 330;
  GST_GLSL_VERSION_400 = 400;
  GST_GLSL_VERSION_410 = 410;
  GST_GLSL_VERSION_420 = 420;
  GST_GLSL_VERSION_430 = 430;
  GST_GLSL_VERSION_440 = 440;
  GST_GLSL_VERSION_450 = 450;

type
  PGstGLSLProfile = ^TGstGLSLProfile;
  TGstGLSLProfile = longint;

const
  GST_GLSL_PROFILE_NONE = 0;
  GST_GLSL_PROFILE_ES = 1 shl 0;
  GST_GLSL_PROFILE_CORE = 1 shl 1;
  GST_GLSL_PROFILE_COMPATIBILITY = 1 shl 2;
  GST_GLSL_PROFILE_ANY = Tgint($ffffffff);

function gst_glsl_version_from_string(_string: Pgchar): TGstGLSLVersion; cdecl; external libgstgl;
function gst_glsl_version_to_string(version: TGstGLSLVersion): Pgchar; cdecl; external libgstgl;
function gst_glsl_profile_from_string(_string: Pgchar): TGstGLSLProfile; cdecl; external libgstgl;
function gst_glsl_profile_to_string(profile: TGstGLSLProfile): Pgchar; cdecl; external libgstgl;
function gst_glsl_version_profile_to_string(version: TGstGLSLVersion; profile: TGstGLSLProfile): Pgchar; cdecl; external libgstgl;
function gst_glsl_version_profile_from_string(_string: Pgchar; version_ret: PGstGLSLVersion; profile_ret: PGstGLSLProfile): Tgboolean; cdecl; external libgstgl;
function gst_glsl_string_get_version_profile(s: Pgchar; version: PGstGLSLVersion; profile: PGstGLSLProfile): Tgboolean; cdecl; external libgstgl;
function gst_gl_version_to_glsl_version(gl_api: TGstGLAPI; maj: Tgint; min: Tgint): TGstGLSLVersion; cdecl; external libgstgl;
function gst_gl_context_supports_glsl_profile_version(context: PGstGLContext; version: TGstGLSLVersion; profile: TGstGLSLProfile): Tgboolean; cdecl; external libgstgl;
function gst_gl_context_supports_precision(context: PGstGLContext; version: TGstGLSLVersion; profile: TGstGLSLProfile): Tgboolean; cdecl; external libgstgl;
function gst_gl_context_supports_precision_highp(context: PGstGLContext; version: TGstGLSLVersion; profile: TGstGLSLProfile): Tgboolean; cdecl; external libgstgl;

function GST_GLSL_ERROR: TGQuark;

// === Konventiert am: 9-10-24 12:35:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_GLSL_ERROR: TGQuark;
begin
  GST_GLSL_ERROR := gst_glsl_error_quark;
end;


{$ENDIF read_implementation}

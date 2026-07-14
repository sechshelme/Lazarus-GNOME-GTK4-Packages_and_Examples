unit gstglshaderstrings;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstglsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_function}
var
  gst_gl_shader_string_fragment_highp_precision: Pgchar; cvar;external libgstgl;
  gst_gl_shader_string_fragment_mediump_precision: Pgchar; cvar;external libgstgl;
  gst_gl_shader_string_vertex_default: Pgchar; cvar;external libgstgl;
  gst_gl_shader_string_vertex_mat4_texture_transform: Pgchar; cvar;external libgstgl;
  gst_gl_shader_string_vertex_mat4_vertex_transform: Pgchar; cvar;external libgstgl;

function gst_gl_shader_string_get_highest_precision(context: PGstGLContext; version: TGstGLSLVersion; profile: TGstGLSLProfile): Pgchar; cdecl; external libgstgl;
function gst_gl_shader_string_fragment_get_default(context: PGstGLContext; version: TGstGLSLVersion; profile: TGstGLSLProfile): Pgchar; cdecl; external libgstgl;
function gst_gl_shader_string_fragment_external_oes_get_default(context: PGstGLContext; version: TGstGLSLVersion; profile: TGstGLSLProfile): Pgchar; cdecl; external libgstgl;
{$ENDIF read_function}

// === Konventiert am: 14-7-26 13:06:11 ===


implementation



end.

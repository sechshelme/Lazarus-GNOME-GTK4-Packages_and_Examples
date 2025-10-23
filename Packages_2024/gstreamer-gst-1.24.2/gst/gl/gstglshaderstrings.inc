
{$IFDEF read_interface}

var
  gst_gl_shader_string_fragment_highp_precision: Pgchar; cvar;external libgstgl;
  gst_gl_shader_string_fragment_mediump_precision: Pgchar; cvar;external libgstgl;
  gst_gl_shader_string_vertex_default: Pgchar; cvar;external libgstgl;
  gst_gl_shader_string_fragment_default: Pgchar; cvar;public;
  gst_gl_shader_string_vertex_mat4_texture_transform: Pgchar; cvar;external libgstgl;
  gst_gl_shader_string_vertex_mat4_vertex_transform: Pgchar; cvar;external libgstgl;
  gst_gl_shader_string_fragment_external_oes_default: Pgchar; cvar;public;

function gst_gl_shader_string_get_highest_precision(context: PGstGLContext; version: TGstGLSLVersion; profile: TGstGLSLProfile): Pgchar; cdecl; external libgstgl;
function gst_gl_shader_string_fragment_get_default(context: PGstGLContext; version: TGstGLSLVersion; profile: TGstGLSLProfile): Pgchar; cdecl; external libgstgl; deprecated 'GST_GL_DEPRECATED_FOR(gst_gl_shader_string_fragment_get_default)';
function gst_gl_shader_string_fragment_external_oes_get_default(context: PGstGLContext; version: TGstGLSLVersion; profile: TGstGLSLProfile): Pgchar; cdecl; external libgstgl; deprecated 'GST_GL_DEPRECATED_FOR(gst_gl_shader_string_fragment_external_oes_get_default)';

// === Konventiert am: 9-10-24 14:58:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

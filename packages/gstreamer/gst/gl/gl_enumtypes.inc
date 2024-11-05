/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_gl_texture_target_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_TEXTURE_TARGET: TGType;

function gst_gl_api_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_API: TGType;

function gst_gl_platform_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_PLATFORM: TGType;

function gst_gl_base_memory_error_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_BASE_MEMORY_ERROR: TGType;

function gst_gl_base_memory_transfer_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_BASE_MEMORY_TRANSFER: TGType;

function gst_gl_context_error_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_CONTEXT_ERROR: TGType;

function gst_gl_config_caveat_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_CONFIG_CAVEAT: TGType;

function gst_gl_config_surface_type_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_CONFIG_SURFACE_TYPE: TGType;

function gst_gl_display_type_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_DISPLAY_TYPE: TGType;

function gst_gl_format_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_FORMAT: TGType;

function gst_gl_query_type_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_QUERY_TYPE: TGType;

function gst_glsl_error_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GLSL_ERROR: TGType;

function gst_glsl_version_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GLSL_VERSION: TGType;

function gst_glsl_profile_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GLSL_PROFILE: TGType;

function gst_gl_upload_return_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_UPLOAD_RETURN: TGType;

function gst_gl_stereo_downmix_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_STEREO_DOWNMIX: TGType;

function gst_gl_window_error_get_type: TGType; cdecl; external libgstgl;
function GST_TYPE_GL_WINDOW_ERROR: TGType;

// === Konventiert am: 9-10-24 09:12:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_GL_TEXTURE_TARGET: TGType;
begin
  GST_TYPE_GL_TEXTURE_TARGET := gst_gl_texture_target_get_type;
end;

function GST_TYPE_GL_API: TGType;
begin
  GST_TYPE_GL_API := gst_gl_api_get_type;
end;

function GST_TYPE_GL_PLATFORM: TGType;
begin
  GST_TYPE_GL_PLATFORM := gst_gl_platform_get_type;
end;

function GST_TYPE_GL_BASE_MEMORY_ERROR: TGType;
begin
  GST_TYPE_GL_BASE_MEMORY_ERROR := gst_gl_base_memory_error_get_type;
end;

function GST_TYPE_GL_BASE_MEMORY_TRANSFER: TGType;
begin
  GST_TYPE_GL_BASE_MEMORY_TRANSFER := gst_gl_base_memory_transfer_get_type;
end;

function GST_TYPE_GL_CONTEXT_ERROR: TGType;
begin
  GST_TYPE_GL_CONTEXT_ERROR := gst_gl_context_error_get_type;
end;

function GST_TYPE_GL_CONFIG_CAVEAT: TGType;
begin
  GST_TYPE_GL_CONFIG_CAVEAT := gst_gl_config_caveat_get_type;
end;

function GST_TYPE_GL_CONFIG_SURFACE_TYPE: TGType;
begin
  GST_TYPE_GL_CONFIG_SURFACE_TYPE := gst_gl_config_surface_type_get_type;
end;

function GST_TYPE_GL_DISPLAY_TYPE: TGType;
begin
  GST_TYPE_GL_DISPLAY_TYPE := gst_gl_display_type_get_type;
end;

function GST_TYPE_GL_FORMAT: TGType;
begin
  GST_TYPE_GL_FORMAT := gst_gl_format_get_type;
end;

function GST_TYPE_GL_QUERY_TYPE: TGType;
begin
  GST_TYPE_GL_QUERY_TYPE := gst_gl_query_type_get_type;
end;

function GST_TYPE_GLSL_ERROR: TGType;
begin
  GST_TYPE_GLSL_ERROR := gst_glsl_error_get_type;
end;

function GST_TYPE_GLSL_VERSION: TGType;
begin
  GST_TYPE_GLSL_VERSION := gst_glsl_version_get_type;
end;

function GST_TYPE_GLSL_PROFILE: TGType;
begin
  GST_TYPE_GLSL_PROFILE := gst_glsl_profile_get_type;
end;

function GST_TYPE_GL_UPLOAD_RETURN: TGType;
begin
  GST_TYPE_GL_UPLOAD_RETURN := gst_gl_upload_return_get_type;
end;

function GST_TYPE_GL_STEREO_DOWNMIX: TGType;
begin
  GST_TYPE_GL_STEREO_DOWNMIX := gst_gl_stereo_downmix_get_type;
end;

function GST_TYPE_GL_WINDOW_ERROR: TGType;
begin
  GST_TYPE_GL_WINDOW_ERROR := gst_gl_window_error_get_type;
end;


{$ENDIF read_implementation}

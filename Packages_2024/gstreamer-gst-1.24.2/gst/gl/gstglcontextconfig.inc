
{$IFDEF read_interface}

const
  GST_GL_CONFIG_STRUCTURE_NAME = 'gst-gl-context-config';

var
  GST_GL_CONFIG_ATTRIB_CONFIG_ID_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_CONFIG_ID_GTYPE = G_TYPE_UINT;

var
  GST_GL_CONFIG_ATTRIB_PLATFORM_NAME: pansichar; cvar;external libgstgl;

var
  GST_GL_CONFIG_ATTRIB_CAVEAT_NAME: pansichar; cvar;external libgstgl;

var
  GST_GL_CONFIG_ATTRIB_SURFACE_TYPE_NAME: pansichar; cvar;external libgstgl;

var
  GST_GL_CONFIG_ATTRIB_CONFORMANT_API_NAME: pansichar; cvar;external libgstgl;

var
  GST_GL_CONFIG_ATTRIB_RENDERABLE_API_NAME: pansichar; cvar;external libgstgl;

var
  GST_GL_CONFIG_ATTRIB_RED_SIZE_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_RED_SIZE_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_GREEN_SIZE_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_GREEN_SIZE_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_BLUE_SIZE_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_BLUE_SIZE_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_ALPHA_SIZE_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_ALPHA_SIZE_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_LUMINANCE_SIZE_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_LUMINANCE_SIZE_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_DEPTH_SIZE_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_DEPTH_SIZE_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_STENCIL_SIZE_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_STENCIL_SIZE_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_WIDTH_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_WIDTH_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_HEIGHT_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_HEIGHT_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_PIXELS_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_PIXELS_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_SAMPLE_BUFFERS_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_SAMPLE_BUFFERS_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_SAMPLES_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_SAMPLES_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_NATIVE_RENDERABLE_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_NATIVE_RENDERABLE_GTYPE = G_TYPE_BOOLEAN;

var
  GST_GL_CONFIG_ATTRIB_NATIVE_VISUAL_ID_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_NATIVE_VISUAL_ID_GTYPE = G_TYPE_UINT;

var
  GST_GL_CONFIG_ATTRIB_LEVEL_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_LEVEL_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_MIN_SWAP_INTERVAL_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_MIN_SWAP_INTERVAL_GTYPE = G_TYPE_INT;

var
  GST_GL_CONFIG_ATTRIB_MAX_SWAP_INTERVAL_NAME: pansichar; cvar;external libgstgl;

const
  GST_GL_CONFIG_ATTRIB_MAX_SWAP_INTERVAL_GTYPE = G_TYPE_INT;

type
  PGstGLConfigCaveat = ^TGstGLConfigCaveat;
  TGstGLConfigCaveat = longint;

const
  GST_GL_CONFIG_CAVEAT_NONE = 0;
  GST_GL_CONFIG_CAVEAT_SLOW = 1;
  GST_GL_CONFIG_CAVEAT_NON_CONFORMANT = 2;

function gst_gl_config_caveat_to_string(caveat: TGstGLConfigCaveat): Pgchar; cdecl; external libgstgl;

type
  PGstGLConfigSurfaceType = ^TGstGLConfigSurfaceType;
  TGstGLConfigSurfaceType = longint;

const
  GST_GL_CONFIG_SURFACE_TYPE_NONE = 0;
  GST_GL_CONFIG_SURFACE_TYPE_WINDOW = 1 shl 0;
  GST_GL_CONFIG_SURFACE_TYPE_PBUFFER = 1 shl 1;
  GST_GL_CONFIG_SURFACE_TYPE_PIXMAP = 1 shl 2;

function gst_gl_config_surface_type_to_string(surface_type: TGstGLConfigSurfaceType): Pgchar; cdecl; external libgstgl;

function GST_GL_CONFIG_ATTRIB_PLATFORM_GTYPE: TGType;
function GST_GL_CONFIG_ATTRIB_CAVEAT_GTYPE: TGType;
function GST_GL_CONFIG_ATTRIB_SURFACE_TYPE_GTYPE: TGType;
function GST_GL_CONFIG_ATTRIB_CONFORMANT_API_GTYPE: TGType;
function GST_GL_CONFIG_ATTRIB_RENDERABLE_API_GTYPE: TGType;


// === Konventiert am: 9-10-24 12:15:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_GL_CONFIG_ATTRIB_PLATFORM_GTYPE: TGType;
begin
  Result := GST_TYPE_GL_PLATFORM;
end;

function GST_GL_CONFIG_ATTRIB_CAVEAT_GTYPE: TGType;
begin
  Result := GST_TYPE_GL_CONFIG_CAVEAT;
end;

function GST_GL_CONFIG_ATTRIB_SURFACE_TYPE_GTYPE: TGType;
begin
  Result := GST_TYPE_GL_CONFIG_SURFACE_TYPE;
end;

function GST_GL_CONFIG_ATTRIB_CONFORMANT_API_GTYPE: TGType;
begin
  Result := GST_TYPE_GL_API;
end;

function GST_GL_CONFIG_ATTRIB_RENDERABLE_API_GTYPE: TGType;
begin
  Result := GST_TYPE_GL_API;
end;


{$ENDIF read_implementation}

unit render;

interface

uses
  fp_mpv, client;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Pmpv_render_context = type Pointer;
  PPmpv_render_context = ^Pmpv_render_context;

type
  Pmpv_render_param_type = ^Tmpv_render_param_type;
  Tmpv_render_param_type = longint;

const
  MPV_RENDER_PARAM_INVALID = 0;
  MPV_RENDER_PARAM_API_TYPE = 1;
  MPV_RENDER_PARAM_OPENGL_INIT_PARAMS = 2;
  MPV_RENDER_PARAM_OPENGL_FBO = 3;
  MPV_RENDER_PARAM_FLIP_Y = 4;
  MPV_RENDER_PARAM_DEPTH = 5;
  MPV_RENDER_PARAM_ICC_PROFILE = 6;
  MPV_RENDER_PARAM_AMBIENT_LIGHT = 7;
  MPV_RENDER_PARAM_X11_DISPLAY = 8;
  MPV_RENDER_PARAM_WL_DISPLAY = 9;
  MPV_RENDER_PARAM_ADVANCED_CONTROL = 10;
  MPV_RENDER_PARAM_NEXT_FRAME_INFO = 11;
  MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME = 12;
  MPV_RENDER_PARAM_SKIP_RENDERING = 13;
  MPV_RENDER_PARAM_DRM_DISPLAY = 14;
  MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE = 15;
  MPV_RENDER_PARAM_DRM_DISPLAY_V2 = 16;
  MPV_RENDER_PARAM_SW_SIZE = 17;
  MPV_RENDER_PARAM_SW_FORMAT = 18;
  MPV_RENDER_PARAM_SW_STRIDE = 19;
  MPV_RENDER_PARAM_SW_POINTER = 20;

  MPV_RENDER_PARAM_DRM_OSD_SIZE = MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE;

type
  Tmpv_render_param = record
    _type: Tmpv_render_param_type;
    data: pointer;
  end;
  Pmpv_render_param = ^Tmpv_render_param;

const
  MPV_RENDER_API_TYPE_OPENGL = 'opengl';
  MPV_RENDER_API_TYPE_SW = 'sw';

type
  Pmpv_render_frame_info_flag = ^Tmpv_render_frame_info_flag;
  Tmpv_render_frame_info_flag = longint;

const
  MPV_RENDER_FRAME_INFO_PRESENT = 1 shl 0;
  MPV_RENDER_FRAME_INFO_REDRAW = 1 shl 1;
  MPV_RENDER_FRAME_INFO_REPEAT = 1 shl 2;
  MPV_RENDER_FRAME_INFO_BLOCK_VSYNC = 1 shl 3;

type
  Tmpv_render_frame_info = record
    flags: Tuint64_t;
    target_time: Tint64_t;
  end;
  Pmpv_render_frame_info = ^Tmpv_render_frame_info;

function mpv_render_context_create(res: PPmpv_render_context; mpv: Pmpv_handle; params: Pmpv_render_param): longint; cdecl; external libmpv;
function mpv_render_context_set_parameter(ctx: Pmpv_render_context; param: Tmpv_render_param): longint; cdecl; external libmpv;
function mpv_render_context_get_info(ctx: Pmpv_render_context; param: Tmpv_render_param): longint; cdecl; external libmpv;

type
  Tmpv_render_update_fn = procedure(cb_ctx: pointer); cdecl;

procedure mpv_render_context_set_update_callback(ctx: Pmpv_render_context; callback: Tmpv_render_update_fn; callback_ctx: pointer); cdecl; external libmpv;
function mpv_render_context_update(ctx: Pmpv_render_context): Tuint64_t; cdecl; external libmpv;

type
  Pmpv_render_update_flag = ^Tmpv_render_update_flag;
  Tmpv_render_update_flag = longint;

const
  MPV_RENDER_UPDATE_FRAME = 1 shl 0;

type
  Tmpv_render_context_flag = Tmpv_render_update_flag;
  Pmpv_render_context_flag = ^Tmpv_render_context_flag;

function mpv_render_context_render(ctx: Pmpv_render_context; params: Pmpv_render_param): longint; cdecl; external libmpv;
procedure mpv_render_context_report_swap(ctx: Pmpv_render_context); cdecl; external libmpv;
procedure mpv_render_context_free(ctx: Pmpv_render_context); cdecl; external libmpv;

// === Konventiert am: 25-1-26 13:13:33 ===


implementation



end.

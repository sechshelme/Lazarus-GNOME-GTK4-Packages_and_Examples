
{$IFDEF read_interface}

function gst_gl_context_get_type: TGType; cdecl; external libgstgl;
function gst_gl_context_error_quark: TGQuark; cdecl; external libgstgl;

const
  GST_GL_CONTEXT_TYPE_CGL = 'gst.gl.context.CGL';
  GST_GL_CONTEXT_TYPE_GLX = 'gst.gl.context.GLX';
  GST_GL_CONTEXT_TYPE_EGL = 'gst.gl.context.EGL';
  GST_GL_CONTEXT_TYPE_WGL = 'gst.gl.context.WGL';
  GST_GL_CONTEXT_TYPE_EAGL = 'gst.gl.context.EAGL';

type
  PGstGLContextError = ^TGstGLContextError;
  TGstGLContextError = longint;

const
  GST_GL_CONTEXT_ERROR_FAILED = 0;
  GST_GL_CONTEXT_ERROR_WRONG_CONFIG = 1;
  GST_GL_CONTEXT_ERROR_WRONG_API = 2;
  GST_GL_CONTEXT_ERROR_OLD_LIBS = 3;
  GST_GL_CONTEXT_ERROR_CREATE_CONTEXT = 4;
  GST_GL_CONTEXT_ERROR_RESOURCE_UNAVAILABLE = 5;

type
  TGstGLContextThreadFunc = procedure(context: PGstGLContext; Data: Tgpointer); cdecl;

  TGstGLContextClass = record
    parent_class: TGstObjectClass;
    get_current_context: function: Tguintptr; cdecl;
    get_gl_context: function(context: PGstGLContext): Tguintptr; cdecl;
    get_gl_api: function(context: PGstGLContext): TGstGLAPI; cdecl;
    get_gl_platform: function(context: PGstGLContext): TGstGLPlatform; cdecl;
    get_proc_address: function(gl_api: TGstGLAPI; Name: Pgchar): Tgpointer; cdecl;
    activate: function(context: PGstGLContext; activate: Tgboolean): Tgboolean; cdecl;
    choose_format: function(context: PGstGLContext; error: PPGError): Tgboolean; cdecl;
    create_context: function(context: PGstGLContext; gl_api: TGstGLAPI; other_context: PGstGLContext; error: PPGError): Tgboolean; cdecl;
    destroy_context: procedure(context: PGstGLContext); cdecl;
    swap_buffers: procedure(context: PGstGLContext); cdecl;
    check_feature: function(context: PGstGLContext; feature: Pgchar): Tgboolean; cdecl;
    get_gl_platform_version: procedure(context: PGstGLContext; major: Pgint; minor: Pgint); cdecl;
    get_config: function(context: PGstGLContext): PGstStructure; cdecl;
    request_config: function(context: PGstGLContext; gl_config: PGstStructure): Tgboolean; cdecl;
    _reserved: array[0..(GST_PADDING - 2) - 1] of Tgpointer;
  end;
  PGstGLContextClass = ^TGstGLContextClass;

function gst_gl_context_new(display: PGstGLDisplay): PGstGLContext; cdecl; external libgstgl;
function gst_gl_context_new_wrapped(display: PGstGLDisplay; handle: Tguintptr; context_type: TGstGLPlatform; available_apis: TGstGLAPI): PGstGLContext; cdecl; external libgstgl;
function gst_gl_context_get_config(context: PGstGLContext): PGstStructure; cdecl; external libgstgl;
function gst_gl_context_request_config(context: PGstGLContext; gl_config: PGstStructure): Tgboolean; cdecl; external libgstgl;
function gst_gl_context_activate(context: PGstGLContext; activate: Tgboolean): Tgboolean; cdecl; external libgstgl;
function gst_gl_context_get_thread(context: PGstGLContext): PGThread; cdecl; external libgstgl;
function gst_gl_context_get_current: PGstGLContext; cdecl; external libgstgl;
function gst_gl_context_get_display(context: PGstGLContext): PGstGLDisplay; cdecl; external libgstgl;
function gst_gl_context_get_proc_address(context: PGstGLContext; Name: Pgchar): Tgpointer; cdecl; external libgstgl;
function gst_gl_context_get_gl_platform(context: PGstGLContext): TGstGLPlatform; cdecl; external libgstgl;
function gst_gl_context_get_gl_api(context: PGstGLContext): TGstGLAPI; cdecl; external libgstgl;
function gst_gl_context_get_gl_context(context: PGstGLContext): Tguintptr; cdecl; external libgstgl;
function gst_gl_context_can_share(context: PGstGLContext; other_context: PGstGLContext): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_context_swap_buffers(context: PGstGLContext); cdecl; external libgstgl;
function gst_gl_context_create(context: PGstGLContext; other_context: PGstGLContext; error: PPGError): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_context_destroy(context: PGstGLContext); cdecl; external libgstgl;
function gst_gl_context_default_get_proc_address(gl_api: TGstGLAPI; Name: Pgchar): Tgpointer; cdecl; external libgstgl;
function gst_gl_context_get_proc_address_with_platform(context_type: TGstGLPlatform; gl_api: TGstGLAPI; Name: Pgchar): Tgpointer; cdecl; external libgstgl;
function gst_gl_context_set_window(context: PGstGLContext; window: PGstGLWindow): Tgboolean; cdecl; external libgstgl;
function gst_gl_context_get_window(context: PGstGLContext): PGstGLWindow; cdecl; external libgstgl;
procedure gst_gl_context_get_gl_version(context: PGstGLContext; maj: Pgint; min: Pgint); cdecl; external libgstgl;
function gst_gl_context_check_gl_version(context: PGstGLContext; api: TGstGLAPI; maj: Tgint; min: Tgint): Tgboolean; cdecl; external libgstgl;
function gst_gl_context_check_feature(context: PGstGLContext; feature: Pgchar): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_context_get_gl_platform_version(context: PGstGLContext; major: Pgint; minor: Pgint); cdecl; external libgstgl;
function gst_gl_context_get_current_gl_context(context_type: TGstGLPlatform): Tguintptr; cdecl; external libgstgl;
function gst_gl_context_get_current_gl_api(platform: TGstGLPlatform; major: Pguint; minor: Pguint): TGstGLAPI; cdecl; external libgstgl;
function gst_gl_context_is_shared(context: PGstGLContext): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_context_set_shared_with(context: PGstGLContext; share: PGstGLContext); cdecl; external libgstgl;
function gst_gl_context_fill_info(context: PGstGLContext; error: PPGError): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_context_thread_add(context: PGstGLContext; func: TGstGLContextThreadFunc; Data: Tgpointer); cdecl; external libgstgl;

function GST_GL_CONTEXT_ERROR: TGQuark;

// === Konventiert am: 9-10-24 09:21:50 ===

function GST_TYPE_GL_CONTEXT: TGType;
function GST_GL_CONTEXT(obj: Pointer): PGstGLContext;
function GST_GL_CONTEXT_CLASS(klass: Pointer): PGstGLContextClass;
function GST_IS_GL_CONTEXT(obj: Pointer): Tgboolean;
function GST_IS_GL_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function GST_GL_CONTEXT_GET_CLASS(obj: Pointer): PGstGLContextClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_CONTEXT: TGType;
begin
  GST_TYPE_GL_CONTEXT := gst_gl_context_get_type;
end;

function GST_GL_CONTEXT(obj: Pointer): PGstGLContext;
begin
  Result := PGstGLContext(g_type_check_instance_cast(obj, GST_TYPE_GL_CONTEXT));
end;

function GST_GL_CONTEXT_CLASS(klass: Pointer): PGstGLContextClass;
begin
  Result := PGstGLContextClass(g_type_check_class_cast(klass, GST_TYPE_GL_CONTEXT));
end;

function GST_IS_GL_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_CONTEXT);
end;

function GST_IS_GL_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_CONTEXT);
end;

function GST_GL_CONTEXT_GET_CLASS(obj: Pointer): PGstGLContextClass;
begin
  Result := PGstGLContextClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_GL_CONTEXT_ERROR: TGQuark;
begin
  GST_GL_CONTEXT_ERROR := gst_gl_context_error_quark;
end;


{$ENDIF read_implementation}

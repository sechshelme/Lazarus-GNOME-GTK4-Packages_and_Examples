

  {$IFDEF read_enum}
const
  GST_GL_DISPLAY_CONTEXT_TYPE = 'gst.gl.GLDisplay';

type
  PGstGLDisplayType = ^TGstGLDisplayType;
  TGstGLDisplayType = longint;
const
  GST_GL_DISPLAY_TYPE_NONE = 0;
  GST_GL_DISPLAY_TYPE_X11 = 1 shl 0;
  GST_GL_DISPLAY_TYPE_WAYLAND = 1 shl 1;
  GST_GL_DISPLAY_TYPE_COCOA = 1 shl 2;
  GST_GL_DISPLAY_TYPE_WIN32 = 1 shl 3;
  GST_GL_DISPLAY_TYPE_DISPMANX = 1 shl 4;
  GST_GL_DISPLAY_TYPE_EGL = 1 shl 5;
  GST_GL_DISPLAY_TYPE_VIV_FB = 1 shl 6;
  GST_GL_DISPLAY_TYPE_GBM = 1 shl 7;
  GST_GL_DISPLAY_TYPE_EGL_DEVICE = 1 shl 8;
  GST_GL_DISPLAY_TYPE_EAGL = 1 shl 9;
  GST_GL_DISPLAY_TYPE_WINRT = 1 shl 10;
  GST_GL_DISPLAY_TYPE_ANDROID = 1 shl 11;
  GST_GL_DISPLAY_TYPE_EGL_SURFACELESS = 1 shl 12;
  GST_GL_DISPLAY_TYPE_ANY = G_MAXUINT32;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstGLDisplayPrivate = type Pointer;

  PPGstGLDisplay = ^PGstGLDisplay;
  PGstGLDisplay = ^TGstGLDisplay;
  TGstGLDisplay = record
    obj: TGstObject;
    _type: TGstGLDisplayType;
    windows: PGList;
    main_context: PGMainContext;
    main_loop: PGMainLoop;
    event_source: PGSource;
    priv: PGstGLDisplayPrivate;
  end;

  PGstGLDisplayClass = ^TGstGLDisplayClass;
  TGstGLDisplayClass = record
    object_class: TGstObjectClass;
    get_handle: function(display: PGstGLDisplay): Tguintptr; cdecl;
    create_window: function(display: PGstGLDisplay): PGstGLWindow; cdecl;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_display_get_type: TGType; cdecl; external libgstgl;
function gst_gl_display_new: PGstGLDisplay; cdecl; external libgstgl;
function gst_gl_display_new_with_type(_type: TGstGLDisplayType): PGstGLDisplay; cdecl; external libgstgl;
function gst_gl_display_get_handle(display: PGstGLDisplay): Tguintptr; cdecl; external libgstgl;
function gst_gl_display_get_handle_type(display: PGstGLDisplay): TGstGLDisplayType; cdecl; external libgstgl;
procedure gst_gl_display_filter_gl_api(display: PGstGLDisplay; gl_api: TGstGLAPI); cdecl; external libgstgl;
function gst_gl_display_get_gl_api(display: PGstGLDisplay): TGstGLAPI; cdecl; external libgstgl;
function gst_gl_display_get_gl_api_unlocked(display: PGstGLDisplay): TGstGLAPI; cdecl; external libgstgl;

procedure gst_context_set_gl_display(context: PGstContext; display: PGstGLDisplay); cdecl; external libgstgl;
function gst_context_get_gl_display(context: PGstContext; display: PPGstGLDisplay): Tgboolean; cdecl; external libgstgl;
function gst_gl_display_create_context(display: PGstGLDisplay; other_context: PGstGLContext; p_context: PPGstGLContext; error: PPGError): Tgboolean; cdecl; external libgstgl;
function gst_gl_display_get_gl_context_for_thread(display: PGstGLDisplay; thread: PGThread): PGstGLContext; cdecl; external libgstgl;
function gst_gl_display_add_context(display: PGstGLDisplay; context: PGstGLContext): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_display_remove_context(display: PGstGLDisplay; context: PGstGLContext); cdecl; external libgstgl;
function gst_gl_display_ensure_context(display: PGstGLDisplay; other_context: PGstGLContext; context: PPGstGLContext; error: PPGError): Tgboolean; cdecl; external libgstgl;
function gst_gl_display_create_window(display: PGstGLDisplay): PGstGLWindow; cdecl; external libgstgl;
function gst_gl_display_remove_window(display: PGstGLDisplay; window: PGstGLWindow): Tgboolean; cdecl; external libgstgl;
function gst_gl_display_find_window(display: PGstGLDisplay; data: Tgpointer; compare_func: TGCompareFunc): PGstGLWindow; cdecl; external libgstgl; deprecated;
function gst_gl_display_retrieve_window(display: PGstGLDisplay; data: Tgpointer; compare_func: TGCompareFunc): PGstGLWindow; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 13:02:31 ===

function GST_GL_DISPLAY_CAST(obj: Pointer): PGstGLDisplay;
procedure gst_gl_display_lock(display: Pointer);
procedure gst_gl_display_unlock(display: Pointer);

function GST_TYPE_GL_DISPLAY: TGType;
function GST_GL_DISPLAY(obj: Pointer): PGstGLDisplay;
function GST_GL_DISPLAY_CLASS(klass: Pointer): PGstGLDisplayClass;
function GST_IS_GL_DISPLAY(obj: Pointer): Tgboolean;
function GST_IS_GL_DISPLAY_CLASS(klass: Pointer): Tgboolean;
function GST_GL_DISPLAY_GET_CLASS(obj: Pointer): PGstGLDisplayClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_GL_DISPLAY: TGType;
begin
  GST_TYPE_GL_DISPLAY := gst_gl_display_get_type;
end;

function GST_GL_DISPLAY(obj: Pointer): PGstGLDisplay;
begin
  Result := PGstGLDisplay(g_type_check_instance_cast(obj, GST_TYPE_GL_DISPLAY));
end;

function GST_GL_DISPLAY_CLASS(klass: Pointer): PGstGLDisplayClass;
begin
  Result := PGstGLDisplayClass(g_type_check_class_cast(klass, GST_TYPE_GL_DISPLAY));
end;

function GST_IS_GL_DISPLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_DISPLAY);
end;

function GST_IS_GL_DISPLAY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_DISPLAY);
end;

function GST_GL_DISPLAY_GET_CLASS(obj: Pointer): PGstGLDisplayClass;
begin
  Result := PGstGLDisplayClass(PGTypeInstance(obj)^.g_class);
end;


function GST_GL_DISPLAY_CAST(obj: Pointer): PGstGLDisplay;
begin
  GST_GL_DISPLAY_CAST := PGstGLDisplay(obj);
end;

procedure gst_gl_display_lock(display: Pointer);
begin
  GST_OBJECT_LOCK(display);
end;

procedure gst_gl_display_unlock(display: Pointer);
begin
  GST_OBJECT_UNLOCK(display);
end;

{$ENDIF read_implementation}

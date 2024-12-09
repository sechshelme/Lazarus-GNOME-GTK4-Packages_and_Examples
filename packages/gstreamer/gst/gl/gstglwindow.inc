
{$IFDEF read_interface}

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

function gst_gl_window_get_type: TGType; cdecl; external libgstgl;
function gst_gl_window_error_quark: TGQuark; cdecl; external libgstgl;

type
  PGstGLWindowError = ^TGstGLWindowError;
  TGstGLWindowError = longint;

const
  GST_GL_WINDOW_ERROR_FAILED = 0;
  GST_GL_WINDOW_ERROR_OLD_LIBS = 1;
  GST_GL_WINDOW_ERROR_RESOURCE_UNAVAILABLE = 2;

type
  TGstGLWindowCB = procedure(Data: Tgpointer); cdecl;
  TGstGLWindowResizeCB = procedure(Data: Tgpointer; Width: Tguint; Height: Tguint); cdecl;

type
  PGstGLDisplay = ^TGstGLDisplay;
  PPGstGLDisplay = ^PGstGLDisplay;
  PGstGLWindow = ^TGstGLWindow;

  TGstGLContextPrivate = record
  end;
  PGstGLContextPrivate = ^TGstGLContextPrivate;

  TGstGLContext = record
    parent: TGstObject;
    display: PGstGLDisplay;
    window: PGstGLWindow;
    gl_vtable: PGstGLFuncs;
    priv: PGstGLContextPrivate;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLContext = ^TGstGLContext;
  PPGstGLContext = ^PGstGLContext;

  TGstGLWindowPrivate = record
  end;
  PGstGLWindowPrivate = ^TGstGLWindowPrivate;

  TGstGLWindow = record
    parent: TGstObject;
    lock: TGMutex;
    display: PGstGLDisplay;
    context_ref: TGWeakRef;
    is_drawing: Tgboolean;
    draw: TGstGLWindowCB;
    draw_data: Tgpointer;
    draw_notify: TGDestroyNotify;
    Close: TGstGLWindowCB;
    close_data: Tgpointer;
    close_notify: TGDestroyNotify;
    resize: TGstGLWindowResizeCB;
    resize_data: Tgpointer;
    resize_notify: TGDestroyNotify;
    queue_resize: Tgboolean;
    main_context: PGMainContext;
    priv: PGstGLWindowPrivate;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  TGstGLWindowClass = record
    parent_class: TGstObjectClass;
    get_display: function(window: PGstGLWindow): Tguintptr; cdecl;
    set_window_handle: procedure(window: PGstGLWindow; handle: Tguintptr); cdecl;
    get_window_handle: function(window: PGstGLWindow): Tguintptr; cdecl;
    draw: procedure(window: PGstGLWindow); cdecl;
    run: procedure(window: PGstGLWindow); cdecl;
    quit: procedure(window: PGstGLWindow); cdecl;
    send_message: procedure(window: PGstGLWindow; callback: TGstGLWindowCB; Data: Tgpointer); cdecl;
    send_message_async: procedure(window: PGstGLWindow; callback: TGstGLWindowCB; Data: Tgpointer; Destroy: TGDestroyNotify); cdecl;
    Open: function(window: PGstGLWindow; error: PPGError): Tgboolean; cdecl;
    Close: procedure(window: PGstGLWindow); cdecl;
    handle_events: procedure(window: PGstGLWindow; handle_events: Tgboolean); cdecl;
    set_preferred_size: procedure(window: PGstGLWindow; Width: Tgint; Height: Tgint); cdecl;
    Show: procedure(window: PGstGLWindow); cdecl;
    set_render_rectangle: function(window: PGstGLWindow; x: Tgint; y: Tgint; Width: Tgint; Height: Tgint): Tgboolean; cdecl;
    queue_resize: procedure(window: PGstGLWindow); cdecl;
    controls_viewport: function(window: PGstGLWindow): Tgboolean; cdecl;
    has_output_surface: function(window: PGstGLWindow): Tgboolean; cdecl;
    _reserved: array[0..(GST_PADDING - 2) - 1] of Tgpointer;
  end;
  PGstGLWindowClass = ^TGstGLWindowClass;

  TGstGLDisplayPrivate = record
  end;
  PGstGLDisplayPrivate = ^TGstGLDisplayPrivate;

  TGstGLDisplay = record
    obj: TGstObject;
    _type: TGstGLDisplayType;
    Windows: PGList;
    main_context: PGMainContext;
    main_loop: PGMainLoop;
    event_source: PGSource;
    priv: PGstGLDisplayPrivate;
  end;

  TGstGLDisplayClass = record
    object_class: TGstObjectClass;
    get_handle: function(display: PGstGLDisplay): Tguintptr; cdecl;
    create_window: function(display: PGstGLDisplay): PGstGLWindow; cdecl;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLDisplayClass = ^TGstGLDisplayClass;


function gst_gl_window_new(display: PGstGLDisplay): PGstGLWindow; cdecl; external libgstgl;
procedure gst_gl_window_set_draw_callback(window: PGstGLWindow; callback: TGstGLWindowCB; Data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstgl;
procedure gst_gl_window_set_resize_callback(window: PGstGLWindow; callback: TGstGLWindowResizeCB; Data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstgl;
procedure gst_gl_window_set_close_callback(window: PGstGLWindow; callback: TGstGLWindowCB; Data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstgl;
procedure gst_gl_window_set_window_handle(window: PGstGLWindow; handle: Tguintptr); cdecl; external libgstgl;
function gst_gl_window_get_window_handle(window: PGstGLWindow): Tguintptr; cdecl; external libgstgl;
procedure gst_gl_window_run(window: PGstGLWindow); cdecl; external libgstgl;
procedure gst_gl_window_quit(window: PGstGLWindow); cdecl; external libgstgl;
procedure gst_gl_window_send_message(window: PGstGLWindow; callback: TGstGLWindowCB; Data: Tgpointer); cdecl; external libgstgl;
procedure gst_gl_window_send_message_async(window: PGstGLWindow; callback: TGstGLWindowCB; Data: Tgpointer; Destroy: TGDestroyNotify); cdecl; external libgstgl;
procedure gst_gl_window_handle_events(window: PGstGLWindow; handle_events: Tgboolean); cdecl; external libgstgl;
procedure gst_gl_window_send_key_event(window: PGstGLWindow; event_type: pchar; key_str: pchar); cdecl; external libgstgl;
procedure gst_gl_window_send_mouse_event(window: PGstGLWindow; event_type: pchar; button: longint; posx: Tdouble; posy: Tdouble); cdecl; external libgstgl;
procedure gst_gl_window_send_scroll_event(window: PGstGLWindow; posx: Tdouble; posy: Tdouble; delta_x: Tdouble; delta_y: Tdouble); cdecl; external libgstgl;
procedure gst_gl_window_queue_resize(window: PGstGLWindow); cdecl; external libgstgl;
procedure gst_gl_window_draw(window: PGstGLWindow); cdecl; external libgstgl;
procedure gst_gl_window_show(window: PGstGLWindow); cdecl; external libgstgl;
procedure gst_gl_window_set_preferred_size(window: PGstGLWindow; Width: Tgint; Height: Tgint); cdecl; external libgstgl;
procedure gst_gl_window_get_surface_dimensions(window: PGstGLWindow; Width: Pguint; Height: Pguint); cdecl; external libgstgl;
function gst_gl_window_set_render_rectangle(window: PGstGLWindow; x: Tgint; y: Tgint; Width: Tgint; Height: Tgint): Tgboolean; cdecl; external libgstgl;
function gst_gl_window_controls_viewport(window: PGstGLWindow): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_window_resize(window: PGstGLWindow; Width: Tguint; Height: Tguint); cdecl; external libgstgl;
function gst_gl_window_get_context(window: PGstGLWindow): PGstGLContext; cdecl; external libgstgl;
function gst_gl_window_get_display(window: PGstGLWindow): Tguintptr; cdecl; external libgstgl;
function gst_gl_window_has_output_surface(window: PGstGLWindow): Tgboolean; cdecl; external libgstgl;

procedure GST_GL_WINDOW_LOCK(w: Pointer);
procedure GST_GL_WINDOW_UNLOCK(w: Pointer);
function GST_GL_WINDOW_GET_LOCK(w: Pointer): PGMutex;
function GST_GL_WINDOW_ERROR: TGQuark;
function GST_GL_WINDOW_CB(f: Pointer): TGstGLWindowCB;
function GST_GL_WINDOW_RESIZE_CB(f: Pointer): TGstGLWindowResizeCB;

// === Konventiert am: 9-10-24 09:37:21 ===

function GST_TYPE_GL_WINDOW: TGType;
function GST_GL_WINDOW(obj: Pointer): PGstGLWindow;
function GST_GL_WINDOW_CLASS(klass: Pointer): PGstGLWindowClass;
function GST_IS_GL_WINDOW(obj: Pointer): Tgboolean;
function GST_IS_GL_WINDOW_CLASS(klass: Pointer): Tgboolean;
function GST_GL_WINDOW_GET_CLASS(obj: Pointer): PGstGLWindowClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_WINDOW: TGType;
begin
  GST_TYPE_GL_WINDOW := gst_gl_window_get_type;
end;

function GST_GL_WINDOW(obj: Pointer): PGstGLWindow;
begin
  Result := PGstGLWindow(g_type_check_instance_cast(obj, GST_TYPE_GL_WINDOW));
end;

function GST_GL_WINDOW_CLASS(klass: Pointer): PGstGLWindowClass;
begin
  Result := PGstGLWindowClass(g_type_check_class_cast(klass, GST_TYPE_GL_WINDOW));
end;

function GST_IS_GL_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_WINDOW);
end;

function GST_IS_GL_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_WINDOW);
end;

function GST_GL_WINDOW_GET_CLASS(obj: Pointer): PGstGLWindowClass;
begin
  Result := PGstGLWindowClass(PGTypeInstance(obj)^.g_class);
end;

// ====

procedure GST_GL_WINDOW_LOCK(w: Pointer);
begin
  g_mutex_lock(@((GST_GL_WINDOW(w))^.lock));
end;

procedure GST_GL_WINDOW_UNLOCK(w: Pointer);
begin
  g_mutex_unlock(@((GST_GL_WINDOW(w))^.lock));
end;

function GST_GL_WINDOW_GET_LOCK(w: Pointer): PGMutex;
begin
  GST_GL_WINDOW_GET_LOCK := @GST_GL_WINDOW(w)^.lock;
end;

function GST_GL_WINDOW_ERROR: TGQuark;
begin
  GST_GL_WINDOW_ERROR := gst_gl_window_error_quark;
end;

function GST_GL_WINDOW_CB(f: Pointer): TGstGLWindowCB;
begin
  GST_GL_WINDOW_CB := TGstGLWindowCB(f);
end;

function GST_GL_WINDOW_RESIZE_CB(f: Pointer): TGstGLWindowResizeCB;
begin
  GST_GL_WINDOW_RESIZE_CB := TGstGLWindowResizeCB(f);
end;


{$ENDIF read_implementation}

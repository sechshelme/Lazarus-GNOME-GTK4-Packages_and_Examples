
{$IFDEF read_interface}

function gst_gl_display_get_type: TGType; cdecl; external libgstgl;
function gst_gl_display_new: PGstGLDisplay; cdecl; external libgstgl;
function gst_gl_display_new_with_type(_type: TGstGLDisplayType): PGstGLDisplay; cdecl; external libgstgl;
function gst_gl_display_get_handle(display: PGstGLDisplay): Tguintptr; cdecl; external libgstgl;
function gst_gl_display_get_handle_type(display: PGstGLDisplay): TGstGLDisplayType; cdecl; external libgstgl;
procedure gst_gl_display_filter_gl_api(display: PGstGLDisplay; gl_api: TGstGLAPI); cdecl; external libgstgl;
function gst_gl_display_get_gl_api(display: PGstGLDisplay): TGstGLAPI; cdecl; external libgstgl;
function gst_gl_display_get_gl_api_unlocked(display: PGstGLDisplay): TGstGLAPI; cdecl; external libgstgl;

const
  GST_GL_DISPLAY_CONTEXT_TYPE = 'gst.gl.GLDisplay';

procedure gst_context_set_gl_display(context: PGstContext; display: PGstGLDisplay); cdecl; external libgstgl;
function gst_context_get_gl_display(context: PGstContext; display: PPGstGLDisplay): Tgboolean; cdecl; external libgstgl;
function gst_gl_display_create_context(display: PGstGLDisplay; other_context: PGstGLContext; p_context: PPGstGLContext; error: PPGError): Tgboolean; cdecl; external libgstgl;
function gst_gl_display_get_gl_context_for_thread(display: PGstGLDisplay; thread: PGThread): PGstGLContext; cdecl; external libgstgl;
function gst_gl_display_add_context(display: PGstGLDisplay; context: PGstGLContext): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_display_remove_context(display: PGstGLDisplay; context: PGstGLContext); cdecl; external libgstgl;
function gst_gl_display_ensure_context(display: PGstGLDisplay; other_context: PGstGLContext; context: PPGstGLContext; error: PPGError): Tgboolean; cdecl; external libgstgl;
function gst_gl_display_create_window(display: PGstGLDisplay): PGstGLWindow; cdecl; external libgstgl;
function gst_gl_display_remove_window(display: PGstGLDisplay; window: PGstGLWindow): Tgboolean; cdecl; external libgstgl;
function gst_gl_display_find_window(display: PGstGLDisplay; Data: Tgpointer; compare_func: TGCompareFunc): PGstGLWindow; cdecl; external libgstgl;
function gst_gl_display_retrieve_window(display: PGstGLDisplay; Data: Tgpointer; compare_func: TGCompareFunc): PGstGLWindow; cdecl; external libgstgl;

function GST_GL_DISPLAY_CAST(obj: Pointer): PGstGLDisplay;
procedure gst_gl_display_lock(display: Pointer);
procedure gst_gl_display_unlock(display: Pointer);

// === Konventiert am: 9-10-24 09:21:55 ===

function GST_TYPE_GL_DISPLAY: TGType;
function GST_GL_DISPLAY(obj: Pointer): PGstGLDisplay;
function GST_GL_DISPLAY_CLASS(klass: Pointer): PGstGLDisplayClass;
function GST_IS_GL_DISPLAY(obj: Pointer): Tgboolean;
function GST_IS_GL_DISPLAY_CLASS(klass: Pointer): Tgboolean;
function GST_GL_DISPLAY_GET_CLASS(obj: Pointer): PGstGLDisplayClass;

{$ENDIF read_interface}


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

// ====

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

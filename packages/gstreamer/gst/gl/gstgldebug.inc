
{$IFDEF read_interface}

type
  PGstGLAsyncDebugLogGetMessage = ^TGstGLAsyncDebugLogGetMessage;
  TGstGLAsyncDebugLogGetMessage = function(user_data: Tgpointer): Pgchar; cdecl;

  TGstGLAsyncDebug = record
    state_flags: Tguint;
    cat: PGstDebugCategory;
    level: TGstDebugLevel;
    file_: Pgchar;
    _function: Pgchar;
    line: Tgint;
    obj: PGObject;
    debug_msg: Pgchar;
    callback: TGstGLAsyncDebugLogGetMessage;
    user_data: Tgpointer;
    notify: TGDestroyNotify;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLAsyncDebug = ^TGstGLAsyncDebug;


function gst_gl_async_debug_new: PGstGLAsyncDebug; cdecl; external libgstgl;
procedure gst_gl_async_debug_free(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_init(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_unset(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_freeze(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_thaw(ad: PGstGLAsyncDebug); cdecl; external libgstgl;

procedure gst_gl_insert_debug_marker(context: PGstGLContext; format: Pgchar); varargs; cdecl; external libgstgl;
procedure gst_gl_async_debug_output_log_msg(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_store_log_msg(ad: PGstGLAsyncDebug; cat: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar;
  line: Tgint; obj: PGObject; format: Pgchar; args: array of const); cdecl; external libgstgl;
procedure gst_gl_async_debug_store_log_msg(ad: PGstGLAsyncDebug; cat: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar;
  line: Tgint; obj: PGObject; format: Pgchar); cdecl; external libgstgl;
procedure gst_gl_async_debug_store_log_msg_valist(ad: PGstGLAsyncDebug; cat: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar;
  line: Tgint; obj: PGObject; format: Pgchar; varargs: Tva_list); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 10:09:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}

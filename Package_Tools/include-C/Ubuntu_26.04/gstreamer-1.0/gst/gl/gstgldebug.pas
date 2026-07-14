unit gstgldebug;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TGstGLAsyncDebugLogGetMessage = function(user_data: Tgpointer): Pgchar; cdecl;

  PGstGLAsyncDebug = ^TGstGLAsyncDebug;
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
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_async_debug_new: PGstGLAsyncDebug; cdecl; external libgstgl;
procedure gst_gl_async_debug_free(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_init(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_unset(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_freeze(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_thaw(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_insert_debug_marker(context: PGstGLContext; format: Pgchar); cdecl; varargs; external libgstgl;
procedure gst_gl_async_debug_output_log_msg(ad: PGstGLAsyncDebug); cdecl; external libgstgl;
procedure gst_gl_async_debug_store_log_msg(ad: PGstGLAsyncDebug; cat: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar;
  line: Tgint; obj: PGObject; format: Pgchar); cdecl; varargs; external libgstgl;
procedure gst_gl_async_debug_store_log_msg_valist(ad: PGstGLAsyncDebug; cat: PGstDebugCategory; level: TGstDebugLevel; file_: Pgchar; _function: Pgchar;
  line: Tgint; obj: PGObject; format: Pgchar; varargs: Tva_list); cdecl; external libgstgl;
{$ENDIF read_function}

// === Konventiert am: 14-7-26 13:02:35 ===


implementation



end.

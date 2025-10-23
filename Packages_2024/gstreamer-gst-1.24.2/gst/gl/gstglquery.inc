
{$IFDEF read_interface}

type
  PGstGLQueryType = ^TGstGLQueryType;
  TGstGLQueryType = longint;

const
  GST_GL_QUERY_NONE = 0;
  GST_GL_QUERY_TIME_ELAPSED = 1;
  GST_GL_QUERY_TIMESTAMP = 2;

type
  TGstGLQuery = record
    context: PGstGLContext;
    query_type: Tguint;
    query_id: Tguint;
    supported: Tgboolean;
    start_called: Tgboolean;
    debug: TGstGLAsyncDebug;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLQuery = ^TGstGLQuery;

procedure gst_gl_query_init(query: PGstGLQuery; context: PGstGLContext; query_type: TGstGLQueryType); cdecl; external libgstgl;
procedure gst_gl_query_unset(query: PGstGLQuery); cdecl; external libgstgl;
function gst_gl_query_new(context: PGstGLContext; query_type: TGstGLQueryType): PGstGLQuery; cdecl; external libgstgl;
procedure gst_gl_query_free(query: PGstGLQuery); cdecl; external libgstgl;
procedure gst_gl_query_start(query: PGstGLQuery); cdecl; external libgstgl;
procedure gst_gl_query_end(query: PGstGLQuery); cdecl; external libgstgl;
procedure gst_gl_query_counter(query: PGstGLQuery); cdecl; external libgstgl;
function gst_gl_query_result(query: PGstGLQuery): Tguint64; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 10:06:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

unit gstglquery;

interface

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

uses
  fp_glib2, fp_gst, gstgldebug;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstGLQueryType = ^TGstGLQueryType;
  TGstGLQueryType = longint;
const
  GST_GL_QUERY_NONE = 0;
  GST_GL_QUERY_TIME_ELAPSED = 1;
  GST_GL_QUERY_TIMESTAMP = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstGLQuery = ^TGstGLQuery;
  TGstGLQuery = record
    context: PGstGLContext;
    query_type: Tguint;
    query_id: Tguint;
    supported: Tgboolean;
    start_called: Tgboolean;
    debug: TGstGLAsyncDebug;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure gst_gl_query_init(query: PGstGLQuery; context: PGstGLContext; query_type: TGstGLQueryType); cdecl; external libgstgl;
procedure gst_gl_query_unset(query: PGstGLQuery); cdecl; external libgstgl;
function gst_gl_query_new(context: PGstGLContext; query_type: TGstGLQueryType): PGstGLQuery; cdecl; external libgstgl;
procedure gst_gl_query_free(query: PGstGLQuery); cdecl; external libgstgl;
procedure gst_gl_query_start(query: PGstGLQuery); cdecl; external libgstgl;
procedure gst_gl_query_end(query: PGstGLQuery); cdecl; external libgstgl;
procedure gst_gl_query_counter(query: PGstGLQuery); cdecl; external libgstgl;
function gst_gl_query_result(query: PGstGLQuery): Tguint64; cdecl; external libgstgl;
{$ENDIF read_function}

// === Konventiert am: 14-7-26 13:06:45 ===


implementation



end.

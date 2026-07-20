unit rtsp_context;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstRTSPContext = ^TGstRTSPContext;
  TGstRTSPContext = record
    server: Pointer; //PGstRTSPServer;
    conn: Pointer; //PGstRTSPConnection;
    client: Pointer; //PGstRTSPClient;
    request: Pointer; //PGstRTSPMessage;
    uri: Pointer; //PGstRTSPUrl;
    method: Pointer; //TGstRTSPMethod;
    auth: Pointer; //PGstRTSPAuth;
    token: Pointer; //PGstRTSPToken;
    session: Pointer; //PGstRTSPSession;
    sessmedia: Pointer; //PGstRTSPSessionMedia;
    factory: Pointer; //PGstRTSPMediaFactory;
    media: Pointer; //PGstRTSPMedia;
    stream: Pointer; //PGstRTSPStream;
    response: Pointer; //PGstRTSPMessage;
    trans: Pointer; //PGstRTSPStreamTransport;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_context_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_context_get_current: PGstRTSPContext; cdecl; external libgstrtsp;
procedure gst_rtsp_context_push_current(ctx: PGstRTSPContext); cdecl; external libgstrtsp;
procedure gst_rtsp_context_pop_current(ctx: PGstRTSPContext); cdecl; external libgstrtsp;
procedure gst_rtsp_context_set_token(ctx: PGstRTSPContext; token: PGstRTSPToken); cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:45:41 ===

function GST_TYPE_RTSP_CONTEXT: TGType;
{$ENDIF read_function}

implementation

function GST_TYPE_RTSP_CONTEXT: TGType;
begin
  GST_TYPE_RTSP_CONTEXT := gst_rtsp_context_get_type;
end;



end.

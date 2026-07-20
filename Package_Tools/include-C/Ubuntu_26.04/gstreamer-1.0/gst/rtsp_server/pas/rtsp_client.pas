unit rtsp_client;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, fp_gst_rtsp, rtsp_context, rtsp_session, rtsp_session_pool;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstRTSPClient = ^TGstRTSPClient;

  TGstRTSPClientSendFunc = function(client: PGstRTSPClient; message: PGstRTSPMessage; close: Tgboolean; user_data: Tgpointer): Tgboolean; cdecl;
  TGstRTSPClientSendMessagesFunc = function(client: PGstRTSPClient; messages: PGstRTSPMessage; n_messages: Tguint; close: Tgboolean; user_data: Tgpointer): Tgboolean; cdecl;
  TGstRTSPClientSessionFilterFunc = function(client: PGstRTSPClient; sess: PGstRTSPSession; user_data: Tgpointer): TGstRTSPFilterResult; cdecl;

  PGstRTSPClientPrivate = type Pointer;

  TGstRTSPClient = record
    parent: TGObject;
    priv: PGstRTSPClientPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPClientClass = ^TGstRTSPClientClass;
  TGstRTSPClientClass = record
    parent_class: TGObjectClass;
    create_sdp: function(client: PGstRTSPClient; media: PGstRTSPMedia): PGstSDPMessage; cdecl;
    configure_client_media: function(client: PGstRTSPClient; media: PGstRTSPMedia; stream: PGstRTSPStream; ctx: PGstRTSPContext): Tgboolean; cdecl;
    configure_client_transport: function(client: PGstRTSPClient; ctx: PGstRTSPContext; ct: PGstRTSPTransport): Tgboolean; cdecl;
    params_set: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPResult; cdecl;
    params_get: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPResult; cdecl;
    make_path_from_uri: function(client: PGstRTSPClient; uri: PGstRTSPUrl): Pgchar; cdecl;
    adjust_play_mode: function(client: PGstRTSPClient; context: PGstRTSPContext; range: PPGstRTSPTimeRange; flags: PGstSeekFlags; rate: Pgdouble;
      trickmode_interval: PGstClockTime; enable_rate_control: Pgboolean): TGstRTSPStatusCode; cdecl;
    adjust_play_response: function(client: PGstRTSPClient; context: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    closed: procedure(client: PGstRTSPClient); cdecl;
    new_session: procedure(client: PGstRTSPClient; session: PGstRTSPSession); cdecl;
    options_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    describe_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    setup_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    play_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    pause_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    teardown_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    set_parameter_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    get_parameter_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    handle_response: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    tunnel_http_response: procedure(client: PGstRTSPClient; request: PGstRTSPMessage; response: PGstRTSPMessage); cdecl;
    send_message: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext; response: PGstRTSPMessage); cdecl;
    handle_sdp: function(client: PGstRTSPClient; ctx: PGstRTSPContext; media: PGstRTSPMedia; sdp: PGstSDPMessage): Tgboolean; cdecl;
    announce_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    record_request: procedure(client: PGstRTSPClient; ctx: PGstRTSPContext); cdecl;
    check_requirements: function(client: PGstRTSPClient; ctx: PGstRTSPContext; arr: PPgchar): Pgchar; cdecl;
    pre_options_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    pre_describe_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    pre_setup_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    pre_play_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    pre_pause_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    pre_teardown_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    pre_set_parameter_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    pre_get_parameter_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    pre_announce_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    pre_record_request: function(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPStatusCode; cdecl;
    adjust_error_code: function(client: PGstRTSPClient; ctx: PGstRTSPContext; code: TGstRTSPStatusCode): TGstRTSPStatusCode; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 19) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_function}
function gst_rtsp_client_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_client_new: PGstRTSPClient; cdecl; external libgstrtsp;
procedure gst_rtsp_client_set_session_pool(client: PGstRTSPClient; pool: PGstRTSPSessionPool); cdecl; external libgstrtsp;
function gst_rtsp_client_get_session_pool(client: PGstRTSPClient): PGstRTSPSessionPool; cdecl; external libgstrtsp;
procedure gst_rtsp_client_set_mount_points(client: PGstRTSPClient; mounts: PGstRTSPMountPoints); cdecl; external libgstrtsp;
function gst_rtsp_client_get_mount_points(client: PGstRTSPClient): PGstRTSPMountPoints; cdecl; external libgstrtsp;
procedure gst_rtsp_client_set_content_length_limit(client: PGstRTSPClient; limit: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_client_get_content_length_limit(client: PGstRTSPClient): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_client_set_auth(client: PGstRTSPClient; auth: PGstRTSPAuth); cdecl; external libgstrtsp;
function gst_rtsp_client_get_auth(client: PGstRTSPClient): PGstRTSPAuth; cdecl; external libgstrtsp;
procedure gst_rtsp_client_set_thread_pool(client: PGstRTSPClient; pool: PGstRTSPThreadPool); cdecl; external libgstrtsp;
function gst_rtsp_client_get_thread_pool(client: PGstRTSPClient): PGstRTSPThreadPool; cdecl; external libgstrtsp;
function gst_rtsp_client_set_connection(client: PGstRTSPClient; conn: PGstRTSPConnection): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_client_get_connection(client: PGstRTSPClient): PGstRTSPConnection; cdecl; external libgstrtsp;
function gst_rtsp_client_attach(client: PGstRTSPClient; context: PGMainContext): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_client_close(client: PGstRTSPClient); cdecl; external libgstrtsp;
procedure gst_rtsp_client_set_send_func(client: PGstRTSPClient; func: TGstRTSPClientSendFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstrtsp;
procedure gst_rtsp_client_set_send_messages_func(client: PGstRTSPClient; func: TGstRTSPClientSendMessagesFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstrtsp;
function gst_rtsp_client_handle_message(client: PGstRTSPClient; message: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_client_send_message(client: PGstRTSPClient; session: PGstRTSPSession; message: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;

function gst_rtsp_client_session_filter(client: PGstRTSPClient; func: TGstRTSPClientSessionFilterFunc; user_data: Tgpointer): PGList; cdecl; external libgstrtsp;
function gst_rtsp_client_get_stream_transport(client: PGstRTSPClient; channel: Tguint8): PGstRTSPStreamTransport; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:45:46 ===

function GST_TYPE_RTSP_SERVER: TGType;
function GST_RTSP_SERVER(obj: Pointer): PGstRTSPServer;
function GST_RTSP_SERVER_CLASS(klass: Pointer): PGstRTSPServerClass;
function GST_IS_RTSP_SERVER(obj: Pointer): Tgboolean;
function GST_IS_RTSP_SERVER_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_SERVER_GET_CLASS(obj: Pointer): PGstRTSPServerClass;
function GST_RTSP_SERVER_CAST(obj: Pointer): PGstRTSPServer;
function GST_RTSP_SERVER_CLASS_CAST(klass: Pointer): PGstRTSPServerClass;
{$ENDIF read_function}

implementation

function GST_TYPE_RTSP_SERVER: TGType;
begin
  Result := gst_rtsp_server_get_type;
end;

function GST_RTSP_SERVER(obj: Pointer): PGstRTSPServer;
begin
  Result := PGstRTSPServer(g_type_check_instance_cast(obj, GST_TYPE_RTSP_SERVER));
end;

function GST_RTSP_SERVER_CLASS(klass: Pointer): PGstRTSPServerClass;
begin
  Result := PGstRTSPServerClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_SERVER));
end;

function GST_IS_RTSP_SERVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_SERVER);
end;

function GST_IS_RTSP_SERVER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_SERVER);
end;

function GST_RTSP_SERVER_GET_CLASS(obj: Pointer): PGstRTSPServerClass;
begin
  Result := PGstRTSPServerClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_SERVER_CAST(obj: Pointer): PGstRTSPServer;
begin
  Result := PGstRTSPServer(obj);
end;

function GST_RTSP_SERVER_CLASS_CAST(klass: Pointer): PGstRTSPServerClass;
begin
  Result := PGstRTSPServerClass(klass);
end;

end.

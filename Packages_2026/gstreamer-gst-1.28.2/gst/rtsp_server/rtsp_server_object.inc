

  {$IFDEF read_struct}
type
  PGstRTSPServerPrivate = type Pointer;

  PGstRTSPServer = ^TGstRTSPServer;
  TGstRTSPServer = record
    parent: TGObject;
    priv: PGstRTSPServerPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPServerClass = ^TGstRTSPServerClass;
  TGstRTSPServerClass = record
    parent_class: TGObjectClass;
    create_client: function(server: PGstRTSPServer): PGstRTSPClient; cdecl;
    client_connected: procedure(server: PGstRTSPServer; client: PGstRTSPClient); cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;

  end;

  TGstRTSPServerClientFilterFunc = function(server: PGstRTSPServer; client: PGstRTSPClient; user_data: Tgpointer): TGstRTSPFilterResult; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_server_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_server_new: PGstRTSPServer; cdecl; external libgstrtsp;
procedure gst_rtsp_server_set_address(server: PGstRTSPServer; address: Pgchar); cdecl; external libgstrtsp;
function gst_rtsp_server_get_address(server: PGstRTSPServer): Pgchar; cdecl; external libgstrtsp;
procedure gst_rtsp_server_set_service(server: PGstRTSPServer; service: Pgchar); cdecl; external libgstrtsp;
function gst_rtsp_server_get_service(server: PGstRTSPServer): Pgchar; cdecl; external libgstrtsp;
procedure gst_rtsp_server_set_backlog(server: PGstRTSPServer; backlog: Tgint); cdecl; external libgstrtsp;
function gst_rtsp_server_get_backlog(server: PGstRTSPServer): Tgint; cdecl; external libgstrtsp;
function gst_rtsp_server_get_bound_port(server: PGstRTSPServer): longint; cdecl; external libgstrtsp;
procedure gst_rtsp_server_set_session_pool(server: PGstRTSPServer; pool: PGstRTSPSessionPool); cdecl; external libgstrtsp;
function gst_rtsp_server_get_session_pool(server: PGstRTSPServer): PGstRTSPSessionPool; cdecl; external libgstrtsp;
procedure gst_rtsp_server_set_mount_points(server: PGstRTSPServer; mounts: PGstRTSPMountPoints); cdecl; external libgstrtsp;
function gst_rtsp_server_get_mount_points(server: PGstRTSPServer): PGstRTSPMountPoints; cdecl; external libgstrtsp;
procedure gst_rtsp_server_set_content_length_limit(server: PGstRTSPServer; limit: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_server_get_content_length_limit(server: PGstRTSPServer): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_server_set_auth(server: PGstRTSPServer; auth: PGstRTSPAuth); cdecl; external libgstrtsp;
function gst_rtsp_server_get_auth(server: PGstRTSPServer): PGstRTSPAuth; cdecl; external libgstrtsp;
procedure gst_rtsp_server_set_thread_pool(server: PGstRTSPServer; pool: PGstRTSPThreadPool); cdecl; external libgstrtsp;
function gst_rtsp_server_get_thread_pool(server: PGstRTSPServer): PGstRTSPThreadPool; cdecl; external libgstrtsp;
function gst_rtsp_server_transfer_connection(server: PGstRTSPServer; socket: PGSocket; ip: Pgchar; port: Tgint; initial_buffer: Pgchar): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_server_io_func(socket: PGSocket; condition: TGIOCondition; server: PGstRTSPServer): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_server_create_socket(server: PGstRTSPServer; cancellable: PGCancellable; error: PPGError): PGSocket; cdecl; external libgstrtsp;
function gst_rtsp_server_create_source(server: PGstRTSPServer; cancellable: PGCancellable; error: PPGError): PGSource; cdecl; external libgstrtsp;
function gst_rtsp_server_attach(server: PGstRTSPServer; context: PGMainContext): Tguint; cdecl; external libgstrtsp;
function gst_rtsp_server_client_filter(server: PGstRTSPServer; func: TGstRTSPServerClientFilterFunc; user_data: Tgpointer): PGList; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:44:21 ===

function GST_TYPE_RTSP_SERVER: TGType;
function GST_RTSP_SERVER(obj: Pointer): PGstRTSPServer;
function GST_RTSP_SERVER_CLASS(klass: Pointer): PGstRTSPServerClass;
function GST_IS_RTSP_SERVER(obj: Pointer): Tgboolean;
function GST_IS_RTSP_SERVER_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_SERVER_GET_CLASS(obj: Pointer): PGstRTSPServerClass;
function GST_RTSP_SERVER_CAST(obj: Pointer): PGstRTSPServer;
function GST_RTSP_SERVER_CLASS_CAST(klass: Pointer): PGstRTSPServerClass;
{$ENDIF read_struct}


{$IFDEF read_implementation}

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

{$ENDIF read_implementation}

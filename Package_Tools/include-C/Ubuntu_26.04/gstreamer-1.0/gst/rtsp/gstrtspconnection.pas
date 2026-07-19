unit gstrtspconnection;

interface

uses
  fp_glib2, fp_gst, gstrtspurl, gstrtspdefs, gstrtspmessage;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGstRTSPConnection = type Pointer;
  PPGstRTSPConnection = ^PGstRTSPConnection;

function gst_rtsp_connection_create(url: PGstRTSPUrl; conn: PPGstRTSPConnection): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_create_from_socket(socket: PGSocket; ip: Pgchar; port: Tguint16; initial_buffer: Pgchar; conn: PPGstRTSPConnection): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_accept(socket: PGSocket; conn: PPGstRTSPConnection; cancellable: PGCancellable): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_connect_usec(conn: PGstRTSPConnection; timeout: Tgint64): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_connect_with_response_usec(conn: PGstRTSPConnection; timeout: Tgint64; response: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_close(conn: PGstRTSPConnection): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_free(conn: PGstRTSPConnection): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_get_tls(conn: PGstRTSPConnection; error: PPGError): PGTlsConnection; cdecl; external libgstrtp;
function gst_rtsp_connection_set_tls_validation_flags(conn: PGstRTSPConnection; flags: TGTlsCertificateFlags): Tgboolean; cdecl; external libgstrtp;
function gst_rtsp_connection_get_tls_validation_flags(conn: PGstRTSPConnection): TGTlsCertificateFlags; cdecl; external libgstrtp;
procedure gst_rtsp_connection_set_tls_database(conn: PGstRTSPConnection; database: PGTlsDatabase); cdecl; external libgstrtp;
function gst_rtsp_connection_get_tls_database(conn: PGstRTSPConnection): PGTlsDatabase; cdecl; external libgstrtp;
procedure gst_rtsp_connection_set_tls_interaction(conn: PGstRTSPConnection; interaction: PGTlsInteraction); cdecl; external libgstrtp;
function gst_rtsp_connection_get_tls_interaction(conn: PGstRTSPConnection): PGTlsInteraction; cdecl; external libgstrtp;

type
  TGstRTSPConnectionAcceptCertificateFunc = function(conn: PGTlsConnection; peer_cert: PGTlsCertificate; errors: TGTlsCertificateFlags; user_data: Tgpointer): Tgboolean; cdecl;

procedure gst_rtsp_connection_set_accept_certificate_func(conn: PGstRTSPConnection; func: TGstRTSPConnectionAcceptCertificateFunc; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgstrtp;
function gst_rtsp_connection_read_usec(conn: PGstRTSPConnection; data: Pguint8; size: Tguint; timeout: Tgint64): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_write_usec(conn: PGstRTSPConnection; data: Pguint8; size: Tguint; timeout: Tgint64): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_send_usec(conn: PGstRTSPConnection; message: PGstRTSPMessage; timeout: Tgint64): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_send_messages_usec(conn: PGstRTSPConnection; messages: PGstRTSPMessage; n_messages: Tguint; timeout: Tgint64): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_receive_usec(conn: PGstRTSPConnection; message: PGstRTSPMessage; timeout: Tgint64): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_poll_usec(conn: PGstRTSPConnection; events: TGstRTSPEvent; revents: PGstRTSPEvent; timeout: Tgint64): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_next_timeout_usec(conn: PGstRTSPConnection): Tgint64; cdecl; external libgstrtp;
function gst_rtsp_connection_reset_timeout(conn: PGstRTSPConnection): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_flush(conn: PGstRTSPConnection; flush: Tgboolean): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_set_proxy(conn: PGstRTSPConnection; host: Pgchar; port: Tguint): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_connection_set_auth(conn: PGstRTSPConnection; method: TGstRTSPAuthMethod; user: Pgchar; pass: Pgchar): TGstRTSPResult; cdecl; external libgstrtp;
procedure gst_rtsp_connection_set_auth_param(conn: PGstRTSPConnection; param: Pgchar; value: Pgchar); cdecl; external libgstrtp;
procedure gst_rtsp_connection_clear_auth_params(conn: PGstRTSPConnection); cdecl; external libgstrtp;
function gst_rtsp_connection_set_qos_dscp(conn: PGstRTSPConnection; qos_dscp: Tguint): TGstRTSPResult; cdecl; external libgstrtp;
procedure gst_rtsp_connection_set_content_length_limit(conn: PGstRTSPConnection; limit: Tguint); cdecl; external libgstrtp;
function gst_rtsp_connection_get_url(conn: PGstRTSPConnection): PGstRTSPUrl; cdecl; external libgstrtp;
function gst_rtsp_connection_get_ip(conn: PGstRTSPConnection): Pgchar; cdecl; external libgstrtp;
procedure gst_rtsp_connection_set_ip(conn: PGstRTSPConnection; ip: Pgchar); cdecl; external libgstrtp;
function gst_rtsp_connection_get_read_socket(conn: PGstRTSPConnection): PGSocket; cdecl; external libgstrtp;
function gst_rtsp_connection_get_write_socket(conn: PGstRTSPConnection): PGSocket; cdecl; external libgstrtp;
procedure gst_rtsp_connection_set_http_mode(conn: PGstRTSPConnection; enable: Tgboolean); cdecl; external libgstrtp;
procedure gst_rtsp_connection_set_tunneled(conn: PGstRTSPConnection; tunneled: Tgboolean); cdecl; external libgstrtp;
function gst_rtsp_connection_is_tunneled(conn: PGstRTSPConnection): Tgboolean; cdecl; external libgstrtp;
function gst_rtsp_connection_get_tunnelid(conn: PGstRTSPConnection): Pgchar; cdecl; external libgstrtp;
function gst_rtsp_connection_do_tunnel(conn: PGstRTSPConnection; conn2: PGstRTSPConnection): TGstRTSPResult; cdecl; external libgstrtp;
procedure gst_rtsp_connection_set_remember_session_id(conn: PGstRTSPConnection; remember: Tgboolean); cdecl; external libgstrtp;
function gst_rtsp_connection_get_remember_session_id(conn: PGstRTSPConnection): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtsp_connection_set_ignore_x_server_reply(conn: PGstRTSPConnection; ignore: Tgboolean); cdecl; external libgstrtp;
function gst_rtsp_connection_get_ignore_x_server_reply(conn: PGstRTSPConnection): Tgboolean; cdecl; external libgstrtp;
procedure gst_rtsp_connection_add_extra_http_request_header(conn: PGstRTSPConnection; key: Pgchar; value: Pgchar); cdecl; external libgstrtp;

type
  PGstRTSPWatch = type Pointer;

  PGstRTSPWatchFuncs = ^TGstRTSPWatchFuncs;
  TGstRTSPWatchFuncs = record
    message_received: function(watch: PGstRTSPWatch; message: PGstRTSPMessage; user_data: Tgpointer): TGstRTSPResult; cdecl;
    message_sent: function(watch: PGstRTSPWatch; id: Tguint; user_data: Tgpointer): TGstRTSPResult; cdecl;
    closed: function(watch: PGstRTSPWatch; user_data: Tgpointer): TGstRTSPResult; cdecl;
    error: function(watch: PGstRTSPWatch; result: TGstRTSPResult; user_data: Tgpointer): TGstRTSPResult; cdecl;
    tunnel_start: function(watch: PGstRTSPWatch; user_data: Tgpointer): TGstRTSPStatusCode; cdecl;
    tunnel_complete: function(watch: PGstRTSPWatch; user_data: Tgpointer): TGstRTSPResult; cdecl;
    error_full: function(watch: PGstRTSPWatch; result: TGstRTSPResult; message: PGstRTSPMessage; id: Tguint; user_data: Tgpointer): TGstRTSPResult; cdecl;
    tunnel_lost: function(watch: PGstRTSPWatch; user_data: Tgpointer): TGstRTSPResult; cdecl;
    tunnel_http_response: function(watch: PGstRTSPWatch; request: PGstRTSPMessage; response: PGstRTSPMessage; user_data: Tgpointer): TGstRTSPResult; cdecl;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;

function gst_rtsp_watch_new(conn: PGstRTSPConnection; funcs: PGstRTSPWatchFuncs; user_data: Tgpointer; notify: TGDestroyNotify): PGstRTSPWatch; cdecl; external libgstrtp;
procedure gst_rtsp_watch_reset(watch: PGstRTSPWatch); cdecl; external libgstrtp;
procedure gst_rtsp_watch_unref(watch: PGstRTSPWatch); cdecl; external libgstrtp;
function gst_rtsp_watch_attach(watch: PGstRTSPWatch; context: PGMainContext): Tguint; cdecl; external libgstrtp;
procedure gst_rtsp_watch_set_send_backlog(watch: PGstRTSPWatch; bytes: Tgsize; messages: Tguint); cdecl; external libgstrtp;
procedure gst_rtsp_watch_get_send_backlog(watch: PGstRTSPWatch; bytes: Pgsize; messages: Pguint); cdecl; external libgstrtp;
function gst_rtsp_watch_write_data(watch: PGstRTSPWatch; data: Pguint8; size: Tguint; id: Pguint): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_watch_send_message(watch: PGstRTSPWatch; message: PGstRTSPMessage; id: Pguint): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_watch_send_messages(watch: PGstRTSPWatch; messages: PGstRTSPMessage; n_messages: Tguint; id: Pguint): TGstRTSPResult; cdecl; external libgstrtp;
function gst_rtsp_watch_wait_backlog_usec(watch: PGstRTSPWatch; timeout: Tgint64): TGstRTSPResult; cdecl; external libgstrtp;
procedure gst_rtsp_watch_set_flushing(watch: PGstRTSPWatch; flushing: Tgboolean); cdecl; external libgstrtp;

function gst_rtsp_connection_connect(conn: PGstRTSPConnection; timeout: PGTimeVal): TGstRTSPResult; cdecl; external libgstrtp; deprecated;
function gst_rtsp_connection_connect_with_response(conn: PGstRTSPConnection; timeout: PGTimeVal; response: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtp; deprecated;
function gst_rtsp_connection_read(conn: PGstRTSPConnection; data: Pguint8; size: Tguint; timeout: PGTimeVal): TGstRTSPResult; cdecl; external libgstrtp; deprecated;
function gst_rtsp_connection_write(conn: PGstRTSPConnection; data: Pguint8; size: Tguint; timeout: PGTimeVal): TGstRTSPResult; cdecl; external libgstrtp; deprecated;
function gst_rtsp_connection_send(conn: PGstRTSPConnection; message: PGstRTSPMessage; timeout: PGTimeVal): TGstRTSPResult; cdecl; external libgstrtp; deprecated;
function gst_rtsp_connection_send_messages(conn: PGstRTSPConnection; messages: PGstRTSPMessage; n_messages: Tguint; timeout: PGTimeVal): TGstRTSPResult; cdecl; external libgstrtp; deprecated;
function gst_rtsp_connection_receive(conn: PGstRTSPConnection; message: PGstRTSPMessage; timeout: PGTimeVal): TGstRTSPResult; cdecl; external libgstrtp; deprecated;
function gst_rtsp_connection_poll(conn: PGstRTSPConnection; events: TGstRTSPEvent; revents: PGstRTSPEvent; timeout: PGTimeVal): TGstRTSPResult; cdecl; external libgstrtp; deprecated;
function gst_rtsp_connection_next_timeout(conn: PGstRTSPConnection; timeout: PGTimeVal): TGstRTSPResult; cdecl; external libgstrtp; deprecated;
function gst_rtsp_watch_wait_backlog(watch: PGstRTSPWatch; timeout: PGTimeVal): TGstRTSPResult; cdecl; external libgstrtp; deprecated;

// === Konventiert am: 19-7-26 19:32:10 ===


implementation



end.

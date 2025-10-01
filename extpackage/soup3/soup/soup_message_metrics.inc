{$IFDEF read_interface}


function soup_message_metrics_get_type: TGType; cdecl; external libsoup;

function SOUP_TYPE_MESSAGE_METRICS: TGType;

function soup_message_metrics_copy(metrics: PSoupMessageMetrics): PSoupMessageMetrics; cdecl; external libsoup;
procedure soup_message_metrics_free(metrics: PSoupMessageMetrics); cdecl; external libsoup;
function soup_message_metrics_get_fetch_start(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_dns_start(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_dns_end(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_connect_start(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_connect_end(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_tls_start(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_request_start(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_response_start(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_response_end(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_request_header_bytes_sent(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_request_body_size(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_request_body_bytes_sent(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_response_header_bytes_received(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_response_body_size(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;
function soup_message_metrics_get_response_body_bytes_received(metrics: PSoupMessageMetrics): Tguint64; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function SOUP_TYPE_MESSAGE_METRICS: TGType;
begin
  SOUP_TYPE_MESSAGE_METRICS := soup_message_metrics_get_type;
end;


{$ENDIF read_implementation}

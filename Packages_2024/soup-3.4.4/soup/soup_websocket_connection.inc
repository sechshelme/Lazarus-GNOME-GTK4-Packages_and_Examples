{$IFDEF read_interface}


type
  TSoupWebsocketConnectionClass = record
    parent_class: TGObjectClass;
  end;
  PSoupWebsocketConnectionClass = ^TSoupWebsocketConnectionClass;

function soup_websocket_connection_get_type: TGType; cdecl; external libsoup;
function soup_websocket_connection_new(stream: PGIOStream; uri: PGUri; _type: TSoupWebsocketConnectionType; origin: pchar; protocol: pchar; extensions: PGList): PSoupWebsocketConnection; cdecl; external libsoup;
function soup_websocket_connection_get_io_stream(self: PSoupWebsocketConnection): PGIOStream; cdecl; external libsoup;
function soup_websocket_connection_get_connection_type(self: PSoupWebsocketConnection): TSoupWebsocketConnectionType; cdecl; external libsoup;
function soup_websocket_connection_get_uri(self: PSoupWebsocketConnection): PGUri; cdecl; external libsoup;
function soup_websocket_connection_get_origin(self: PSoupWebsocketConnection): pchar; cdecl; external libsoup;
function soup_websocket_connection_get_protocol(self: PSoupWebsocketConnection): pchar; cdecl; external libsoup;
function soup_websocket_connection_get_extensions(self: PSoupWebsocketConnection): PGList; cdecl; external libsoup;
function soup_websocket_connection_get_state(self: PSoupWebsocketConnection): TSoupWebsocketState; cdecl; external libsoup;
function soup_websocket_connection_get_close_code(self: PSoupWebsocketConnection): Tgushort; cdecl; external libsoup;
function soup_websocket_connection_get_close_data(self: PSoupWebsocketConnection): pchar; cdecl; external libsoup;
procedure soup_websocket_connection_send_text(self: PSoupWebsocketConnection; text: pchar); cdecl; external libsoup;
procedure soup_websocket_connection_send_binary(self: PSoupWebsocketConnection; data: Tgconstpointer; length: Tgsize); cdecl; external libsoup;
procedure soup_websocket_connection_send_message(self: PSoupWebsocketConnection; _type: TSoupWebsocketDataType; message: PGBytes); cdecl; external libsoup;
procedure soup_websocket_connection_close(self: PSoupWebsocketConnection; code: Tgushort; data: pchar); cdecl; external libsoup;
function soup_websocket_connection_get_max_incoming_payload_size(self: PSoupWebsocketConnection): Tguint64; cdecl; external libsoup;
procedure soup_websocket_connection_set_max_incoming_payload_size(self: PSoupWebsocketConnection; max_incoming_payload_size: Tguint64); cdecl; external libsoup;
function soup_websocket_connection_get_keepalive_interval(self: PSoupWebsocketConnection): Tguint; cdecl; external libsoup;
procedure soup_websocket_connection_set_keepalive_interval(self: PSoupWebsocketConnection; interval: Tguint); cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:43:35 ===

function SOUP_TYPE_WEBSOCKET_CONNECTION: TGType;
function SOUP_WEBSOCKET_CONNECTION(obj: Pointer): PSoupWebsocketConnection;
function SOUP_IS_WEBSOCKET_CONNECTION(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_WEBSOCKET_CONNECTION: TGType;
begin
  Result := soup_websocket_connection_get_type;
end;

function SOUP_WEBSOCKET_CONNECTION(obj: Pointer): PSoupWebsocketConnection;
begin
  Result := PSoupWebsocketConnection(g_type_check_instance_cast(obj, SOUP_TYPE_WEBSOCKET_CONNECTION));
end;

function SOUP_IS_WEBSOCKET_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_WEBSOCKET_CONNECTION);
end;


{$ENDIF read_implementation}

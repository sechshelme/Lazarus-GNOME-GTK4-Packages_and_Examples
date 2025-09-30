unit soup_websocket;

interface

uses
  fp_glib2, fp_soup, soup_message, soup_server_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function SOUP_WEBSOCKET_ERROR: TGQuark;

function soup_websocket_error_quark: TGQuark; cdecl; external libsoup;

type
  PSoupWebsocketError = ^TSoupWebsocketError;
  TSoupWebsocketError = longint;

const
  SOUP_WEBSOCKET_ERROR_FAILED = 0;
  SOUP_WEBSOCKET_ERROR_NOT_WEBSOCKET = 1;
  SOUP_WEBSOCKET_ERROR_BAD_HANDSHAKE = 2;
  SOUP_WEBSOCKET_ERROR_BAD_ORIGIN = 3;

type
  PSoupWebsocketConnectionType = ^TSoupWebsocketConnectionType;
  TSoupWebsocketConnectionType = longint;

const
  SOUP_WEBSOCKET_CONNECTION_UNKNOWN = 0;
  SOUP_WEBSOCKET_CONNECTION_CLIENT = 1;
  SOUP_WEBSOCKET_CONNECTION_SERVER = 2;

type
  PSoupWebsocketDataType = ^TSoupWebsocketDataType;
  TSoupWebsocketDataType = longint;

const
  SOUP_WEBSOCKET_DATA_TEXT = $01;
  SOUP_WEBSOCKET_DATA_BINARY = $02;

type
  PSoupWebsocketCloseCode = ^TSoupWebsocketCloseCode;
  TSoupWebsocketCloseCode = longint;

const
  SOUP_WEBSOCKET_CLOSE_NORMAL = 1000;
  SOUP_WEBSOCKET_CLOSE_GOING_AWAY = 1001;
  SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR = 1002;
  SOUP_WEBSOCKET_CLOSE_UNSUPPORTED_DATA = 1003;
  SOUP_WEBSOCKET_CLOSE_NO_STATUS = 1005;
  SOUP_WEBSOCKET_CLOSE_ABNORMAL = 1006;
  SOUP_WEBSOCKET_CLOSE_BAD_DATA = 1007;
  SOUP_WEBSOCKET_CLOSE_POLICY_VIOLATION = 1008;
  SOUP_WEBSOCKET_CLOSE_TOO_BIG = 1009;
  SOUP_WEBSOCKET_CLOSE_NO_EXTENSION = 1010;
  SOUP_WEBSOCKET_CLOSE_SERVER_ERROR = 1011;
  SOUP_WEBSOCKET_CLOSE_TLS_HANDSHAKE = 1015;

type
  PSoupWebsocketState = ^TSoupWebsocketState;
  TSoupWebsocketState = longint;

const
  SOUP_WEBSOCKET_STATE_OPEN = 1;
  SOUP_WEBSOCKET_STATE_CLOSING = 2;
  SOUP_WEBSOCKET_STATE_CLOSED = 3;

procedure soup_websocket_client_prepare_handshake(msg: PSoupMessage; origin: pchar; protocols: PPchar; supported_extensions: PGPtrArray); cdecl; external libsoup;
function soup_websocket_client_verify_handshake(msg: PSoupMessage; supported_extensions: PGPtrArray; accepted_extensions: PPGList; error: PPGError): Tgboolean; cdecl; external libsoup;
function soup_websocket_server_check_handshake(msg: PSoupServerMessage; origin: pchar; protocols: PPchar; supported_extensions: PGPtrArray; error: PPGError): Tgboolean; cdecl; external libsoup;
function soup_websocket_server_process_handshake(msg: PSoupServerMessage; expected_origin: pchar; protocols: PPchar; supported_extensions: PGPtrArray; accepted_extensions: PPGList): Tgboolean; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:43:40 ===


implementation


function SOUP_WEBSOCKET_ERROR: TGQuark;
begin
  SOUP_WEBSOCKET_ERROR := soup_websocket_error_quark;
end;


end.

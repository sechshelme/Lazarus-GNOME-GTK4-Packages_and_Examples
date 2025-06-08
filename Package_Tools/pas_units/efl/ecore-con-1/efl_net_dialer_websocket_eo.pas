unit efl_net_dialer_websocket_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, efl_net_http_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Net_Dialer_Websocket = ^TEfl_Net_Dialer_Websocket;
  TEfl_Net_Dialer_Websocket = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Dialer_Websocket_Streaming_Mode = ^TEfl_Net_Dialer_Websocket_Streaming_Mode;
  TEfl_Net_Dialer_Websocket_Streaming_Mode = longint;

const
  EFL_NET_DIALER_WEBSOCKET_STREAMING_MODE_DISABLED = 0;
  EFL_NET_DIALER_WEBSOCKET_STREAMING_MODE_BINARY = 1;
  EFL_NET_DIALER_WEBSOCKET_STREAMING_MODE_TEXT = 2;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Net_Dialer_Websocket_Close_Reason = ^TEfl_Net_Dialer_Websocket_Close_Reason;
  TEfl_Net_Dialer_Websocket_Close_Reason = longint;

const
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_NORMAL = 1000;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_GOING_AWAY = 1001;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_PROTOCOL_ERROR = 1002;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_NO_REASON = 1005;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_ABRUPTLY = 1006;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_UNEXPECTED_DATA = 1003;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_INCONSISTENT_DATA = 1007;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_POLICY_VIOLATION = 1008;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_TOO_BIG = 1009;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_MISSING_EXTENSION = 1010;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_SERVER_ERROR = 1011;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_IANA_REGISTRY_START = 3000;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_IANA_REGISTRY_END = 3999;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_PRIVATE_START = 4000;
  EFL_NET_DIALER_WEBSOCKET_CLOSE_REASON_PRIVATE_END = 4999;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Net_Dialer_Websocket_Closed_Reason = record
    reason: TEfl_Net_Dialer_Websocket_Close_Reason;
    message: pchar;
  end;
  PEfl_Net_Dialer_Websocket_Closed_Reason = ^TEfl_Net_Dialer_Websocket_Closed_Reason;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_WEBSOCKET_CLASS: PEfl_Class;

function efl_net_dialer_websocket_class_get: PEfl_Class; cdecl; external libecore_con;
procedure efl_net_dialer_websocket_ping(obj: PEo; reason: pchar); cdecl; external libecore_con;
procedure efl_net_dialer_websocket_text_send(obj: PEo; text: pchar); cdecl; external libecore_con;
procedure efl_net_dialer_websocket_binary_send(obj: PEo; blob: TEina_Slice); cdecl; external libecore_con;
procedure efl_net_dialer_websocket_close_request(obj: PEo; reason: TEfl_Net_Dialer_Websocket_Close_Reason; message: pchar); cdecl; external libecore_con;
procedure efl_net_dialer_websocket_request_protocol_add(obj: PEo; protocol: pchar); cdecl; external libecore_con;
function efl_net_dialer_websocket_request_protocols_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_dialer_websocket_request_protocols_clear(obj: PEo); cdecl; external libecore_con;
function efl_net_dialer_websocket_response_protocols_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_dialer_websocket_streaming_mode_set(obj: PEo; streaming_mode: TEfl_Net_Dialer_Websocket_Streaming_Mode); cdecl; external libecore_con;
function efl_net_dialer_websocket_streaming_mode_get(obj: PEo): TEfl_Net_Dialer_Websocket_Streaming_Mode; cdecl; external libecore_con;
procedure efl_net_dialer_websocket_user_agent_set(obj: PEo; user_agent: pchar); cdecl; external libecore_con;
function efl_net_dialer_websocket_user_agent_get(obj: PEo): pchar; cdecl; external libecore_con;
procedure efl_net_dialer_websocket_authentication_set(obj: PEo; username: pchar; password: pchar; method: TEfl_Net_Http_Authentication_Method; restricted: TEina_Bool); cdecl; external libecore_con;
procedure efl_net_dialer_websocket_authentication_get(obj: PEo; username: PPchar; password: PPchar; method: PEfl_Net_Http_Authentication_Method; restricted: PEina_Bool); cdecl; external libecore_con;
procedure efl_net_dialer_websocket_allow_redirects_set(obj: PEo; allow_redirects: TEina_Bool); cdecl; external libecore_con;
function efl_net_dialer_websocket_allow_redirects_get(obj: PEo): TEina_Bool; cdecl; external libecore_con;
procedure efl_net_dialer_websocket_request_header_add(obj: PEo; key: pchar; value: pchar); cdecl; external libecore_con;
procedure efl_net_dialer_websocket_request_headers_clear(obj: PEo); cdecl; external libecore_con;
function efl_net_dialer_websocket_request_headers_get(obj: PEo): PEina_Iterator; cdecl; external libecore_con;
procedure efl_net_dialer_websocket_cookie_jar_set(obj: PEo; path: pchar); cdecl; external libecore_con;
function efl_net_dialer_websocket_cookie_jar_get(obj: PEo): pchar; cdecl; external libecore_con;

var
  _EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_TEXT: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_BINARY: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_DIALER_WEBSOCKET_EVENT_PONG: TEfl_Event_Description; cvar;external libecore_con;
  _EFL_NET_DIALER_WEBSOCKET_EVENT_CLOSED_REASON: TEfl_Event_Description; cvar;external libecore_con;

function EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_TEXT: PEfl_Event_Description;
function EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_BINARY: PEfl_Event_Description;
function EFL_NET_DIALER_WEBSOCKET_EVENT_PONG: PEfl_Event_Description;
function EFL_NET_DIALER_WEBSOCKET_EVENT_CLOSED_REASON: PEfl_Event_Description;
{$endif}

// === Konventiert am: 8-6-25 19:32:37 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_NET_DIALER_WEBSOCKET_CLASS: PEfl_Class;
begin
  EFL_NET_DIALER_WEBSOCKET_CLASS := efl_net_dialer_websocket_class_get;
end;

function EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_TEXT: PEfl_Event_Description;
begin
  EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_TEXT := @(_EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_TEXT);
end;

function EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_BINARY: PEfl_Event_Description;
begin
  EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_BINARY := @(_EFL_NET_DIALER_WEBSOCKET_EVENT_MESSAGE_BINARY);
end;

function EFL_NET_DIALER_WEBSOCKET_EVENT_PONG: PEfl_Event_Description;
begin
  EFL_NET_DIALER_WEBSOCKET_EVENT_PONG := @(_EFL_NET_DIALER_WEBSOCKET_EVENT_PONG);
end;

function EFL_NET_DIALER_WEBSOCKET_EVENT_CLOSED_REASON: PEfl_Event_Description;
begin
  EFL_NET_DIALER_WEBSOCKET_EVENT_CLOSED_REASON := @(_EFL_NET_DIALER_WEBSOCKET_EVENT_CLOSED_REASON);
end;
{$endif}


end.

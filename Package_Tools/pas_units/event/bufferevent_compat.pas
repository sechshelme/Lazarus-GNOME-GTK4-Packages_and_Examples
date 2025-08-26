unit bufferevent_compat;

interface

uses
  fp_event, util, buffer, bufferevent;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tevbuffercb = Tbufferevent_data_cb;
  Teverrorcb = Tbufferevent_event_cb;

function bufferevent_new(fd: Tevutil_socket_t; readcb: Tevbuffercb; writecb: Tevbuffercb; errorcb: Teverrorcb; cbarg: pointer): Pbufferevent; cdecl; external libevent;
procedure bufferevent_settimeout(bufev: Pbufferevent; timeout_read: longint; timeout_write: longint); cdecl; external libevent;

const
  EVBUFFER_READ = BEV_EVENT_READING;
  EVBUFFER_WRITE = BEV_EVENT_WRITING;
  EVBUFFER_EOF = BEV_EVENT_EOF;
  EVBUFFER_ERROR = BEV_EVENT_ERROR;
  EVBUFFER_TIMEOUT = BEV_EVENT_TIMEOUT;

function EVBUFFER_INPUT(x: Pbufferevent): Pevbuffer;
function EVBUFFER_OUTPUT(x: Pbufferevent): Pevbuffer;


// === Konventiert am: 26-8-25 17:43:39 ===


implementation


function EVBUFFER_INPUT(x: Pbufferevent): Pevbuffer;
begin
  EVBUFFER_INPUT := bufferevent_get_input(x);
end;

function EVBUFFER_OUTPUT(x: Pbufferevent): Pevbuffer;
begin
  EVBUFFER_OUTPUT := bufferevent_get_output(x);
end;


end.

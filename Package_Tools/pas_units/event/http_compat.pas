unit http_compat;

interface

uses
  fp_event, util, http;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function evhttp_start(address: pchar; port: Tev_uint16_t): Pevhttp; cdecl; external libevent;
function evhttp_connection_new(address: pchar; port: Tev_uint16_t): Pevhttp_connection; cdecl; external libevent;
procedure evhttp_connection_set_base(evcon: Pevhttp_connection; base: Pevent_base); cdecl; external libevent;


  // === Konventiert am: 26-8-25 19:37:48 ===


implementation



end.

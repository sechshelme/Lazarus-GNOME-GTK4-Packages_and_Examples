{$IFDEF read_interface}


type
  Tcurl_ws_frame = record
    age: longint;
    flags: longint;
    offset: Tcurl_off_t;
    bytesleft: Tcurl_off_t;
    len: Tsize_t;
  end;
  Pcurl_ws_frame = ^Tcurl_ws_frame;
  PPcurl_ws_frame = ^Pcurl_ws_frame;

const
  CURLWS_TEXT = 1 shl 0;
  CURLWS_BINARY = 1 shl 1;
  CURLWS_CONT = 1 shl 2;
  CURLWS_CLOSE = 1 shl 3;
  CURLWS_PING = 1 shl 4;
  CURLWS_OFFSET = 1 shl 5;

function curl_ws_recv(curl: PCURL; buffer: pointer; buflen: Tsize_t; recv: Psize_t; metap: PPcurl_ws_frame): TCURLcode; cdecl; external libcurl;

const
  CURLWS_PONG = 1 shl 6;

function curl_ws_send(curl: PCURL; buffer: pointer; buflen: Tsize_t; sent: Psize_t; fragsize: Tcurl_off_t;
  flags: dword): TCURLcode; cdecl; external libcurl;

const
  CURLWS_RAW_MODE = 1 shl 0;

function curl_ws_meta(curl: PCURL): Pcurl_ws_frame; cdecl; external libcurl;

// === Konventiert am: 12-7-25 13:50:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

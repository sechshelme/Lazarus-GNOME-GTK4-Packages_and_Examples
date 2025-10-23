{$IFDEF read_interface}


type
  Tcurl_header = record
    name: pchar;
    value: pchar;
    amount: Tsize_t;
    index: Tsize_t;
    origin: dword;
    anchor: pointer;
  end;
  Pcurl_header = ^Tcurl_header;
  PPcurl_header = ^Pcurl_header;

const
  CURLH_HEADER = 1 shl 0;
  CURLH_TRAILER = 1 shl 1;
  CURLH_CONNECT = 1 shl 2;
  CURLH_1XX = 1 shl 3;
  CURLH_PSEUDO = 1 shl 4;

type
  PCURLHcode = ^TCURLHcode;
  TCURLHcode = longint;

const
  CURLHE_OK = 0;
  CURLHE_BADINDEX = 1;
  CURLHE_MISSING = 2;
  CURLHE_NOHEADERS = 3;
  CURLHE_NOREQUEST = 4;
  CURLHE_OUT_OF_MEMORY = 5;
  CURLHE_BAD_ARGUMENT = 6;
  CURLHE_NOT_BUILT_IN = 7;

function curl_easy_header(easy: PCURL; name: pchar; index: Tsize_t; origin: dword; request: longint;
  hout: PPcurl_header): TCURLHcode; cdecl; external libcurl;
function curl_easy_nextheader(easy: PCURL; origin: dword; request: longint; prev: Pcurl_header): Pcurl_header; cdecl; external libcurl;

// === Konventiert am: 12-7-25 13:50:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

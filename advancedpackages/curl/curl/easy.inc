{$IFDEF read_interface}


const
  CURL_BLOB_COPY = 1;
  CURL_BLOB_NOCOPY = 0;

type
  Tcurl_blob = record
    data: pointer;
    len: Tsize_t;
    flags: dword;
  end;
  Pcurl_blob = ^Tcurl_blob;

function curl_easy_init: PCURL; cdecl; external libcurl;
function curl_easy_setopt(curl: PCURL; option: TCURLoption): TCURLcode; cdecl; varargs; external libcurl;
function curl_easy_perform(curl: PCURL): TCURLcode; cdecl; external libcurl;
procedure curl_easy_cleanup(curl: PCURL); cdecl; external libcurl;
function curl_easy_getinfo(curl: PCURL; info: TCURLINFO): TCURLcode; cdecl; varargs; external libcurl;
function curl_easy_duphandle(curl: PCURL): PCURL; cdecl; external libcurl;
procedure curl_easy_reset(curl: PCURL); cdecl; external libcurl;
function curl_easy_recv(curl: PCURL; buffer: pointer; buflen: Tsize_t; n: Psize_t): TCURLcode; cdecl; external libcurl;
function curl_easy_send(curl: PCURL; buffer: pointer; buflen: Tsize_t; n: Psize_t): TCURLcode; cdecl; external libcurl;
function curl_easy_upkeep(curl: PCURL): TCURLcode; cdecl; external libcurl;

// === Konventiert am: 12-7-25 13:50:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

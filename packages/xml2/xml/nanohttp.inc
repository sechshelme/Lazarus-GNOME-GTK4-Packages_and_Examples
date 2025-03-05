{$IFDEF read_interface}

procedure xmlNanoHTTPInit; cdecl; external libxml2;
procedure xmlNanoHTTPCleanup; cdecl; external libxml2;
procedure xmlNanoHTTPScanProxy(URL: pchar); cdecl; external libxml2;
function xmlNanoHTTPFetch(URL: pchar; filename: pchar; contentType: PPchar): longint; cdecl; external libxml2;
function xmlNanoHTTPMethod(URL: pchar; method: pchar; input: pchar; contentType: PPchar; headers: pchar;
  ilen: longint): pointer; cdecl; external libxml2;
function xmlNanoHTTPMethodRedir(URL: pchar; method: pchar; input: pchar; contentType: PPchar; redir: PPchar;
  headers: pchar; ilen: longint): pointer; cdecl; external libxml2;
function xmlNanoHTTPOpen(URL: pchar; contentType: PPchar): pointer; cdecl; external libxml2;
function xmlNanoHTTPOpenRedir(URL: pchar; contentType: PPchar; redir: PPchar): pointer; cdecl; external libxml2;
function xmlNanoHTTPReturnCode(ctx: pointer): longint; cdecl; external libxml2;
function xmlNanoHTTPAuthHeader(ctx: pointer): pchar; cdecl; external libxml2;
function xmlNanoHTTPRedir(ctx: pointer): pchar; cdecl; external libxml2;
function xmlNanoHTTPContentLength(ctx: pointer): longint; cdecl; external libxml2;
function xmlNanoHTTPEncoding(ctx: pointer): pchar; cdecl; external libxml2;
function xmlNanoHTTPMimeType(ctx: pointer): pchar; cdecl; external libxml2;
function xmlNanoHTTPRead(ctx: pointer; dest: pointer; len: longint): longint; cdecl; external libxml2;
function xmlNanoHTTPSave(ctxt: pointer; filename: pchar): longint; cdecl; external libxml2;
procedure xmlNanoHTTPClose(ctx: pointer); cdecl; external libxml2;

// === Konventiert am: 4-3-25 13:49:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

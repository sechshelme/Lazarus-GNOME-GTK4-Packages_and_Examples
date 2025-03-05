{$IFDEF read_interface}

type
  TSOCKET = cint;

const
  INVALID_SOCKET = -1;

type
  TftpListCallback = procedure(userData: pointer; filename: pchar; attrib: pchar; owner: pchar; group: pchar;
    size: dword; links: longint; year: longint; month: pchar; day: longint;
    hour: longint; minute: longint); cdecl;
  TftpDataCallback = procedure(userData: pointer; Data: pchar; len: longint); cdecl;

procedure xmlNanoFTPInit; cdecl; external libxml2;
procedure xmlNanoFTPCleanup; cdecl; external libxml2;
function xmlNanoFTPNewCtxt(URL: pchar): pointer; cdecl; external libxml2;
procedure xmlNanoFTPFreeCtxt(ctx: pointer); cdecl; external libxml2;
function xmlNanoFTPConnectTo(server: pchar; port: longint): pointer; cdecl; external libxml2;
function xmlNanoFTPOpen(URL: pchar): pointer; cdecl; external libxml2;
function xmlNanoFTPConnect(ctx: pointer): longint; cdecl; external libxml2;
function xmlNanoFTPClose(ctx: pointer): longint; cdecl; external libxml2;
function xmlNanoFTPQuit(ctx: pointer): longint; cdecl; external libxml2;
procedure xmlNanoFTPScanProxy(URL: pchar); cdecl; external libxml2;
procedure xmlNanoFTPProxy(host: pchar; port: longint; user: pchar; passwd: pchar; _type: longint); cdecl; external libxml2;
function xmlNanoFTPUpdateURL(ctx: pointer; URL: pchar): longint; cdecl; external libxml2;
function xmlNanoFTPGetResponse(ctx: pointer): longint; cdecl; external libxml2;
function xmlNanoFTPCheckResponse(ctx: pointer): longint; cdecl; external libxml2;
function xmlNanoFTPCwd(ctx: pointer; directory: pchar): longint; cdecl; external libxml2;
function xmlNanoFTPDele(ctx: pointer; file_: pchar): longint; cdecl; external libxml2;
function xmlNanoFTPGetConnection(ctx: pointer): TSOCKET; cdecl; external libxml2;
function xmlNanoFTPCloseConnection(ctx: pointer): longint; cdecl; external libxml2;
function xmlNanoFTPList(ctx: pointer; callback: TftpListCallback; userData: pointer; filename: pchar): longint; cdecl; external libxml2;
function xmlNanoFTPGetSocket(ctx: pointer; filename: pchar): TSOCKET; cdecl; external libxml2;
function xmlNanoFTPGet(ctx: pointer; callback: TftpDataCallback; userData: pointer; filename: pchar): longint; cdecl; external libxml2;
function xmlNanoFTPRead(ctx: pointer; dest: pointer; len: longint): longint; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:33:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

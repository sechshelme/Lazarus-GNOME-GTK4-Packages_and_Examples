{$IFDEF read_interface}

type
  TxmlInputMatchCallback = function(filename: pchar): longint; cdecl;

  PxmlInputOpenCallback = ^TxmlInputOpenCallback;
  TxmlInputOpenCallback = function(filename: pchar): pointer; cdecl;

  TxmlInputReadCallback = function(context: pointer; buffer: pchar; len: longint): longint; cdecl;
  TxmlInputCloseCallback = function(context: pointer): longint; cdecl;
  TxmlOutputMatchCallback = function(filename: pchar): longint; cdecl;

  PxmlOutputOpenCallback = ^TxmlOutputOpenCallback;
  TxmlOutputOpenCallback = function(filename: pchar): pointer; cdecl;

  TxmlOutputWriteCallback = function(context: pointer; buffer: pchar; len: longint): longint; cdecl;
  TxmlOutputCloseCallback = function(context: pointer): longint; cdecl;

type
  TxmlParserInputBuffer = record
    context: pointer;
    readcallback: TxmlInputReadCallback;
    closecallback: TxmlInputCloseCallback;
    encoder: PxmlCharEncodingHandler;
    buffer: PxmlBuf;
    raw: PxmlBuf;
    compressed: longint;
    error: longint;
    rawconsumed: Tclong;
  end;
  PxmlParserInputBuffer = ^TxmlParserInputBuffer;

  TxmlOutputBuffer = record
    context: pointer;
    writecallback: TxmlOutputWriteCallback;
    closecallback: TxmlOutputCloseCallback;
    encoder: PxmlCharEncodingHandler;
    buffer: PxmlBuf;
    conv: PxmlBuf;
    written: longint;
    error: longint;
  end;
  PxmlOutputBuffer = ^TxmlOutputBuffer;

procedure xmlCleanupInputCallbacks; cdecl; external libxml2;
function xmlPopInputCallbacks: longint; cdecl; external libxml2;
procedure xmlRegisterDefaultInputCallbacks; cdecl; external libxml2;
function xmlAllocParserInputBuffer(enc: TxmlCharEncoding): PxmlParserInputBuffer; cdecl; external libxml2;
function xmlParserInputBufferCreateFilename(URI: pchar; enc: TxmlCharEncoding): PxmlParserInputBuffer; cdecl; external libxml2;
function xmlParserInputBufferCreateFile(file_: PFILE; enc: TxmlCharEncoding): PxmlParserInputBuffer; cdecl; external libxml2;
function xmlParserInputBufferCreateFd(fd: longint; enc: TxmlCharEncoding): PxmlParserInputBuffer; cdecl; external libxml2;
function xmlParserInputBufferCreateMem(mem: pchar; size: longint; enc: TxmlCharEncoding): PxmlParserInputBuffer; cdecl; external libxml2;
function xmlParserInputBufferCreateStatic(mem: pchar; size: longint; enc: TxmlCharEncoding): PxmlParserInputBuffer; cdecl; external libxml2;
function xmlParserInputBufferCreateIO(ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; enc: TxmlCharEncoding): PxmlParserInputBuffer; cdecl; external libxml2;
function xmlParserInputBufferRead(in_: PxmlParserInputBuffer; len: longint): longint; cdecl; external libxml2;
function xmlParserInputBufferGrow(in_: PxmlParserInputBuffer; len: longint): longint; cdecl; external libxml2;
function xmlParserInputBufferPush(in_: PxmlParserInputBuffer; len: longint; buf: pchar): longint; cdecl; external libxml2;
procedure xmlFreeParserInputBuffer(in_: PxmlParserInputBuffer); cdecl; external libxml2;
function xmlParserGetDirectory(filename: pchar): pchar; cdecl; external libxml2;
function xmlRegisterInputCallbacks(matchFunc: TxmlInputMatchCallback; openFunc: TxmlInputOpenCallback; readFunc: TxmlInputReadCallback; closeFunc: TxmlInputCloseCallback): longint; cdecl; external libxml2;
function __xmlParserInputBufferCreateFilename(URI: pchar; enc: TxmlCharEncoding): PxmlParserInputBuffer; cdecl; external libxml2;
procedure xmlCleanupOutputCallbacks; cdecl; external libxml2;
function xmlPopOutputCallbacks: longint; cdecl; external libxml2;
procedure xmlRegisterDefaultOutputCallbacks; cdecl; external libxml2;
function xmlAllocOutputBuffer(encoder: PxmlCharEncodingHandler): PxmlOutputBuffer; cdecl; external libxml2;
function xmlOutputBufferCreateFilename(URI: pchar; encoder: PxmlCharEncodingHandler; compression: longint): PxmlOutputBuffer; cdecl; external libxml2;
function xmlOutputBufferCreateFile(file_: PFILE; encoder: PxmlCharEncodingHandler): PxmlOutputBuffer; cdecl; external libxml2;
function xmlOutputBufferCreateBuffer(buffer: PxmlBuffer; encoder: PxmlCharEncodingHandler): PxmlOutputBuffer; cdecl; external libxml2;
function xmlOutputBufferCreateFd(fd: longint; encoder: PxmlCharEncodingHandler): PxmlOutputBuffer; cdecl; external libxml2;
function xmlOutputBufferCreateIO(iowrite: TxmlOutputWriteCallback; ioclose: TxmlOutputCloseCallback; ioctx: pointer; encoder: PxmlCharEncodingHandler): PxmlOutputBuffer; cdecl; external libxml2;
function xmlOutputBufferGetContent(out_: PxmlOutputBuffer): PxmlChar; cdecl; external libxml2;
function xmlOutputBufferGetSize(out_: PxmlOutputBuffer): Tsize_t; cdecl; external libxml2;
function xmlOutputBufferWrite(out_: PxmlOutputBuffer; len: longint; buf: pchar): longint; cdecl; external libxml2;
function xmlOutputBufferWriteString(out_: PxmlOutputBuffer; str: pchar): longint; cdecl; external libxml2;
function xmlOutputBufferWriteEscape(out_: PxmlOutputBuffer; str: PxmlChar; escaping: TxmlCharEncodingOutputFunc): longint; cdecl; external libxml2;
function xmlOutputBufferFlush(out_: PxmlOutputBuffer): longint; cdecl; external libxml2;
function xmlOutputBufferClose(out_: PxmlOutputBuffer): longint; cdecl; external libxml2;
function xmlRegisterOutputCallbacks(matchFunc: TxmlOutputMatchCallback; openFunc: TxmlOutputOpenCallback; writeFunc: TxmlOutputWriteCallback; closeFunc: TxmlOutputCloseCallback): longint; cdecl; external libxml2;
function __xmlOutputBufferCreateFilename(URI: pchar; encoder: PxmlCharEncodingHandler; compression: longint): PxmlOutputBuffer; cdecl; external libxml2;
procedure xmlRegisterHTTPPostCallbacks; cdecl; external libxml2;

//function xmlCheckHTTPInput(ctxt: PxmlParserCtxt; ret: PxmlParserInput): PxmlParserInput; cdecl; external libxml2;
//function xmlNoNetExternalEntityLoader(URL: pchar; ID: pchar; ctxt: PxmlParserCtxt): PxmlParserInput; cdecl; external libxml2;
function xmlCheckHTTPInput(ctxt: Pointer; ret: Pointer): Pointer; cdecl; external libxml2;
function xmlNoNetExternalEntityLoader(URL: pchar; ID: pchar; ctxt: Pointer): Pointer; cdecl; external libxml2;
function xmlNormalizeWindowsPath(path: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlCheckFilename(path: pchar): longint; cdecl; external libxml2;
function xmlFileMatch(filename: pchar): longint; cdecl; external libxml2;
function xmlFileOpen(filename: pchar): pointer; cdecl; external libxml2;
function xmlFileRead(context: pointer; buffer: pchar; len: longint): longint; cdecl; external libxml2;
function xmlFileClose(context: pointer): longint; cdecl; external libxml2;
function xmlIOHTTPMatch(filename: pchar): longint; cdecl; external libxml2;
function xmlIOHTTPOpen(filename: pchar): pointer; cdecl; external libxml2;
function xmlIOHTTPOpenW(post_uri: pchar; compression: longint): pointer; cdecl; external libxml2;
function xmlIOHTTPRead(context: pointer; buffer: pchar; len: longint): longint; cdecl; external libxml2;
function xmlIOHTTPClose(context: pointer): longint; cdecl; external libxml2;
function xmlIOFTPMatch(filename: pchar): longint; cdecl; external libxml2;
function xmlIOFTPOpen(filename: pchar): pointer; cdecl; external libxml2;
function xmlIOFTPRead(context: pointer; buffer: pchar; len: longint): longint; cdecl; external libxml2;
function xmlIOFTPClose(context: pointer): longint; cdecl; external libxml2;

// === Konventiert am: 26-2-25 16:50:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}

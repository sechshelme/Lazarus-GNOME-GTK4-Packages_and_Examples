unit xmlIO;

interface

uses
  ctypes, xml2_common, encoding;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

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
    encoder: TxmlCharEncodingHandlerPtr;
    buffer: TxmlBufPtr;
    raw: TxmlBufPtr;
    compressed: longint;
    error: longint;
    rawconsumed: dword;
  end;
  PxmlParserInputBuffer = ^TxmlParserInputBuffer;

  TxmlOutputBuffer = record
    context: pointer;
    writecallback: TxmlOutputWriteCallback;
    closecallback: TxmlOutputCloseCallback;
    encoder: TxmlCharEncodingHandlerPtr;
    buffer: TxmlBufPtr;
    conv: TxmlBufPtr;
    written: longint;
    error: longint;
  end;
  PxmlOutputBuffer = ^TxmlOutputBuffer;

procedure xmlCleanupInputCallbacks; cdecl; external libxml2;
function xmlPopInputCallbacks: longint; cdecl; external libxml2;
procedure xmlRegisterDefaultInputCallbacks; cdecl; external libxml2;
function xmlAllocParserInputBuffer(enc: TxmlCharEncoding): TxmlParserInputBufferPtr; cdecl; external libxml2;
function xmlParserInputBufferCreateFilename(URI: pchar; enc: TxmlCharEncoding): TxmlParserInputBufferPtr; cdecl; external libxml2;
function xmlParserInputBufferCreateFile(file_: PFILE; enc: TxmlCharEncoding): TxmlParserInputBufferPtr; cdecl; external libxml2;
function xmlParserInputBufferCreateFd(fd: longint; enc: TxmlCharEncoding): TxmlParserInputBufferPtr; cdecl; external libxml2;
function xmlParserInputBufferCreateMem(mem: pchar; size: longint; enc: TxmlCharEncoding): TxmlParserInputBufferPtr; cdecl; external libxml2;
function xmlParserInputBufferCreateStatic(mem: pchar; size: longint; enc: TxmlCharEncoding): TxmlParserInputBufferPtr; cdecl; external libxml2;
function xmlParserInputBufferCreateIO(ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; enc: TxmlCharEncoding): TxmlParserInputBufferPtr; cdecl; external libxml2;
function xmlParserInputBufferRead(in_: TxmlParserInputBufferPtr; len: longint): longint; cdecl; external libxml2;
function xmlParserInputBufferGrow(in_: TxmlParserInputBufferPtr; len: longint): longint; cdecl; external libxml2;
function xmlParserInputBufferPush(in_: TxmlParserInputBufferPtr; len: longint; buf: pchar): longint; cdecl; external libxml2;
procedure xmlFreeParserInputBuffer(in_: TxmlParserInputBufferPtr); cdecl; external libxml2;
function xmlParserGetDirectory(filename: pchar): pchar; cdecl; external libxml2;
function xmlRegisterInputCallbacks(matchFunc: TxmlInputMatchCallback; openFunc: TxmlInputOpenCallback; readFunc: TxmlInputReadCallback; closeFunc: TxmlInputCloseCallback): longint; cdecl; external libxml2;
function __xmlParserInputBufferCreateFilename(URI: pchar; enc: TxmlCharEncoding): TxmlParserInputBufferPtr; cdecl; external libxml2;
procedure xmlCleanupOutputCallbacks; cdecl; external libxml2;
function xmlPopOutputCallbacks: longint; cdecl; external libxml2;
procedure xmlRegisterDefaultOutputCallbacks; cdecl; external libxml2;
function xmlAllocOutputBuffer(encoder: TxmlCharEncodingHandlerPtr): TxmlOutputBufferPtr; cdecl; external libxml2;
function xmlOutputBufferCreateFilename(URI: pchar; encoder: TxmlCharEncodingHandlerPtr; compression: longint): TxmlOutputBufferPtr; cdecl; external libxml2;
function xmlOutputBufferCreateFile(file_: PFILE; encoder: TxmlCharEncodingHandlerPtr): TxmlOutputBufferPtr; cdecl; external libxml2;
function xmlOutputBufferCreateBuffer(buffer: TxmlBufferPtr; encoder: TxmlCharEncodingHandlerPtr): TxmlOutputBufferPtr; cdecl; external libxml2;
function xmlOutputBufferCreateFd(fd: longint; encoder: TxmlCharEncodingHandlerPtr): TxmlOutputBufferPtr; cdecl; external libxml2;
function xmlOutputBufferCreateIO(iowrite: TxmlOutputWriteCallback; ioclose: TxmlOutputCloseCallback; ioctx: pointer; encoder: TxmlCharEncodingHandlerPtr): TxmlOutputBufferPtr; cdecl; external libxml2;
function xmlOutputBufferGetContent(out_: TxmlOutputBufferPtr): PxmlChar; cdecl; external libxml2;
function xmlOutputBufferGetSize(out_: TxmlOutputBufferPtr): Tsize_t; cdecl; external libxml2;
function xmlOutputBufferWrite(out_: TxmlOutputBufferPtr; len: longint; buf: pchar): longint; cdecl; external libxml2;
function xmlOutputBufferWriteString(out_: TxmlOutputBufferPtr; str: pchar): longint; cdecl; external libxml2;
function xmlOutputBufferWriteEscape(out_: TxmlOutputBufferPtr; str: PxmlChar; escaping: TxmlCharEncodingOutputFunc): longint; cdecl; external libxml2;
function xmlOutputBufferFlush(out_: TxmlOutputBufferPtr): longint; cdecl; external libxml2;
function xmlOutputBufferClose(out_: TxmlOutputBufferPtr): longint; cdecl; external libxml2;
function xmlRegisterOutputCallbacks(matchFunc: TxmlOutputMatchCallback; openFunc: TxmlOutputOpenCallback; writeFunc: TxmlOutputWriteCallback; closeFunc: TxmlOutputCloseCallback): longint; cdecl; external libxml2;
function __xmlOutputBufferCreateFilename(URI: pchar; encoder: TxmlCharEncodingHandlerPtr; compression: longint): TxmlOutputBufferPtr; cdecl; external libxml2;
procedure xmlRegisterHTTPPostCallbacks; cdecl; external libxml2;

function xmlCheckHTTPInput(ctxt: TxmlParserCtxtPtr; ret: TxmlParserInputPtr): TxmlParserInputPtr; cdecl; external libxml2;
function xmlNoNetExternalEntityLoader(URL: pchar; ID: pchar; ctxt: TxmlParserCtxtPtr): TxmlParserInputPtr; cdecl; external libxml2;
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


implementation



end.

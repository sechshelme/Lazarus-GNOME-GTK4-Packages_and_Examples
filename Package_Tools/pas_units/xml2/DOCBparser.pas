unit DOCBparser;

interface

uses
  ctypes, xml2_common, xmlstring, encoding, tree, parser;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PdocbParserCtxt = ^TdocbParserCtxt;
  TdocbParserCtxt = TxmlParserCtxt;

  PdocbParserCtxtPtr = ^TdocbParserCtxtPtr;
  TdocbParserCtxtPtr = TxmlParserCtxtPtr;

  PdocbSAXHandler = ^TdocbSAXHandler;
  TdocbSAXHandler = TxmlSAXHandler;

  PdocbSAXHandlerPtr = ^TdocbSAXHandlerPtr;
  TdocbSAXHandlerPtr = TxmlSAXHandlerPtr;

  PdocbParserInput = ^TdocbParserInput;
  TdocbParserInput = TxmlParserInput;

  PdocbParserInputPtr = ^TdocbParserInputPtr;
  TdocbParserInputPtr = TxmlParserInputPtr;

  PdocbDocPtr = ^TdocbDocPtr;
  TdocbDocPtr = TxmlDocPtr;

function docbEncodeEntities(out_: pbyte; outlen: Plongint; in_: pbyte; inlen: Plongint; quoteChar: longint): longint; cdecl; external libxml2;
function docbSAXParseDoc(cur: PxmlChar; encoding: pchar; sax: TdocbSAXHandlerPtr; userData: pointer): TdocbDocPtr; cdecl; external libxml2;
function docbParseDoc(cur: PxmlChar; encoding: pchar): TdocbDocPtr; cdecl; external libxml2;
function docbSAXParseFile(filename: pchar; encoding: pchar; sax: TdocbSAXHandlerPtr; userData: pointer): TdocbDocPtr; cdecl; external libxml2;
function docbParseFile(filename: pchar; encoding: pchar): TdocbDocPtr; cdecl; external libxml2;
procedure docbFreeParserCtxt(ctxt: TdocbParserCtxtPtr); cdecl; external libxml2;
function docbCreatePushParserCtxt(sax: TdocbSAXHandlerPtr; user_data: pointer; chunk: pchar; size: longint; filename: pchar;
  enc: TxmlCharEncoding): TdocbParserCtxtPtr; cdecl; external libxml2;
function docbParseChunk(ctxt: TdocbParserCtxtPtr; chunk: pchar; size: longint; terminate: longint): longint; cdecl; external libxml2;
function docbCreateFileParserCtxt(filename: pchar; encoding: pchar): TdocbParserCtxtPtr; cdecl; external libxml2;
function docbParseDocument(ctxt: TdocbParserCtxtPtr): longint; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:52:03 ===


implementation



end.

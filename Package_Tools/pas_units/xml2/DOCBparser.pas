unit DOCBparser;

interface

uses
  ctypes, xml2_common, xmlstring, encoding, tree, parser;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TdocbParserCtxt = TxmlParserCtxt;
  PdocbParserCtxt = PxmlParserCtxt;

  TdocbSAXHandler = TxmlSAXHandler;
  PdocbSAXHandler = PxmlSAXHandler;

  TdocbParserInput = TxmlParserInput;
  PdocbParserInput = PxmlParserInput;

  TdocbDoc = TxmlDoc;
  PdocbDoc = PxmlDoc;

function docbEncodeEntities(out_: pbyte; outlen: Plongint; in_: pbyte; inlen: Plongint; quoteChar: longint): longint; cdecl; external libxml2;
function docbSAXParseDoc(cur: PxmlChar; encoding: pchar; sax: PdocbSAXHandler; userData: pointer): PdocbDoc; cdecl; external libxml2;
function docbParseDoc(cur: PxmlChar; encoding: pchar): PdocbDoc; cdecl; external libxml2;
function docbSAXParseFile(filename: pchar; encoding: pchar; sax: PdocbSAXHandler; userData: pointer): PdocbDoc; cdecl; external libxml2;
function docbParseFile(filename: pchar; encoding: pchar): PdocbDoc; cdecl; external libxml2;
procedure docbFreeParserCtxt(ctxt: PdocbParserCtxt); cdecl; external libxml2;
function docbCreatePushParserCtxt(sax: PdocbSAXHandler; user_data: pointer; chunk: pchar; size: longint; filename: pchar;
  enc: TxmlCharEncoding): PdocbParserCtxt; cdecl; external libxml2;
function docbParseChunk(ctxt: PdocbParserCtxt; chunk: pchar; size: longint; terminate: longint): longint; cdecl; external libxml2;
function docbCreateFileParserCtxt(filename: pchar; encoding: pchar): PdocbParserCtxt; cdecl; external libxml2;
function docbParseDocument(ctxt: PdocbParserCtxt): longint; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:52:03 ===


implementation



end.

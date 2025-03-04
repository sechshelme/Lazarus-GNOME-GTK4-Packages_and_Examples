unit xmlsave;

interface

uses
  ctypes, xml2_common, xmlIO, tree, encoding;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlSaveOption = ^TxmlSaveOption;
  TxmlSaveOption = longint;

const
  XML_SAVE_FORMAT = 1 shl 0;
  XML_SAVE_NO_DECL = 1 shl 1;
  XML_SAVE_NO_EMPTY = 1 shl 2;
  XML_SAVE_NO_XHTML = 1 shl 3;
  XML_SAVE_XHTML = 1 shl 4;
  XML_SAVE_AS_XML = 1 shl 5;
  XML_SAVE_AS_HTML = 1 shl 6;
  XML_SAVE_WSNONSIG = 1 shl 7;

type
  TxmlSaveCtxt = record
  end;
  PxmlSaveCtxt = ^TxmlSaveCtxt;

  PxmlSaveCtxtPtr = ^TxmlSaveCtxtPtr;
  TxmlSaveCtxtPtr = PxmlSaveCtxt;

function xmlSaveToFd(fd: longint; encoding: pchar; options: longint): TxmlSaveCtxtPtr; cdecl; external libxml2;
function xmlSaveToFilename(filename: pchar; encoding: pchar; options: longint): TxmlSaveCtxtPtr; cdecl; external libxml2;
function xmlSaveToBuffer(buffer: TxmlBufferPtr; encoding: pchar; options: longint): TxmlSaveCtxtPtr; cdecl; external libxml2;
function xmlSaveToIO(iowrite: TxmlOutputWriteCallback; ioclose: TxmlOutputCloseCallback; ioctx: pointer; encoding: pchar; options: longint): TxmlSaveCtxtPtr; cdecl; external libxml2;
function xmlSaveDoc(ctxt: TxmlSaveCtxtPtr; doc: TxmlDocPtr): longint; cdecl; external libxml2;
function xmlSaveTree(ctxt: TxmlSaveCtxtPtr; node: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlSaveFlush(ctxt: TxmlSaveCtxtPtr): longint; cdecl; external libxml2;
function xmlSaveClose(ctxt: TxmlSaveCtxtPtr): longint; cdecl; external libxml2;
function xmlSaveSetEscape(ctxt: TxmlSaveCtxtPtr; escape: TxmlCharEncodingOutputFunc): longint; cdecl; external libxml2;
function xmlSaveSetAttrEscape(ctxt: TxmlSaveCtxtPtr; escape: TxmlCharEncodingOutputFunc): longint; cdecl; external libxml2;

// === Konventiert am: 4-3-25 13:30:21 ===


implementation



end.

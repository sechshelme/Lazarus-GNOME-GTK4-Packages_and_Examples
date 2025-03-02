unit HTMLparser;

interface

uses
  ctypes, xml2_common, xmlstring, xmlIO, tree, parser, encoding;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PhtmlParserCtxt = ^ThtmlParserCtxt;
  ThtmlParserCtxt = TxmlParserCtxt;

  PhtmlParserCtxtPtr = ^ThtmlParserCtxtPtr;
  ThtmlParserCtxtPtr = TxmlParserCtxtPtr;

  PhtmlParserNodeInfo = ^ThtmlParserNodeInfo;
  ThtmlParserNodeInfo = TxmlParserNodeInfo;

  PhtmlSAXHandler = ^ThtmlSAXHandler;
  ThtmlSAXHandler = TxmlSAXHandler;

  PhtmlSAXHandlerPtr = ^ThtmlSAXHandlerPtr;
  ThtmlSAXHandlerPtr = TxmlSAXHandlerPtr;

  PhtmlParserInput = ^ThtmlParserInput;
  ThtmlParserInput = TxmlParserInput;

  PhtmlParserInputPtr = ^ThtmlParserInputPtr;
  ThtmlParserInputPtr = TxmlParserInputPtr;

  PhtmlDocPtr = ^ThtmlDocPtr;
  ThtmlDocPtr = TxmlDocPtr;

  PhtmlNodePtr = ^ThtmlNodePtr;
  ThtmlNodePtr = TxmlNodePtr;

  PhtmlElemDescPtr = ^ThtmlElemDescPtr;
  ThtmlElemDescPtr = ^ThtmlElemDesc;
  PhtmlElemDesc = ^ThtmlElemDesc;

  ThtmlElemDesc = record
    Name: pchar;
    startTag: char;
    endTag: char;
    saveEndTag: char;
    empty: char;
    depr: char;
    dtd: char;
    isinline: char;
    desc: pchar;
    subelts: ^pchar;
    defaultsubelt: pchar;
    attrs_opt: ^pchar;
    attrs_depr: ^pchar;
    attrs_req: ^pchar;
  end;

  PhtmlEntityDescPtr = ^ThtmlEntityDescPtr;
  ThtmlEntityDescPtr = ^ThtmlEntityDesc;
  PhtmlEntityDesc = ^ThtmlEntityDesc;

  ThtmlEntityDesc = record
    Value: dword;
    Name: pchar;
    desc: pchar;
  end;

function htmlTagLookup(tag: PxmlChar): PhtmlElemDesc; cdecl; external libxml2;
function htmlEntityLookup(Name: PxmlChar): PhtmlEntityDesc; cdecl; external libxml2;
function htmlEntityValueLookup(Value: dword): PhtmlEntityDesc; cdecl; external libxml2;
function htmlIsAutoClosed(doc: ThtmlDocPtr; elem: ThtmlNodePtr): longint; cdecl; external libxml2;
function htmlAutoCloseTag(doc: ThtmlDocPtr; Name: PxmlChar; elem: ThtmlNodePtr): longint; cdecl; external libxml2;
function htmlParseEntityRef(ctxt: ThtmlParserCtxtPtr; str: PPxmlChar): PhtmlEntityDesc; cdecl; external libxml2;
function htmlParseCharRef(ctxt: ThtmlParserCtxtPtr): longint; cdecl; external libxml2;
procedure htmlParseElement(ctxt: ThtmlParserCtxtPtr); cdecl; external libxml2;
function htmlNewParserCtxt: ThtmlParserCtxtPtr; cdecl; external libxml2;
function htmlCreateMemoryParserCtxt(buffer: pchar; size: longint): ThtmlParserCtxtPtr; cdecl; external libxml2;
function htmlParseDocument(ctxt: ThtmlParserCtxtPtr): longint; cdecl; external libxml2;
function htmlSAXParseDoc(cur: PxmlChar; encoding: pchar; sax: ThtmlSAXHandlerPtr; userData: pointer): ThtmlDocPtr; cdecl; external libxml2;
function htmlParseDoc(cur: PxmlChar; encoding: pchar): ThtmlDocPtr; cdecl; external libxml2;
function htmlSAXParseFile(filename: pchar; encoding: pchar; sax: ThtmlSAXHandlerPtr; userData: pointer): ThtmlDocPtr; cdecl; external libxml2;
function htmlParseFile(filename: pchar; encoding: pchar): ThtmlDocPtr; cdecl; external libxml2;
function UTF8ToHtml(out_: pbyte; outlen: Plongint; in_: pbyte; inlen: Plongint): longint; cdecl; external libxml2;
function htmlEncodeEntities(out_: pbyte; outlen: Plongint; in_: pbyte; inlen: Plongint; quoteChar: longint): longint; cdecl; external libxml2;
function htmlIsScriptAttribute(Name: PxmlChar): longint; cdecl; external libxml2;
function htmlHandleOmittedElem(val: longint): longint; cdecl; external libxml2;
function htmlCreatePushParserCtxt(sax: ThtmlSAXHandlerPtr; user_data: pointer; chunk: pchar; size: longint; filename: pchar;
  enc: TxmlCharEncoding): ThtmlParserCtxtPtr; cdecl; external libxml2;
function htmlParseChunk(ctxt: ThtmlParserCtxtPtr; chunk: pchar; size: longint; terminate: longint): longint; cdecl; external libxml2;
procedure htmlFreeParserCtxt(ctxt: ThtmlParserCtxtPtr); cdecl; external libxml2;

type
  PhtmlParserOption = ^ThtmlParserOption;
  ThtmlParserOption = longint;

const
  HTML_PARSE_RECOVER = 1 shl 0;
  HTML_PARSE_NODEFDTD = 1 shl 2;
  HTML_PARSE_NOERROR = 1 shl 5;
  HTML_PARSE_NOWARNING = 1 shl 6;
  HTML_PARSE_PEDANTIC = 1 shl 7;
  HTML_PARSE_NOBLANKS = 1 shl 8;
  HTML_PARSE_NONET = 1 shl 11;
  HTML_PARSE_NOIMPLIED = 1 shl 13;
  HTML_PARSE_COMPACT = 1 shl 16;
  HTML_PARSE_IGNORE_ENC = 1 shl 21;

procedure htmlCtxtReset(ctxt: ThtmlParserCtxtPtr); cdecl; external libxml2;
function htmlCtxtUseOptions(ctxt: ThtmlParserCtxtPtr; options: longint): longint; cdecl; external libxml2;
function htmlReadDoc(cur: PxmlChar; URL: pchar; encoding: pchar; options: longint): ThtmlDocPtr; cdecl; external libxml2;
function htmlReadFile(URL: pchar; encoding: pchar; options: longint): ThtmlDocPtr; cdecl; external libxml2;
function htmlReadMemory(buffer: pchar; size: longint; URL: pchar; encoding: pchar; options: longint): ThtmlDocPtr; cdecl; external libxml2;
function htmlReadFd(fd: longint; URL: pchar; encoding: pchar; options: longint): ThtmlDocPtr; cdecl; external libxml2;
function htmlReadIO(ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; URL: pchar; encoding: pchar;
  options: longint): ThtmlDocPtr; cdecl; external libxml2;
function htmlCtxtReadDoc(ctxt: TxmlParserCtxtPtr; cur: PxmlChar; URL: pchar; encoding: pchar; options: longint): ThtmlDocPtr; cdecl; external libxml2;
function htmlCtxtReadFile(ctxt: TxmlParserCtxtPtr; filename: pchar; encoding: pchar; options: longint): ThtmlDocPtr; cdecl; external libxml2;
function htmlCtxtReadMemory(ctxt: TxmlParserCtxtPtr; buffer: pchar; size: longint; URL: pchar; encoding: pchar;
  options: longint): ThtmlDocPtr; cdecl; external libxml2;
function htmlCtxtReadFd(ctxt: TxmlParserCtxtPtr; fd: longint; URL: pchar; encoding: pchar; options: longint): ThtmlDocPtr; cdecl; external libxml2;
function htmlCtxtReadIO(ctxt: TxmlParserCtxtPtr; ioread: TxmlInputReadCallback; ioclose: TxmlInputCloseCallback; ioctx: pointer; URL: pchar;
  encoding: pchar; options: longint): ThtmlDocPtr; cdecl; external libxml2;

type
  PhtmlStatus = ^ThtmlStatus;
  ThtmlStatus = longint;

const
  HTML_NA = 0;
  HTML_INVALID = $1;
  HTML_DEPRECATED = $2;
  HTML_VALID = $4;
  HTML_REQUIRED = $c;

function htmlAttrAllowed(para1: PhtmlElemDesc; para2: PxmlChar; para3: longint): ThtmlStatus; cdecl; external libxml2;
function htmlElementAllowedHere(para1: PhtmlElemDesc; para2: PxmlChar): longint; cdecl; external libxml2;
function htmlElementStatusHere(para1: PhtmlElemDesc; para2: PhtmlElemDesc): ThtmlStatus; cdecl; external libxml2;
function htmlNodeStatus(para1: ThtmlNodePtr; para2: longint): ThtmlStatus; cdecl; external libxml2;

function htmlDefaultSubelement(elt: PhtmlElemDesc): pchar;
function htmlElementAllowedHereDesc(parent, elt: PhtmlElemDesc): longint;
function htmlRequiredAttrs(elt: PhtmlElemDesc): PPChar;

// === Konventiert am: 2-3-25 19:12:40 ===


implementation


function htmlDefaultSubelement(elt: PhtmlElemDesc): pchar;
begin
  htmlDefaultSubelement := elt^.defaultsubelt;
end;

function htmlElementAllowedHereDesc(parent, elt: PhtmlElemDesc): longint;
begin
  htmlElementAllowedHereDesc := htmlElementAllowedHere(parent, elt^.Name);
end;

function htmlRequiredAttrs(elt: PhtmlElemDesc): PPChar;
begin
  htmlRequiredAttrs := elt^.attrs_req;
end;


end.

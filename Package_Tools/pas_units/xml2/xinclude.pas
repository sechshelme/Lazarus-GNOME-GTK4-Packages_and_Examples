unit xinclude;

interface

uses
  ctypes, xml2_common, xmlstring, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlXIncludeCtxt = record
  end;
  PxmlXIncludeCtxt = ^TxmlXIncludeCtxt;

function xmlXIncludeProcess(doc: PxmlDoc): longint; cdecl; external libxml2;
function xmlXIncludeProcessFlags(doc: PxmlDoc; flags: longint): longint; cdecl; external libxml2;
function xmlXIncludeProcessFlagsData(doc: PxmlDoc; flags: longint; Data: pointer): longint; cdecl; external libxml2;
function xmlXIncludeProcessTreeFlagsData(tree: PxmlNode; flags: longint; Data: pointer): longint; cdecl; external libxml2;
function xmlXIncludeProcessTree(tree: PxmlNode): longint; cdecl; external libxml2;
function xmlXIncludeProcessTreeFlags(tree: PxmlNode; flags: longint): longint; cdecl; external libxml2;
function xmlXIncludeNewContext(doc: PxmlDoc): PxmlXIncludeCtxt; cdecl; external libxml2;
function xmlXIncludeSetFlags(ctxt: PxmlXIncludeCtxt; flags: longint): longint; cdecl; external libxml2;
procedure xmlXIncludeFreeContext(ctxt: PxmlXIncludeCtxt); cdecl; external libxml2;
function xmlXIncludeProcessNode(ctxt: PxmlXIncludeCtxt; tree: PxmlNode): longint; cdecl; external libxml2;

const
  XINCLUDE_NS: PxmlChar = 'http://www.w3.org/2003/XInclude';
  XINCLUDE_OLD_NS: PxmlChar = 'http://www.w3.org/2001/XInclude';
  XINCLUDE_NODE: PxmlChar = 'include';
  XINCLUDE_FALLBACK: PxmlChar = 'fallback';
  XINCLUDE_HREF: PxmlChar = 'href';
  XINCLUDE_PARSE: PxmlChar = 'parse';
  XINCLUDE_PARSE_XML: PxmlChar = 'xml';
  XINCLUDE_PARSE_TEXT: PxmlChar = 'text';
  XINCLUDE_PARSE_ENCODING: PxmlChar = 'encoding';
  XINCLUDE_PARSE_XPOINTER: PxmlChar = 'xpointer';

  // === Konventiert am: 4-3-25 13:30:17 ===


implementation


end.

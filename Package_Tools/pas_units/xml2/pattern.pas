unit pattern;

interface

uses
  ctypes, xml2_common, xmlstring, dict, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlPattern = record
  end;
  PxmlPattern = ^TxmlPattern;

  PxmlPatternPtr = ^TxmlPatternPtr;
  TxmlPatternPtr = PxmlPattern;

  PxmlPatternFlags = ^TxmlPatternFlags;
  TxmlPatternFlags = longint;

const
  XML_PATTERN_DEFAULT = 0;
  XML_PATTERN_XPATH = 1 shl 0;
  XML_PATTERN_XSSEL = 1 shl 1;
  XML_PATTERN_XSFIELD = 1 shl 2;

procedure xmlFreePattern(comp: TxmlPatternPtr); cdecl; external libxml2;
procedure xmlFreePatternList(comp: TxmlPatternPtr); cdecl; external libxml2;
function xmlPatterncompile(pattern: PxmlChar; dict: PxmlDict; flags: longint; namespaces: PPxmlChar): TxmlPatternPtr; cdecl; external libxml2;
function xmlPatternMatch(comp: TxmlPatternPtr; node: TxmlNodePtr): longint; cdecl; external libxml2;

type
  TxmlStreamCtxt = record
  end;
  PxmlStreamCtxt = ^TxmlStreamCtxt;

  PxmlStreamCtxtPtr = ^TxmlStreamCtxtPtr;
  TxmlStreamCtxtPtr = PxmlStreamCtxt;

function xmlPatternStreamable(comp: TxmlPatternPtr): longint; cdecl; external libxml2;
function xmlPatternMaxDepth(comp: TxmlPatternPtr): longint; cdecl; external libxml2;
function xmlPatternMinDepth(comp: TxmlPatternPtr): longint; cdecl; external libxml2;
function xmlPatternFromRoot(comp: TxmlPatternPtr): longint; cdecl; external libxml2;
function xmlPatternGetStreamCtxt(comp: TxmlPatternPtr): TxmlStreamCtxtPtr; cdecl; external libxml2;
procedure xmlFreeStreamCtxt(stream: TxmlStreamCtxtPtr); cdecl; external libxml2;
function xmlStreamPushNode(stream: TxmlStreamCtxtPtr; Name: PxmlChar; ns: PxmlChar; nodeType: longint): longint; cdecl; external libxml2;
function xmlStreamPush(stream: TxmlStreamCtxtPtr; Name: PxmlChar; ns: PxmlChar): longint; cdecl; external libxml2;
function xmlStreamPushAttr(stream: TxmlStreamCtxtPtr; Name: PxmlChar; ns: PxmlChar): longint; cdecl; external libxml2;
function xmlStreamPop(stream: TxmlStreamCtxtPtr): longint; cdecl; external libxml2;
function xmlStreamWantsAnyNode(stream: TxmlStreamCtxtPtr): longint; cdecl; external libxml2;

// === Konventiert am: 4-3-25 13:30:07 ===


implementation



end.

unit xpointer;

interface

uses
  ctypes, xml2_common, xmlstring, xpath, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlLocationSetPtr = ^TxmlLocationSetPtr;
  TxmlLocationSetPtr = ^TxmlLocationSet;
  PxmlLocationSet = ^TxmlLocationSet;

  TxmlLocationSet = record
    locNr: longint;
    locMax: longint;
    locTab: ^PxmlXPathObject;
  end;

function xmlXPtrLocationSetCreate(val: PxmlXPathObject): TxmlLocationSetPtr; cdecl; external libxml2;
procedure xmlXPtrFreeLocationSet(obj: TxmlLocationSetPtr); cdecl; external libxml2;
function xmlXPtrLocationSetMerge(val1: TxmlLocationSetPtr; val2: TxmlLocationSetPtr): TxmlLocationSetPtr; cdecl; external libxml2;
function xmlXPtrNewRange(start: TxmlNodePtr; startindex: longint; end_: TxmlNodePtr; endindex: longint): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangePoints(start: PxmlXPathObject; end_: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangeNodePoint(start: TxmlNodePtr; end_: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangePointNode(start: PxmlXPathObject; end_: TxmlNodePtr): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangeNodes(start: TxmlNodePtr; end_: TxmlNodePtr): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewLocationSetNodes(start: TxmlNodePtr; end_: TxmlNodePtr): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewLocationSetNodeSet(set_: PxmlNodeSet): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangeNodeObject(start: TxmlNodePtr; end_: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewCollapsedRange(start: TxmlNodePtr): PxmlXPathObject; cdecl; external libxml2;
procedure xmlXPtrLocationSetAdd(cur: TxmlLocationSetPtr; val: PxmlXPathObject); cdecl; external libxml2;
function xmlXPtrWrapLocationSet(val: TxmlLocationSetPtr): PxmlXPathObject; cdecl; external libxml2;
procedure xmlXPtrLocationSetDel(cur: TxmlLocationSetPtr; val: PxmlXPathObject); cdecl; external libxml2;
procedure xmlXPtrLocationSetRemove(cur: TxmlLocationSetPtr; val: longint); cdecl; external libxml2;
function xmlXPtrNewContext(doc: TxmlDocPtr; here: TxmlNodePtr; origin: TxmlNodePtr): PxmlXPathContext; cdecl; external libxml2;
function xmlXPtrEval(str: PxmlChar; ctx: PxmlXPathContext): PxmlXPathObject; cdecl; external libxml2;
procedure xmlXPtrRangeToFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
function xmlXPtrBuildNodeList(obj: PxmlXPathObject): TxmlNodePtr; cdecl; external libxml2;
procedure xmlXPtrEvalRangePredicate(ctxt: PxmlXPathParserContext); cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:52:10 ===


implementation



end.

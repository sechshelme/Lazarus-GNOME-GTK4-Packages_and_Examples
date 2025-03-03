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
    locTab: PxmlXPathObjectPtr;
  end;

function xmlXPtrLocationSetCreate(val: TxmlXPathObjectPtr): TxmlLocationSetPtr; cdecl; external libxml2;
procedure xmlXPtrFreeLocationSet(obj: TxmlLocationSetPtr); cdecl; external libxml2;
function xmlXPtrLocationSetMerge(val1: TxmlLocationSetPtr; val2: TxmlLocationSetPtr): TxmlLocationSetPtr; cdecl; external libxml2;
function xmlXPtrNewRange(start: TxmlNodePtr; startindex: longint; end_: TxmlNodePtr; endindex: longint): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPtrNewRangePoints(start: TxmlXPathObjectPtr; end_: TxmlXPathObjectPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPtrNewRangeNodePoint(start: TxmlNodePtr; end_: TxmlXPathObjectPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPtrNewRangePointNode(start: TxmlXPathObjectPtr; end_: TxmlNodePtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPtrNewRangeNodes(start: TxmlNodePtr; end_: TxmlNodePtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPtrNewLocationSetNodes(start: TxmlNodePtr; end_: TxmlNodePtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPtrNewLocationSetNodeSet(set_: TxmlNodeSetPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPtrNewRangeNodeObject(start: TxmlNodePtr; end_: TxmlXPathObjectPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPtrNewCollapsedRange(start: TxmlNodePtr): TxmlXPathObjectPtr; cdecl; external libxml2;
procedure xmlXPtrLocationSetAdd(cur: TxmlLocationSetPtr; val: TxmlXPathObjectPtr); cdecl; external libxml2;
function xmlXPtrWrapLocationSet(val: TxmlLocationSetPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
procedure xmlXPtrLocationSetDel(cur: TxmlLocationSetPtr; val: TxmlXPathObjectPtr); cdecl; external libxml2;
procedure xmlXPtrLocationSetRemove(cur: TxmlLocationSetPtr; val: longint); cdecl; external libxml2;
function xmlXPtrNewContext(doc: TxmlDocPtr; here: TxmlNodePtr; origin: TxmlNodePtr): TxmlXPathContextPtr; cdecl; external libxml2;
function xmlXPtrEval(str: PxmlChar; ctx: TxmlXPathContextPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
procedure xmlXPtrRangeToFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
function xmlXPtrBuildNodeList(obj: TxmlXPathObjectPtr): TxmlNodePtr; cdecl; external libxml2;
procedure xmlXPtrEvalRangePredicate(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:52:10 ===


implementation



end.

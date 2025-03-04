unit xpointer;

interface

uses
  ctypes, xml2_common, xmlstring, xpath, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlLocationSet = record
    locNr: longint;
    locMax: longint;
    locTab: ^PxmlXPathObject;
  end;
  PxmlLocationSet = ^TxmlLocationSet;

function xmlXPtrLocationSetCreate(val: PxmlXPathObject): PxmlLocationSet; cdecl; external libxml2;
procedure xmlXPtrFreeLocationSet(obj: PxmlLocationSet); cdecl; external libxml2;
function xmlXPtrLocationSetMerge(val1: PxmlLocationSet; val2: PxmlLocationSet): PxmlLocationSet; cdecl; external libxml2;
function xmlXPtrNewRange(start: PxmlNode; startindex: longint; end_: PxmlNode; endindex: longint): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangePoints(start: PxmlXPathObject; end_: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangeNodePoint(start: PxmlNode; end_: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangePointNode(start: PxmlXPathObject; end_: PxmlNode): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangeNodes(start: PxmlNode; end_: PxmlNode): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewLocationSetNodes(start: PxmlNode; end_: PxmlNode): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewLocationSetNodeSet(set_: PxmlNodeSet): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewRangeNodeObject(start: PxmlNode; end_: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPtrNewCollapsedRange(start: PxmlNode): PxmlXPathObject; cdecl; external libxml2;
procedure xmlXPtrLocationSetAdd(cur: PxmlLocationSet; val: PxmlXPathObject); cdecl; external libxml2;
function xmlXPtrWrapLocationSet(val: PxmlLocationSet): PxmlXPathObject; cdecl; external libxml2;
procedure xmlXPtrLocationSetDel(cur: PxmlLocationSet; val: PxmlXPathObject); cdecl; external libxml2;
procedure xmlXPtrLocationSetRemove(cur: PxmlLocationSet; val: longint); cdecl; external libxml2;
function xmlXPtrNewContext(doc: PxmlDoc; here: PxmlNode; origin: PxmlNode): PxmlXPathContext; cdecl; external libxml2;
function xmlXPtrEval(str: PxmlChar; ctx: PxmlXPathContext): PxmlXPathObject; cdecl; external libxml2;
procedure xmlXPtrRangeToFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
function xmlXPtrBuildNodeList(obj: PxmlXPathObject): PxmlNode; cdecl; external libxml2;
procedure xmlXPtrEvalRangePredicate(ctxt: PxmlXPathParserContext); cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:52:10 ===


implementation



end.

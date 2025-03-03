unit xpathInternals;

interface

uses
  ctypes, xml2_common, xmlstring, xpath, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function xmlXPathPopBoolean(ctxt: TxmlXPathParserContextPtr): longint; cdecl; external libxml2;
function xmlXPathPopNumber(ctxt: TxmlXPathParserContextPtr): cdouble; cdecl; external libxml2;
function xmlXPathPopString(ctxt: TxmlXPathParserContextPtr): PxmlChar; cdecl; external libxml2;
function xmlXPathPopNodeSet(ctxt: TxmlXPathParserContextPtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathPopExternal(ctxt: TxmlXPathParserContextPtr): pointer; cdecl; external libxml2;

procedure xmlXPathRegisterVariableLookup(ctxt: TxmlXPathContextPtr; f: TxmlXPathVariableLookupFunc; Data: pointer); cdecl; external libxml2;
procedure xmlXPathRegisterFuncLookup(ctxt: TxmlXPathContextPtr; f: TxmlXPathFuncLookupFunc; funcCtxt: pointer); cdecl; external libxml2;
procedure xmlXPatherror(ctxt: TxmlXPathParserContextPtr; file_: pchar; line: longint; no: longint); cdecl; external libxml2;
procedure xmlXPathErr(ctxt: TxmlXPathParserContextPtr; error: longint); cdecl; external libxml2;

procedure xmlXPathDebugDumpObject(output: PFILE; cur: TxmlXPathObjectPtr; depth: longint); cdecl; external libxml2;
procedure xmlXPathDebugDumpCompExpr(output: PFILE; comp: TxmlXPathCompExprPtr; depth: longint); cdecl; external libxml2;

function xmlXPathNodeSetContains(cur: TxmlNodeSetPtr; val: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlXPathDifference(nodes1: TxmlNodeSetPtr; nodes2: TxmlNodeSetPtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathIntersection(nodes1: TxmlNodeSetPtr; nodes2: TxmlNodeSetPtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathDistinctSorted(nodes: TxmlNodeSetPtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathDistinct(nodes: TxmlNodeSetPtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathHasSameNodes(nodes1: TxmlNodeSetPtr; nodes2: TxmlNodeSetPtr): longint; cdecl; external libxml2;
function xmlXPathNodeLeadingSorted(nodes: TxmlNodeSetPtr; node: TxmlNodePtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathLeadingSorted(nodes1: TxmlNodeSetPtr; nodes2: TxmlNodeSetPtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathNodeLeading(nodes: TxmlNodeSetPtr; node: TxmlNodePtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathLeading(nodes1: TxmlNodeSetPtr; nodes2: TxmlNodeSetPtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathNodeTrailingSorted(nodes: TxmlNodeSetPtr; node: TxmlNodePtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathTrailingSorted(nodes1: TxmlNodeSetPtr; nodes2: TxmlNodeSetPtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathNodeTrailing(nodes: TxmlNodeSetPtr; node: TxmlNodePtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathTrailing(nodes1: TxmlNodeSetPtr; nodes2: TxmlNodeSetPtr): TxmlNodeSetPtr; cdecl; external libxml2;
function xmlXPathRegisterNs(ctxt: TxmlXPathContextPtr; prefix: PxmlChar; ns_uri: PxmlChar): longint; cdecl; external libxml2;
function xmlXPathNsLookup(ctxt: TxmlXPathContextPtr; prefix: PxmlChar): PxmlChar; cdecl; external libxml2;
procedure xmlXPathRegisteredNsCleanup(ctxt: TxmlXPathContextPtr); cdecl; external libxml2;
function xmlXPathRegisterFunc(ctxt: TxmlXPathContextPtr; Name: PxmlChar; f: TxmlXPathFunction): longint; cdecl; external libxml2;
function xmlXPathRegisterFuncNS(ctxt: TxmlXPathContextPtr; Name: PxmlChar; ns_uri: PxmlChar; f: TxmlXPathFunction): longint; cdecl; external libxml2;
function xmlXPathRegisterVariable(ctxt: TxmlXPathContextPtr; Name: PxmlChar; Value: TxmlXPathObjectPtr): longint; cdecl; external libxml2;
function xmlXPathRegisterVariableNS(ctxt: TxmlXPathContextPtr; Name: PxmlChar; ns_uri: PxmlChar; Value: TxmlXPathObjectPtr): longint; cdecl; external libxml2;
function xmlXPathFunctionLookup(ctxt: TxmlXPathContextPtr; Name: PxmlChar): TxmlXPathFunction; cdecl; external libxml2;
function xmlXPathFunctionLookupNS(ctxt: TxmlXPathContextPtr; Name: PxmlChar; ns_uri: PxmlChar): TxmlXPathFunction; cdecl; external libxml2;
procedure xmlXPathRegisteredFuncsCleanup(ctxt: TxmlXPathContextPtr); cdecl; external libxml2;
function xmlXPathVariableLookup(ctxt: TxmlXPathContextPtr; Name: PxmlChar): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathVariableLookupNS(ctxt: TxmlXPathContextPtr; Name: PxmlChar; ns_uri: PxmlChar): TxmlXPathObjectPtr; cdecl; external libxml2;
procedure xmlXPathRegisteredVariablesCleanup(ctxt: TxmlXPathContextPtr); cdecl; external libxml2;
function xmlXPathNewParserContext(str: PxmlChar; ctxt: TxmlXPathContextPtr): TxmlXPathParserContextPtr; cdecl; external libxml2;
procedure xmlXPathFreeParserContext(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;
function valuePop(ctxt: TxmlXPathParserContextPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function valuePush(ctxt: TxmlXPathParserContextPtr; Value: TxmlXPathObjectPtr): longint; cdecl; external libxml2;
function xmlXPathNewString(val: PxmlChar): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathNewCString(val: pchar): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathWrapString(val: PxmlChar): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathWrapCString(val: pchar): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathNewFloat(val: cdouble): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathNewBoolean(val: longint): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathNewNodeSet(val: TxmlNodePtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathNewValueTree(val: TxmlNodePtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathNodeSetAdd(cur: TxmlNodeSetPtr; val: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlXPathNodeSetAddUnique(cur: TxmlNodeSetPtr; val: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlXPathNodeSetAddNs(cur: TxmlNodeSetPtr; node: TxmlNodePtr; ns: TxmlNsPtr): longint; cdecl; external libxml2;
procedure xmlXPathNodeSetSort(set_: TxmlNodeSetPtr); cdecl; external libxml2;
procedure xmlXPathRoot(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;
procedure xmlXPathEvalExpr(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;
function xmlXPathParseName(ctxt: TxmlXPathParserContextPtr): PxmlChar; cdecl; external libxml2;
function xmlXPathParseNCName(ctxt: TxmlXPathParserContextPtr): PxmlChar; cdecl; external libxml2;
function xmlXPathStringEvalNumber(str: PxmlChar): cdouble; cdecl; external libxml2;
function xmlXPathEvaluatePredicateResult(ctxt: TxmlXPathParserContextPtr; res: TxmlXPathObjectPtr): longint; cdecl; external libxml2;
procedure xmlXPathRegisterAllFunctions(ctxt: TxmlXPathContextPtr); cdecl; external libxml2;
function xmlXPathNodeSetMerge(val1: TxmlNodeSetPtr; val2: TxmlNodeSetPtr): TxmlNodeSetPtr; cdecl; external libxml2;
procedure xmlXPathNodeSetDel(cur: TxmlNodeSetPtr; val: TxmlNodePtr); cdecl; external libxml2;
procedure xmlXPathNodeSetRemove(cur: TxmlNodeSetPtr; val: longint); cdecl; external libxml2;
function xmlXPathNewNodeSetList(val: TxmlNodeSetPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathWrapNodeSet(val: TxmlNodeSetPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathWrapExternal(val: pointer): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathEqualValues(ctxt: TxmlXPathParserContextPtr): longint; cdecl; external libxml2;
function xmlXPathNotEqualValues(ctxt: TxmlXPathParserContextPtr): longint; cdecl; external libxml2;
function xmlXPathCompareValues(ctxt: TxmlXPathParserContextPtr; inf: longint; strict: longint): longint; cdecl; external libxml2;
procedure xmlXPathValueFlipSign(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;
procedure xmlXPathAddValues(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;
procedure xmlXPathSubValues(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;
procedure xmlXPathMultValues(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;
procedure xmlXPathDivValues(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;
procedure xmlXPathModValues(ctxt: TxmlXPathParserContextPtr); cdecl; external libxml2;
function xmlXPathIsNodeType(Name: PxmlChar): longint; cdecl; external libxml2;
function xmlXPathNextSelf(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextChild(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextDescendant(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextDescendantOrSelf(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextParent(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextAncestorOrSelf(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextFollowingSibling(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextFollowing(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextNamespace(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextAttribute(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextPreceding(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextAncestor(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
function xmlXPathNextPrecedingSibling(ctxt: TxmlXPathParserContextPtr; cur: TxmlNodePtr): TxmlNodePtr; cdecl; external libxml2;
procedure xmlXPathLastFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathPositionFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathCountFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathIdFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathLocalNameFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNamespaceURIFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathStringFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathStringLengthFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathConcatFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathContainsFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathStartsWithFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathSubstringFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathSubstringBeforeFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathSubstringAfterFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNormalizeFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathTranslateFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNotFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathTrueFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathFalseFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathLangFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNumberFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathSumFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathFloorFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathCeilingFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathRoundFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathBooleanFunction(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNodeSetFreeNs(ns: TxmlNsPtr); cdecl; external libxml2;


function xmlXPathGetError(ctxt: TxmlXPathParserContextPtr): longint;
function xmlXPathCheckError(ctxt: TxmlXPathParserContextPtr): boolean;
function xmlXPathGetDocument(ctxt: TxmlXPathParserContextPtr): TxmlDocPtr;
function xmlXPathGetContextNode(ctxt: TxmlXPathParserContextPtr): TxmlNodePtr;

function xmlXPathReturnBoolean(ctxt: TxmlXPathParserContextPtr; val: longint): longint;
function xmlXPathReturnTrue(ctxt: TxmlXPathParserContextPtr): longint;
function xmlXPathReturnFalse(ctxt: TxmlXPathParserContextPtr): longint;
function xmlXPathReturnNumber(ctxt: TxmlXPathParserContextPtr; val: longint): longint;
function xmlXPathReturnString(ctxt: TxmlXPathParserContextPtr; str: PxmlChar): longint;
function xmlXPathReturnEmptyString(ctxt: TxmlXPathParserContextPtr): longint;
function xmlXPathReturnNodeSet(ctxt: TxmlXPathParserContextPtr; ns: TxmlNodeSetPtr): longint;
function xmlXPathReturnEmptyNodeSet(ctxt: TxmlXPathParserContextPtr): longint;
function xmlXPathReturnExternal(ctxt: TxmlXPathParserContextPtr; val: Pointer): longint;
function xmlXPathStackIsNodeSet(ctxt: TxmlXPathParserContextPtr): boolean;
function xmlXPathStackIsExternal(ctxt: TxmlXPathParserContextPtr): boolean;

// === Konventiert am: 2-3-25 17:56:58 ===


implementation


function xmlXPathGetError(ctxt: TxmlXPathParserContextPtr): longint;
begin
  xmlXPathGetError := ctxt^.error;
end;

function xmlXPathCheckError(ctxt: TxmlXPathParserContextPtr): boolean;
begin
  xmlXPathCheckError := (ctxt^.error) <> XPATH_EXPRESSION_OK;
end;

function xmlXPathGetDocument(ctxt: TxmlXPathParserContextPtr): TxmlDocPtr;
begin
  xmlXPathGetDocument := ctxt^.context^.doc;
end;

function xmlXPathGetContextNode(ctxt: TxmlXPathParserContextPtr): TxmlNodePtr;
begin
  xmlXPathGetContextNode := ctxt^.context^.node;
end;

function xmlXPathReturnBoolean(ctxt: TxmlXPathParserContextPtr; val: longint): longint;
begin
  xmlXPathReturnBoolean := valuePush(ctxt, xmlXPathNewBoolean(val));
end;

function xmlXPathReturnTrue(ctxt: TxmlXPathParserContextPtr): longint;
begin
  xmlXPathReturnTrue := xmlXPathReturnBoolean(ctxt, 1);
end;

function xmlXPathReturnFalse(ctxt: TxmlXPathParserContextPtr): longint;
begin
  xmlXPathReturnFalse := xmlXPathReturnBoolean(ctxt, 0);
end;

function xmlXPathReturnNumber(ctxt: TxmlXPathParserContextPtr; val: longint): longint;
begin
  xmlXPathReturnNumber := valuePush(ctxt, xmlXPathNewFloat(val));
end;

function xmlXPathReturnString(ctxt: TxmlXPathParserContextPtr; str: PxmlChar
  ): longint;
begin
  xmlXPathReturnString := valuePush(ctxt, xmlXPathWrapString(str));
end;

function xmlXPathReturnEmptyString(ctxt: TxmlXPathParserContextPtr): longint;
begin
  xmlXPathReturnEmptyString := valuePush(ctxt, xmlXPathNewCString(''));
end;

function xmlXPathReturnNodeSet(ctxt: TxmlXPathParserContextPtr; ns: TxmlNodeSetPtr): longint;
begin
  xmlXPathReturnNodeSet := valuePush(ctxt, xmlXPathWrapNodeSet(ns));
end;

function xmlXPathReturnEmptyNodeSet(ctxt: TxmlXPathParserContextPtr): longint;
begin
  xmlXPathReturnEmptyNodeSet := valuePush(ctxt, xmlXPathNewNodeSet(nil));
end;

function xmlXPathReturnExternal(ctxt: TxmlXPathParserContextPtr; val: Pointer): longint;
begin
  xmlXPathReturnExternal := valuePush(ctxt, xmlXPathWrapExternal(val));
end;

function xmlXPathStackIsNodeSet(ctxt: TxmlXPathParserContextPtr): boolean;
begin
  xmlXPathStackIsNodeSet := (ctxt^.Value <> nil) and (ctxt^.Value^._type = XPATH_NODESET) or (ctxt^.Value^._type = XPATH_XSLT_TREE);
end;

function xmlXPathStackIsExternal(ctxt: TxmlXPathParserContextPtr): boolean;
begin
  xmlXPathStackIsExternal := (ctxt^.Value <> nil) and (ctxt^.Value^._type = XPATH_USERS);
end;


end.

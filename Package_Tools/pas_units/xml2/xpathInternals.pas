unit xpathInternals;

interface

uses
  ctypes, xml2_common, xmlstring, xpath, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function xmlXPathPopBoolean(ctxt: PxmlXPathParserContext): longint; cdecl; external libxml2;
function xmlXPathPopNumber(ctxt: PxmlXPathParserContext): cdouble; cdecl; external libxml2;
function xmlXPathPopString(ctxt: PxmlXPathParserContext): PxmlChar; cdecl; external libxml2;
function xmlXPathPopNodeSet(ctxt: PxmlXPathParserContext): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathPopExternal(ctxt: PxmlXPathParserContext): pointer; cdecl; external libxml2;

procedure xmlXPathRegisterVariableLookup(ctxt: PxmlXPathContext; f: TxmlXPathVariableLookupFunc; Data: pointer); cdecl; external libxml2;
procedure xmlXPathRegisterFuncLookup(ctxt: PxmlXPathContext; f: TxmlXPathFuncLookupFunc; funcCtxt: pointer); cdecl; external libxml2;
procedure xmlXPatherror(ctxt: PxmlXPathParserContext; file_: pchar; line: longint; no: longint); cdecl; external libxml2;
procedure xmlXPathErr(ctxt: PxmlXPathParserContext; error: longint); cdecl; external libxml2;

procedure xmlXPathDebugDumpObject(output: PFILE; cur: PxmlXPathObject; depth: longint); cdecl; external libxml2;
procedure xmlXPathDebugDumpCompExpr(output: PFILE; comp: PxmlXPathCompExpr; depth: longint); cdecl; external libxml2;

function xmlXPathNodeSetContains(cur: PxmlNodeSet; val: PxmlNode): longint; cdecl; external libxml2;
function xmlXPathDifference(nodes1: PxmlNodeSet; nodes2: PxmlNodeSet): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathIntersection(nodes1: PxmlNodeSet; nodes2: PxmlNodeSet): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathDistinctSorted(nodes: PxmlNodeSet): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathDistinct(nodes: PxmlNodeSet): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathHasSameNodes(nodes1: PxmlNodeSet; nodes2: PxmlNodeSet): longint; cdecl; external libxml2;
function xmlXPathNodeLeadingSorted(nodes: PxmlNodeSet; node: PxmlNode): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathLeadingSorted(nodes1: PxmlNodeSet; nodes2: PxmlNodeSet): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathNodeLeading(nodes: PxmlNodeSet; node: PxmlNode): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathLeading(nodes1: PxmlNodeSet; nodes2: PxmlNodeSet): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathNodeTrailingSorted(nodes: PxmlNodeSet; node: PxmlNode): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathTrailingSorted(nodes1: PxmlNodeSet; nodes2: PxmlNodeSet): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathNodeTrailing(nodes: PxmlNodeSet; node: PxmlNode): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathTrailing(nodes1: PxmlNodeSet; nodes2: PxmlNodeSet): PxmlNodeSet; cdecl; external libxml2;
function xmlXPathRegisterNs(ctxt: PxmlXPathContext; prefix: PxmlChar; ns_uri: PxmlChar): longint; cdecl; external libxml2;
function xmlXPathNsLookup(ctxt: PxmlXPathContext; prefix: PxmlChar): PxmlChar; cdecl; external libxml2;
procedure xmlXPathRegisteredNsCleanup(ctxt: PxmlXPathContext); cdecl; external libxml2;
function xmlXPathRegisterFunc(ctxt: PxmlXPathContext; Name: PxmlChar; f: TxmlXPathFunction): longint; cdecl; external libxml2;
function xmlXPathRegisterFuncNS(ctxt: PxmlXPathContext; Name: PxmlChar; ns_uri: PxmlChar; f: TxmlXPathFunction): longint; cdecl; external libxml2;
function xmlXPathRegisterVariable(ctxt: PxmlXPathContext; Name: PxmlChar; Value: PxmlXPathObject): longint; cdecl; external libxml2;
function xmlXPathRegisterVariableNS(ctxt: PxmlXPathContext; Name: PxmlChar; ns_uri: PxmlChar; Value: PxmlXPathObject): longint; cdecl; external libxml2;
function xmlXPathFunctionLookup(ctxt: PxmlXPathContext; Name: PxmlChar): TxmlXPathFunction; cdecl; external libxml2;
function xmlXPathFunctionLookupNS(ctxt: PxmlXPathContext; Name: PxmlChar; ns_uri: PxmlChar): TxmlXPathFunction; cdecl; external libxml2;
procedure xmlXPathRegisteredFuncsCleanup(ctxt: PxmlXPathContext); cdecl; external libxml2;
function xmlXPathVariableLookup(ctxt: PxmlXPathContext; Name: PxmlChar): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathVariableLookupNS(ctxt: PxmlXPathContext; Name: PxmlChar; ns_uri: PxmlChar): PxmlXPathObject; cdecl; external libxml2;
procedure xmlXPathRegisteredVariablesCleanup(ctxt: PxmlXPathContext); cdecl; external libxml2;
function xmlXPathNewParserContext(str: PxmlChar; ctxt: PxmlXPathContext): PxmlXPathParserContext; cdecl; external libxml2;
procedure xmlXPathFreeParserContext(ctxt: PxmlXPathParserContext); cdecl; external libxml2;
function valuePop(ctxt: PxmlXPathParserContext): PxmlXPathObject; cdecl; external libxml2;
function valuePush(ctxt: PxmlXPathParserContext; Value: PxmlXPathObject): longint; cdecl; external libxml2;
function xmlXPathNewString(val: PxmlChar): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathNewCString(val: pchar): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathWrapString(val: PxmlChar): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathWrapCString(val: pchar): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathNewFloat(val: cdouble): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathNewBoolean(val: longint): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathNewNodeSet(val: PxmlNode): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathNewValueTree(val: PxmlNode): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathNodeSetAdd(cur: PxmlNodeSet; val: PxmlNode): longint; cdecl; external libxml2;
function xmlXPathNodeSetAddUnique(cur: PxmlNodeSet; val: PxmlNode): longint; cdecl; external libxml2;
function xmlXPathNodeSetAddNs(cur: PxmlNodeSet; node: PxmlNode; ns: PxmlNs): longint; cdecl; external libxml2;
procedure xmlXPathNodeSetSort(set_: PxmlNodeSet); cdecl; external libxml2;
procedure xmlXPathRoot(ctxt: PxmlXPathParserContext); cdecl; external libxml2;
procedure xmlXPathEvalExpr(ctxt: PxmlXPathParserContext); cdecl; external libxml2;
function xmlXPathParseName(ctxt: PxmlXPathParserContext): PxmlChar; cdecl; external libxml2;
function xmlXPathParseNCName(ctxt: PxmlXPathParserContext): PxmlChar; cdecl; external libxml2;
function xmlXPathStringEvalNumber(str: PxmlChar): cdouble; cdecl; external libxml2;
function xmlXPathEvaluatePredicateResult(ctxt: PxmlXPathParserContext; res: PxmlXPathObject): longint; cdecl; external libxml2;
procedure xmlXPathRegisterAllFunctions(ctxt: PxmlXPathContext); cdecl; external libxml2;
function xmlXPathNodeSetMerge(val1: PxmlNodeSet; val2: PxmlNodeSet): PxmlNodeSet; cdecl; external libxml2;
procedure xmlXPathNodeSetDel(cur: PxmlNodeSet; val: PxmlNode); cdecl; external libxml2;
procedure xmlXPathNodeSetRemove(cur: PxmlNodeSet; val: longint); cdecl; external libxml2;
function xmlXPathNewNodeSetList(val: PxmlNodeSet): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathWrapNodeSet(val: PxmlNodeSet): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathWrapExternal(val: pointer): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathEqualValues(ctxt: PxmlXPathParserContext): longint; cdecl; external libxml2;
function xmlXPathNotEqualValues(ctxt: PxmlXPathParserContext): longint; cdecl; external libxml2;
function xmlXPathCompareValues(ctxt: PxmlXPathParserContext; inf: longint; strict: longint): longint; cdecl; external libxml2;
procedure xmlXPathValueFlipSign(ctxt: PxmlXPathParserContext); cdecl; external libxml2;
procedure xmlXPathAddValues(ctxt: PxmlXPathParserContext); cdecl; external libxml2;
procedure xmlXPathSubValues(ctxt: PxmlXPathParserContext); cdecl; external libxml2;
procedure xmlXPathMultValues(ctxt: PxmlXPathParserContext); cdecl; external libxml2;
procedure xmlXPathDivValues(ctxt: PxmlXPathParserContext); cdecl; external libxml2;
procedure xmlXPathModValues(ctxt: PxmlXPathParserContext); cdecl; external libxml2;
function xmlXPathIsNodeType(Name: PxmlChar): longint; cdecl; external libxml2;
function xmlXPathNextSelf(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextChild(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextDescendant(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextDescendantOrSelf(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextParent(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextAncestorOrSelf(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextFollowingSibling(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextFollowing(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextNamespace(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextAttribute(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextPreceding(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextAncestor(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
function xmlXPathNextPrecedingSibling(ctxt: PxmlXPathParserContext; cur: PxmlNode): PxmlNode; cdecl; external libxml2;
procedure xmlXPathLastFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathPositionFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathCountFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathIdFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathLocalNameFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNamespaceURIFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathStringFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathStringLengthFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathConcatFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathContainsFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathStartsWithFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathSubstringFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathSubstringBeforeFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathSubstringAfterFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNormalizeFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathTranslateFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNotFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathTrueFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathFalseFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathLangFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNumberFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathSumFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathFloorFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathCeilingFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathRoundFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathBooleanFunction(ctxt: PxmlXPathParserContext; nargs: longint); cdecl; external libxml2;
procedure xmlXPathNodeSetFreeNs(ns: PxmlNs); cdecl; external libxml2;

function xmlXPathGetError(ctxt: PxmlXPathParserContext): longint;
function xmlXPathCheckError(ctxt: PxmlXPathParserContext): boolean;
function xmlXPathGetDocument(ctxt: PxmlXPathParserContext): PxmlDoc;
function xmlXPathGetContextNode(ctxt: PxmlXPathParserContext): PxmlNode;

function xmlXPathReturnBoolean(ctxt: PxmlXPathParserContext; val: longint): longint;
function xmlXPathReturnTrue(ctxt: PxmlXPathParserContext): longint;
function xmlXPathReturnFalse(ctxt: PxmlXPathParserContext): longint;
function xmlXPathReturnNumber(ctxt: PxmlXPathParserContext; val: longint): longint;
function xmlXPathReturnString(ctxt: PxmlXPathParserContext; str: PxmlChar): longint;
function xmlXPathReturnEmptyString(ctxt: PxmlXPathParserContext): longint;
function xmlXPathReturnNodeSet(ctxt: PxmlXPathParserContext; ns: PxmlNodeSet): longint;
function xmlXPathReturnEmptyNodeSet(ctxt: PxmlXPathParserContext): longint;
function xmlXPathReturnExternal(ctxt: PxmlXPathParserContext; val: Pointer): longint;
function xmlXPathStackIsNodeSet(ctxt: PxmlXPathParserContext): boolean;
function xmlXPathStackIsExternal(ctxt: PxmlXPathParserContext): boolean;

// === Konventiert am: 2-3-25 17:56:58 ===


implementation


function xmlXPathGetError(ctxt: PxmlXPathParserContext): longint;
begin
  xmlXPathGetError := ctxt^.error;
end;

function xmlXPathCheckError(ctxt: PxmlXPathParserContext): boolean;
begin
  xmlXPathCheckError := (ctxt^.error) <> XPATH_EXPRESSION_OK;
end;

function xmlXPathGetDocument(ctxt: PxmlXPathParserContext): PxmlDoc;
begin
  xmlXPathGetDocument := ctxt^.context^.doc;
end;

function xmlXPathGetContextNode(ctxt: PxmlXPathParserContext): PxmlNode;
begin
  xmlXPathGetContextNode := ctxt^.context^.node;
end;

function xmlXPathReturnBoolean(ctxt: PxmlXPathParserContext; val: longint): longint;
begin
  xmlXPathReturnBoolean := valuePush(ctxt, xmlXPathNewBoolean(val));
end;

function xmlXPathReturnTrue(ctxt: PxmlXPathParserContext): longint;
begin
  xmlXPathReturnTrue := xmlXPathReturnBoolean(ctxt, 1);
end;

function xmlXPathReturnFalse(ctxt: PxmlXPathParserContext): longint;
begin
  xmlXPathReturnFalse := xmlXPathReturnBoolean(ctxt, 0);
end;

function xmlXPathReturnNumber(ctxt: PxmlXPathParserContext; val: longint): longint;
begin
  xmlXPathReturnNumber := valuePush(ctxt, xmlXPathNewFloat(val));
end;

function xmlXPathReturnString(ctxt: PxmlXPathParserContext; str: PxmlChar): longint;
begin
  xmlXPathReturnString := valuePush(ctxt, xmlXPathWrapString(str));
end;

function xmlXPathReturnEmptyString(ctxt: PxmlXPathParserContext): longint;
begin
  xmlXPathReturnEmptyString := valuePush(ctxt, xmlXPathNewCString(''));
end;

function xmlXPathReturnNodeSet(ctxt: PxmlXPathParserContext; ns: PxmlNodeSet): longint;
begin
  xmlXPathReturnNodeSet := valuePush(ctxt, xmlXPathWrapNodeSet(ns));
end;

function xmlXPathReturnEmptyNodeSet(ctxt: PxmlXPathParserContext): longint;
begin
  xmlXPathReturnEmptyNodeSet := valuePush(ctxt, xmlXPathNewNodeSet(nil));
end;

function xmlXPathReturnExternal(ctxt: PxmlXPathParserContext; val: Pointer): longint;
begin
  xmlXPathReturnExternal := valuePush(ctxt, xmlXPathWrapExternal(val));
end;

function xmlXPathStackIsNodeSet(ctxt: PxmlXPathParserContext): boolean;
begin
  xmlXPathStackIsNodeSet := (ctxt^.Value <> nil) and (ctxt^.Value^._type = XPATH_NODESET) or (ctxt^.Value^._type = XPATH_XSLT_TREE);
end;

function xmlXPathStackIsExternal(ctxt: PxmlXPathParserContext): boolean;
begin
  xmlXPathStackIsExternal := (ctxt^.Value <> nil) and (ctxt^.Value^._type = XPATH_USERS);
end;


end.

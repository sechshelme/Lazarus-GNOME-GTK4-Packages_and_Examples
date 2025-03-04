unit xpath;

interface

uses
  ctypes, xml2_common, xmlstring, xmlerror, tree, hash, dict;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlXPathError = ^TxmlXPathError;
  TxmlXPathError = longint;

const
  XPATH_EXPRESSION_OK = 0;
  XPATH_NUMBER_ERROR = 1;
  XPATH_UNFINISHED_LITERAL_ERROR = 2;
  XPATH_START_LITERAL_ERROR = 3;
  XPATH_VARIABLE_REF_ERROR = 4;
  XPATH_UNDEF_VARIABLE_ERROR = 5;
  XPATH_INVALID_PREDICATE_ERROR = 6;
  XPATH_EXPR_ERROR = 7;
  XPATH_UNCLOSED_ERROR = 8;
  XPATH_UNKNOWN_FUNC_ERROR = 9;
  XPATH_INVALID_OPERAND = 10;
  XPATH_INVALID_TYPE = 11;
  XPATH_INVALID_ARITY = 12;
  XPATH_INVALID_CTXT_SIZE = 13;
  XPATH_INVALID_CTXT_POSITION = 14;
  XPATH_MEMORY_ERROR = 15;
  XPTR_SYNTAX_ERROR = 16;
  XPTR_RESOURCE_ERROR = 17;
  XPTR_SUB_RESOURCE_ERROR = 18;
  XPATH_UNDEF_PREFIX_ERROR = 19;
  XPATH_ENCODING_ERROR = 20;
  XPATH_INVALID_CHAR_ERROR = 21;
  XPATH_INVALID_CTXT = 22;
  XPATH_STACK_ERROR = 23;
  XPATH_FORBID_VARIABLE_ERROR = 24;
  XPATH_OP_LIMIT_EXCEEDED = 25;
  XPATH_RECURSION_LIMIT_EXCEEDED = 26;

type
  TxmlNodeSet = record
    nodeNr: longint;
    nodeMax: longint;
    nodeTab: PPxmlNode;
  end;
  PxmlNodeSet = ^TxmlNodeSet;

  PxmlXPathObjectType = ^TxmlXPathObjectType;
  TxmlXPathObjectType = longint;

const
  XPATH_UNDEFINED = 0;
  XPATH_NODESET = 1;
  XPATH_BOOLEAN = 2;
  XPATH_NUMBER = 3;
  XPATH_STRING = 4;
  XPATH_POINT = 5;
  XPATH_RANGE = 6;
  XPATH_LOCATIONSET = 7;
  XPATH_USERS = 8;
  XPATH_XSLT_TREE = 9;

const
  XML_XPATH_CHECKNS = 1 shl 0;
  XML_XPATH_NOVAR = 1 shl 1;

type
  PxmlXPathParserContext = ^TxmlXPathParserContext;

  TxmlXPathObject = record
    _type: TxmlXPathObjectType;
    nodesetval: PxmlNodeSet;
    boolval: longint;
    floatval: cdouble;
    stringval: PxmlChar;
    user: pointer;
    index: longint;
    user2: pointer;
    index2: longint;
  end;
  PxmlXPathObject = ^TxmlXPathObject;

  TxmlXPathConvertFunc = function(obj: PxmlXPathObject; _type: longint): longint; cdecl;

  TxmlXPathType = record
    Name: PxmlChar;
    func: TxmlXPathConvertFunc;
  end;
  PxmlXPathType = ^TxmlXPathType;

  TxmlXPathVariable = record
    Name: PxmlChar;
    Value: PxmlXPathObject;
  end;
  PxmlXPathVariable = ^TxmlXPathVariable;

  TxmlXPathEvalFunc = procedure(ctxt: PxmlXPathParserContext; nargs: longint); cdecl;

  TxmlXPathFunct = record
    Name: PxmlChar;
    func: TxmlXPathEvalFunc;
  end;
  PxmlXPathFunc = ^TxmlXPathFunct;

  TxmlXPathAxisFunc = function(ctxt: PxmlXPathParserContext; cur: PxmlXPathObject): PxmlXPathObject; cdecl;

  TxmlXPathAxis = record
    Name: PxmlChar;
    func: TxmlXPathAxisFunc;
  end;
  PxmlXPathAxis = ^TxmlXPathAxis;

  TxmlXPathFunction = procedure(ctxt: PxmlXPathParserContext; nargs: longint); cdecl;
  TxmlXPathVariableLookupFunc = function(ctxt: pointer; Name: PxmlChar; ns_uri: PxmlChar): PxmlXPathObject; cdecl;
  TxmlXPathFuncLookupFunc = function(ctxt: pointer; Name: PxmlChar; ns_uri: PxmlChar): TxmlXPathFunction; cdecl;

  TxmlXPathContext = record
    doc: PxmlDoc;
    node: PxmlNode;
    nb_variables_unused: longint;
    max_variables_unused: longint;
    varHash: PxmlHashTable;
    nb_types: longint;
    max_types: longint;
    types: PxmlXPathType;
    nb_funcs_unused: longint;
    max_funcs_unused: longint;
    funcHash: PxmlHashTable;
    nb_axis: longint;
    max_axis: longint;
    axis: PxmlXPathAxis;
    namespaces: PPxmlNs;
    nsNr: longint;
    user: pointer;
    contextSize: longint;
    proximityPosition: longint;
    xptr: longint;
    here: PxmlNode;
    origin: PxmlNode;
    nsHash: PxmlHashTable;
    varLookupFunc: TxmlXPathVariableLookupFunc;
    varLookupData: pointer;
    extra: pointer;
    _function: PxmlChar;
    functionURI: PxmlChar;
    funcLookupFunc: TxmlXPathFuncLookupFunc;
    funcLookupData: pointer;
    tmpNsList: PPxmlNs;
    tmpNsNr: longint;
    userData: pointer;
    error: TxmlStructuredErrorFunc;
    lastError: TxmlError;
    debugNode: PxmlNode;
    dict: PxmlDict;
    flags: longint;
    cache: pointer;
    opLimit: dword;
    opCount: dword;
    depth: longint;
  end;
  PxmlXPathContext = ^TxmlXPathContext;

  TxmlXPathCompExpr = record
  end;
  PxmlXPathCompExpr = ^TxmlXPathCompExpr;

  TxmlXPathParserContext = record
    cur: PxmlChar;
    base: PxmlChar;
    error: longint;
    context: PxmlXPathContext;
    Value: PxmlXPathObject;
    valueNr: longint;
    valueMax: longint;
    valueTab: ^PxmlXPathObject;
    comp: PxmlXPathCompExpr;
    xptr: longint;
    ancestor: PxmlNode;
    valueFrame: longint;
  end;

var
  xmlXPathNAN: cdouble; cvar;external libxml2;
  xmlXPathPINF: cdouble; cvar;external libxml2;
  xmlXPathNINF: cdouble; cvar;external libxml2;

procedure xmlXPathFreeObject(obj: PxmlXPathObject); cdecl; external libxml2;
function xmlXPathNodeSetCreate(val: PxmlNode): PxmlNodeSet; cdecl; external libxml2;
procedure xmlXPathFreeNodeSetList(obj: PxmlXPathObject); cdecl; external libxml2;
procedure xmlXPathFreeNodeSet(obj: PxmlNodeSet); cdecl; external libxml2;
function xmlXPathObjectCopy(val: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathCmpNodes(node1: PxmlNode; node2: PxmlNode): longint; cdecl; external libxml2;
function xmlXPathCastNumberToBoolean(val: cdouble): longint; cdecl; external libxml2;
function xmlXPathCastStringToBoolean(val: PxmlChar): longint; cdecl; external libxml2;
function xmlXPathCastNodeSetToBoolean(ns: PxmlNodeSet): longint; cdecl; external libxml2;
function xmlXPathCastToBoolean(val: PxmlXPathObject): longint; cdecl; external libxml2;
function xmlXPathCastBooleanToNumber(val: longint): cdouble; cdecl; external libxml2;
function xmlXPathCastStringToNumber(val: PxmlChar): cdouble; cdecl; external libxml2;
function xmlXPathCastNodeToNumber(node: PxmlNode): cdouble; cdecl; external libxml2;
function xmlXPathCastNodeSetToNumber(ns: PxmlNodeSet): cdouble; cdecl; external libxml2;
function xmlXPathCastToNumber(val: PxmlXPathObject): cdouble; cdecl; external libxml2;
function xmlXPathCastBooleanToString(val: longint): PxmlChar; cdecl; external libxml2;
function xmlXPathCastNumberToString(val: cdouble): PxmlChar; cdecl; external libxml2;
function xmlXPathCastNodeToString(node: PxmlNode): PxmlChar; cdecl; external libxml2;
function xmlXPathCastNodeSetToString(ns: PxmlNodeSet): PxmlChar; cdecl; external libxml2;
function xmlXPathCastToString(val: PxmlXPathObject): PxmlChar; cdecl; external libxml2;
function xmlXPathConvertBoolean(val: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathConvertNumber(val: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathConvertString(val: PxmlXPathObject): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathNewContext(doc: PxmlDoc): PxmlXPathContext; cdecl; external libxml2;
procedure xmlXPathFreeContext(ctxt: PxmlXPathContext); cdecl; external libxml2;
function xmlXPathContextSetCache(ctxt: PxmlXPathContext; active: longint; Value: longint; options: longint): longint; cdecl; external libxml2;
function xmlXPathOrderDocElems(doc: PxmlDoc): longint; cdecl; external libxml2;
function xmlXPathSetContextNode(node: PxmlNode; ctx: PxmlXPathContext): longint; cdecl; external libxml2;
function xmlXPathNodeEval(node: PxmlNode; str: PxmlChar; ctx: PxmlXPathContext): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathEval(str: PxmlChar; ctx: PxmlXPathContext): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathEvalExpression(str: PxmlChar; ctxt: PxmlXPathContext): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathEvalPredicate(ctxt: PxmlXPathContext; res: PxmlXPathObject): longint; cdecl; external libxml2;
function xmlXPathCompile(str: PxmlChar): PxmlXPathCompExpr; cdecl; external libxml2;
function xmlXPathCtxtCompile(ctxt: PxmlXPathContext; str: PxmlChar): PxmlXPathCompExpr; cdecl; external libxml2;
function xmlXPathCompiledEval(comp: PxmlXPathCompExpr; ctx: PxmlXPathContext): PxmlXPathObject; cdecl; external libxml2;
function xmlXPathCompiledEvalToBoolean(comp: PxmlXPathCompExpr; ctxt: PxmlXPathContext): longint; cdecl; external libxml2;
procedure xmlXPathFreeCompExpr(comp: PxmlXPathCompExpr); cdecl; external libxml2;

procedure xmlXPathInit; cdecl; external libxml2;
function xmlXPathIsNaN(val: cdouble): longint; cdecl; external libxml2;
function xmlXPathIsInf(val: cdouble): longint; cdecl; external libxml2;

function xmlXPathNodeSetGetLength(ns: PxmlNodeSet): longint;
function xmlXPathNodeSetItem(ns: PxmlNodeSet; index: longint): PxmlNode;
function xmlXPathNodeSetIsEmpty(ns: PxmlNodeSet): boolean;

// === Konventiert am: 27-2-25 19:42:11 ===


implementation

function xmlXPathNodeSetGetLength(ns: PxmlNodeSet): longint;
begin
  if ns <> nil then begin
    Result := ns^.nodeNr;
  end else begin
    Result := 0;
  end;
end;

function xmlXPathNodeSetItem(ns: PxmlNodeSet; index: longint): PxmlNode;
begin
  if (ns <> nil) and (index >= 0) and (index < ns^.nodeNr) then begin
    Result := ns^.nodeTab[index];
  end else begin
    Result := nil;
  end;
end;

function xmlXPathNodeSetIsEmpty(ns: PxmlNodeSet): boolean;
begin
  Result := (ns = nil) or (ns^.nodeNr = 0) or (ns^.nodeTab = nil);
end;


end.

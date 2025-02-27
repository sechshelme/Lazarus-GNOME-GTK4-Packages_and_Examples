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
  PxmlNodeSetPtr = ^TxmlNodeSetPtr;
  TxmlNodeSetPtr = ^TxmlNodeSet;
  PxmlNodeSet = ^TxmlNodeSet;

  TxmlNodeSet = record
    nodeNr: longint;
    nodeMax: longint;
    nodeTab: PxmlNodePtr;
  end;

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
  PxmlXPathParserContextPtr = ^TxmlXPathParserContextPtr;
  TxmlXPathParserContextPtr = ^TxmlXPathParserContext;



  PxmlXPathObjectPtr = ^TxmlXPathObjectPtr;
  TxmlXPathObjectPtr = ^TxmlXPathObject;

  TxmlXPathObject = record
    _type: TxmlXPathObjectType;
    nodesetval: TxmlNodeSetPtr;
    boolval: longint;
    floatval: cdouble;
    stringval: PxmlChar;
    user: pointer;
    index: longint;
    user2: pointer;
    index2: longint;
  end;

  TxmlXPathConvertFunc = function(obj: TxmlXPathObjectPtr; _type: longint): longint; cdecl;

  PxmlXPathTypePtr = ^TxmlXPathTypePtr;
  TxmlXPathTypePtr = ^TxmlXPathType;

  TxmlXPathType = record
    Name: PxmlChar;
    func: TxmlXPathConvertFunc;
  end;

  PxmlXPathVariablePtr = ^TxmlXPathVariablePtr;
  TxmlXPathVariablePtr = ^TxmlXPathVariable;

  TxmlXPathVariable = record
    Name: PxmlChar;
    Value: TxmlXPathObjectPtr;
  end;

  TxmlXPathEvalFunc = procedure(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl;

  PxmlXPathFuncPtr = ^TxmlXPathFuncPtr;
  TxmlXPathFuncPtr = ^TxmlXPathFunct;

  TxmlXPathFunct = record
    Name: PxmlChar;
    func: TxmlXPathEvalFunc;
  end;

  TxmlXPathAxisFunc = function(ctxt: TxmlXPathParserContextPtr; cur: TxmlXPathObjectPtr): TxmlXPathObjectPtr; cdecl;

  PxmlXPathAxisPtr = ^TxmlXPathAxisPtr;
  TxmlXPathAxisPtr = ^TxmlXPathAxis;

  TxmlXPathAxis = record
    Name: PxmlChar;
    func: TxmlXPathAxisFunc;
  end;

  TxmlXPathFunction = procedure(ctxt: TxmlXPathParserContextPtr; nargs: longint); cdecl;

  TxmlXPathVariableLookupFunc = function(ctxt: pointer; Name: PxmlChar; ns_uri: PxmlChar): TxmlXPathObjectPtr; cdecl;

  TxmlXPathFuncLookupFunc = function(ctxt: pointer; Name: PxmlChar; ns_uri: PxmlChar): TxmlXPathFunction; cdecl;

  PxmlXPathContextPtr = ^TxmlXPathContextPtr;
  TxmlXPathContextPtr = ^TxmlXPathContext;

  TxmlXPathContext = record
    doc: TxmlDocPtr;
    node: TxmlNodePtr;
    nb_variables_unused: longint;
    max_variables_unused: longint;
    varHash: TxmlHashTablePtr;
    nb_types: longint;
    max_types: longint;
    types: TxmlXPathTypePtr;
    nb_funcs_unused: longint;
    max_funcs_unused: longint;
    funcHash: TxmlHashTablePtr;
    nb_axis: longint;
    max_axis: longint;
    axis: TxmlXPathAxisPtr;
    namespaces: PxmlNsPtr;
    nsNr: longint;
    user: pointer;
    contextSize: longint;
    proximityPosition: longint;
    xptr: longint;
    here: TxmlNodePtr;
    origin: TxmlNodePtr;
    nsHash: TxmlHashTablePtr;
    varLookupFunc: TxmlXPathVariableLookupFunc;
    varLookupData: pointer;
    extra: pointer;
    _function: PxmlChar;
    functionURI: PxmlChar;
    funcLookupFunc: TxmlXPathFuncLookupFunc;
    funcLookupData: pointer;
    tmpNsList: PxmlNsPtr;
    tmpNsNr: longint;
    userData: pointer;
    error: TxmlStructuredErrorFunc;
    lastError: TxmlError;
    debugNode: TxmlNodePtr;
    dict: TxmlDictPtr;
    flags: longint;
    cache: pointer;
    opLimit: dword;
    opCount: dword;
    depth: longint;
  end;

  TxmlXPathCompExpr = record
  end;
  PxmlXPathCompExpr = ^TxmlXPathCompExpr;

  PxmlXPathCompExprPtr = ^TxmlXPathCompExprPtr;
  TxmlXPathCompExprPtr = PxmlXPathCompExpr;

  TxmlXPathParserContext = record
    cur: PxmlChar;
    base: PxmlChar;
    error: longint;
    context: TxmlXPathContextPtr;
    Value: TxmlXPathObjectPtr;
    valueNr: longint;
    valueMax: longint;
    valueTab: PxmlXPathObjectPtr;
    comp: TxmlXPathCompExprPtr;
    xptr: longint;
    ancestor: TxmlNodePtr;
    valueFrame: longint;
  end;

var
  xmlXPathNAN: cdouble; cvar;external libxml2;
  xmlXPathPINF: cdouble; cvar;external libxml2;
  xmlXPathNINF: cdouble; cvar;external libxml2;

procedure xmlXPathFreeObject(obj: TxmlXPathObjectPtr); cdecl; external libxml2;
function xmlXPathNodeSetCreate(val: TxmlNodePtr): TxmlNodeSetPtr; cdecl; external libxml2;
procedure xmlXPathFreeNodeSetList(obj: TxmlXPathObjectPtr); cdecl; external libxml2;
procedure xmlXPathFreeNodeSet(obj: TxmlNodeSetPtr); cdecl; external libxml2;
function xmlXPathObjectCopy(val: TxmlXPathObjectPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathCmpNodes(node1: TxmlNodePtr; node2: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlXPathCastNumberToBoolean(val: cdouble): longint; cdecl; external libxml2;
function xmlXPathCastStringToBoolean(val: PxmlChar): longint; cdecl; external libxml2;
function xmlXPathCastNodeSetToBoolean(ns: TxmlNodeSetPtr): longint; cdecl; external libxml2;
function xmlXPathCastToBoolean(val: TxmlXPathObjectPtr): longint; cdecl; external libxml2;
function xmlXPathCastBooleanToNumber(val: longint): cdouble; cdecl; external libxml2;
function xmlXPathCastStringToNumber(val: PxmlChar): cdouble; cdecl; external libxml2;
function xmlXPathCastNodeToNumber(node: TxmlNodePtr): cdouble; cdecl; external libxml2;
function xmlXPathCastNodeSetToNumber(ns: TxmlNodeSetPtr): cdouble; cdecl; external libxml2;
function xmlXPathCastToNumber(val: TxmlXPathObjectPtr): cdouble; cdecl; external libxml2;
function xmlXPathCastBooleanToString(val: longint): PxmlChar; cdecl; external libxml2;
function xmlXPathCastNumberToString(val: cdouble): PxmlChar; cdecl; external libxml2;
function xmlXPathCastNodeToString(node: TxmlNodePtr): PxmlChar; cdecl; external libxml2;
function xmlXPathCastNodeSetToString(ns: TxmlNodeSetPtr): PxmlChar; cdecl; external libxml2;
function xmlXPathCastToString(val: TxmlXPathObjectPtr): PxmlChar; cdecl; external libxml2;
function xmlXPathConvertBoolean(val: TxmlXPathObjectPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathConvertNumber(val: TxmlXPathObjectPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathConvertString(val: TxmlXPathObjectPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathNewContext(doc: TxmlDocPtr): TxmlXPathContextPtr; cdecl; external libxml2;
procedure xmlXPathFreeContext(ctxt: TxmlXPathContextPtr); cdecl; external libxml2;
function xmlXPathContextSetCache(ctxt: TxmlXPathContextPtr; active: longint; Value: longint; options: longint): longint; cdecl; external libxml2;
function xmlXPathOrderDocElems(doc: TxmlDocPtr): longint; cdecl; external libxml2;
function xmlXPathSetContextNode(node: TxmlNodePtr; ctx: TxmlXPathContextPtr): longint; cdecl; external libxml2;
function xmlXPathNodeEval(node: TxmlNodePtr; str: PxmlChar; ctx: TxmlXPathContextPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathEval(str: PxmlChar; ctx: TxmlXPathContextPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathEvalExpression(str: PxmlChar; ctxt: TxmlXPathContextPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathEvalPredicate(ctxt: TxmlXPathContextPtr; res: TxmlXPathObjectPtr): longint; cdecl; external libxml2;
function xmlXPathCompile(str: PxmlChar): TxmlXPathCompExprPtr; cdecl; external libxml2;
function xmlXPathCtxtCompile(ctxt: TxmlXPathContextPtr; str: PxmlChar): TxmlXPathCompExprPtr; cdecl; external libxml2;
function xmlXPathCompiledEval(comp: TxmlXPathCompExprPtr; ctx: TxmlXPathContextPtr): TxmlXPathObjectPtr; cdecl; external libxml2;
function xmlXPathCompiledEvalToBoolean(comp: TxmlXPathCompExprPtr; ctxt: TxmlXPathContextPtr): longint; cdecl; external libxml2;
procedure xmlXPathFreeCompExpr(comp: TxmlXPathCompExprPtr); cdecl; external libxml2;

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

unit xpath;

interface

uses
  ctypes, xml2_common;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PxmlXPathContextPtr = ^TxmlXPathContextPtr;
  TxmlXPathContextPtr = PxmlXPathContext;

  PxmlXPathParserContextPtr = ^TxmlXPathParserContextPtr;
  TxmlXPathParserContextPtr = PxmlXPathParserContext;

  PxmlXPathError = ^TxmlXPathError;
  TxmlXPathError =  Longint;
  Const
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
;
{
 * A node-set (an unordered collection of nodes without duplicates).
  }
type

  PxmlNodeSetPtr = ^TxmlNodeSetPtr;
  TxmlNodeSetPtr = PxmlNodeSet;
{ number of nodes in the set  }
{ size of the array as allocated  }
{ array of nodes in no particular order  }
{ @@ with_ns to check whether namespace nodes should be looked at @@  }
  PxmlNodeSet = ^TxmlNodeSet;
  TxmlNodeSet = record
      nodeNr : longint;
      nodeMax : longint;
      nodeTab : PxmlNodePtr;
    end;

{
 * An expression is evaluated to yield an object, which
 * has one of the following four basic types:
 *   - node-set
 *   - boolean
 *   - number
 *   - string
 *
 * @@ XPointer will add more types !
  }
{ An XSLT value tree, non modifiable  }

  PxmlXPathObjectType = ^TxmlXPathObjectType;
  TxmlXPathObjectType =  Longint;
  Const
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
;
type

  PxmlXPathObjectPtr = ^TxmlXPathObjectPtr;
  TxmlXPathObjectPtr = PxmlXPathObject;
  PxmlXPathObject = ^TxmlXPathObject;
  TxmlXPathObject = record
      _type : TxmlXPathObjectType;
      nodesetval : TxmlNodeSetPtr;
      boolval : longint;
      floatval : Tdouble;
      stringval : PxmlChar;
      user : pointer;
      index : longint;
      user2 : pointer;
      index2 : longint;
    end;

{*
 * xmlXPathConvertFunc:
 * @obj:  an XPath object
 * @type:  the number of the target type
 *
 * A conversion function is associated to a type and used to cast
 * the new type to primitive values.
 *
 * Returns -1 in case of error, 0 otherwise
  }

  TxmlXPathConvertFunc = function (obj:TxmlXPathObjectPtr; _type:longint):longint;cdecl;
{
 * Extra type: a name and a conversion function.
  }

  PxmlXPathTypePtr = ^TxmlXPathTypePtr;
  TxmlXPathTypePtr = PxmlXPathType;
{ the type name  }
{ the conversion function  }
  PxmlXPathType = ^TxmlXPathType;
  TxmlXPathType = record
      name : PxmlChar;
      func : TxmlXPathConvertFunc;
    end;

{
 * Extra variable: a name and a value.
  }

  PxmlXPathVariablePtr = ^TxmlXPathVariablePtr;
  TxmlXPathVariablePtr = PxmlXPathVariable;
{ the variable name  }
{ the value  }
  PxmlXPathVariable = ^TxmlXPathVariable;
  TxmlXPathVariable = record
      name : PxmlChar;
      value : TxmlXPathObjectPtr;
    end;

{*
 * xmlXPathEvalFunc:
 * @ctxt: an XPath parser context
 * @nargs: the number of arguments passed to the function
 *
 * An XPath evaluation function, the parameters are on the XPath context stack.
  }

  TxmlXPathEvalFunc = procedure (ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;
{
 * Extra function: a name and a evaluation function.
  }

  PxmlXPathFuncPtr = ^TxmlXPathFuncPtr;
  TxmlXPathFuncPtr = PxmlXPathFunct;
{ the function name  }
{ the evaluation function  }
  PxmlXPathFunct = ^TxmlXPathFunct;
  TxmlXPathFunct = record
      name : PxmlChar;
      func : TxmlXPathEvalFunc;
    end;

{*
 * xmlXPathAxisFunc:
 * @ctxt:  the XPath interpreter context
 * @cur:  the previous node being explored on that axis
 *
 * An axis traversal function. To traverse an axis, the engine calls
 * the first time with cur == NULL and repeat until the function returns
 * NULL indicating the end of the axis traversal.
 *
 * Returns the next node in that axis or NULL if at the end of the axis.
  }

  TxmlXPathAxisFunc = function (ctxt:TxmlXPathParserContextPtr; cur:TxmlXPathObjectPtr):TxmlXPathObjectPtr;cdecl;
{
 * Extra axis: a name and an axis function.
  }

  PxmlXPathAxisPtr = ^TxmlXPathAxisPtr;
  TxmlXPathAxisPtr = PxmlXPathAxis;
{ the axis name  }
{ the search function  }
  PxmlXPathAxis = ^TxmlXPathAxis;
  TxmlXPathAxis = record
      name : PxmlChar;
      func : TxmlXPathAxisFunc;
    end;

{*
 * xmlXPathFunction:
 * @ctxt:  the XPath interprestation context
 * @nargs:  the number of arguments
 *
 * An XPath function.
 * The arguments (if any) are popped out from the context stack
 * and the result is pushed on the stack.
  }

  TxmlXPathFunction = procedure (ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;
{
 * Function and Variable Lookup.
  }
{*
 * xmlXPathVariableLookupFunc:
 * @ctxt:  an XPath context
 * @name:  name of the variable
 * @ns_uri:  the namespace name hosting this variable
 *
 * Prototype for callbacks used to plug variable lookup in the XPath
 * engine.
 *
 * Returns the XPath object value or NULL if not found.
  }

  TxmlXPathVariableLookupFunc = function (ctxt:pointer; name:PxmlChar; ns_uri:PxmlChar):TxmlXPathObjectPtr;cdecl;
{*
 * xmlXPathFuncLookupFunc:
 * @ctxt:  an XPath context
 * @name:  name of the function
 * @ns_uri:  the namespace name hosting this function
 *
 * Prototype for callbacks used to plug function lookup in the XPath
 * engine.
 *
 * Returns the XPath function or NULL if not found.
  }

  TxmlXPathFuncLookupFunc = function (ctxt:pointer; name:PxmlChar; ns_uri:PxmlChar):TxmlXPathFunction;cdecl;
{*
 * xmlXPathFlags:
 * Flags for XPath engine compilation and runtime
  }
{*
 * XML_XPATH_CHECKNS:
 *
 * check namespaces at compilation
  }

const
  XML_XPATH_CHECKNS = 1 shl 0;  
{*
 * XML_XPATH_NOVAR:
 *
 * forbid variables in expression
  }
  XML_XPATH_NOVAR = 1 shl 1;  
{*
 * xmlXPathContext:
 *
 * Expression evaluation occurs with respect to a context.
 * he context consists of:
 *    - a node (the context node)
 *    - a node list (the context node list)
 *    - a set of variable bindings
 *    - a function library
 *    - the set of namespace declarations in scope for the expression
 * Following the switch to hash tables, this need to be trimmed up at
 * the next binary incompatible release.
 * The node may be modified when the context is passed to libxml2
 * for an XPath evaluation so you may need to initialize it again
 * before the next call.
  }
{ The current document  }
{ The current node  }
{ unused (hash table)  }
{ unused (hash table)  }
{ Hash table of defined variables  }
{ number of defined types  }
{ max number of types  }
{ Array of defined types  }
{ unused (hash table)  }
{ unused (hash table)  }
{ Hash table of defined funcs  }
{ number of defined axis  }
{ max number of axis  }
{ Array of defined axis  }
{ the namespace nodes of the context node  }
{ Array of namespaces  }
{ number of namespace in scope  }
{ function to free  }
{ extra variables  }
{ the context size  }
{ the proximity position  }
{ extra stuff for XPointer  }
{ is this an XPointer context?  }
{ for here()  }
{ for origin()  }
{ the set of namespace declarations in scope for the expression  }
{ The namespaces hash table  }
{ variable lookup func  }
{ variable lookup data  }
{ Possibility to link in an extra item  }
{ needed for XSLT  }
{ The function name and URI when calling a function  }
{ function lookup function and data  }
{ function lookup func  }
{ function lookup data  }
{ temporary namespace lists kept for walking the namespace axis  }
{ Array of namespaces  }
{ number of namespaces in scope  }
{ error reporting mechanism  }
{ user specific data block  }
{ the callback in case of errors  }
{ the last error  }
{ the source node XSLT  }
{ dictionary  }
{ dictionary if any  }
{ flags to control compilation  }
{ Cache for reusal of XPath objects  }
{ Resource limits  }
type
  PxmlXPathContext = ^TxmlXPathContext;
  TxmlXPathContext = record
      doc : TxmlDocPtr;cdecl;
      node : TxmlNodePtr;
      nb_variables_unused : longint;
      max_variables_unused : longint;
      varHash : TxmlHashTablePtr;
      nb_types : longint;
      max_types : longint;
      types : TxmlXPathTypePtr;
      nb_funcs_unused : longint;
      max_funcs_unused : longint;
      funcHash : TxmlHashTablePtr;
      nb_axis : longint;
      max_axis : longint;
      axis : TxmlXPathAxisPtr;
      namespaces : PxmlNsPtr;
      nsNr : longint;
      user : pointer;
      contextSize : longint;
      proximityPosition : longint;
      xptr : longint;
      here : TxmlNodePtr;
      origin : TxmlNodePtr;
      nsHash : TxmlHashTablePtr;
      varLookupFunc : TxmlXPathVariableLookupFunc;
      varLookupData : pointer;
      extra : pointer;
      _function : PxmlChar;
      functionURI : PxmlChar;
      funcLookupFunc : TxmlXPathFuncLookupFunc;
      funcLookupData : pointer;
      tmpNsList : PxmlNsPtr;
      tmpNsNr : longint;
      userData : pointer;
      error : TxmlStructuredErrorFunc;
      lastError : TxmlError;
      debugNode : TxmlNodePtr;
      dict : TxmlDictPtr;
      flags : longint;
      cache : pointer;
      opLimit : dword;
      opCount : dword;
      depth : longint;
    end;

{
 * The structure of a compiled expression form is not public.
  }

  PxmlXPathCompExprPtr = ^TxmlXPathCompExprPtr;
  TxmlXPathCompExprPtr = PxmlXPathCompExpr;
{*
 * xmlXPathParserContext:
 *
 * An XPath parser context. It contains pure parsing information,
 * an xmlXPathContext, and the stack of objects.
  }
{ the current char being parsed  }
{ the full expression  }
{ error code  }
{ the evaluation context  }
{ the current value  }
{ number of values stacked  }
{ max number of values stacked  }
{ stack of values  }
{ the precompiled expression  }
{ it this an XPointer expression  }
{ used for walking preceding axis  }
{ used to limit Pop on the stack  }
  PxmlXPathParserContext = ^TxmlXPathParserContext;
  TxmlXPathParserContext = record
      cur : PxmlChar;
      base : PxmlChar;
      error : longint;
      context : TxmlXPathContextPtr;
      value : TxmlXPathObjectPtr;
      valueNr : longint;
      valueMax : longint;
      valueTab : PxmlXPathObjectPtr;
      comp : TxmlXPathCompExprPtr;
      xptr : longint;
      ancestor : TxmlNodePtr;
      valueFrame : longint;
    end;

{***********************************************************************
 *									*
 *			Public API					*
 *									*
 *********************************************************************** }
{*
 * Objects and Nodesets handling
  }
  var
    xmlXPathNAN : Tdouble;cvar;external libxml2;
    xmlXPathPINF : Tdouble;cvar;external libxml2;
    xmlXPathNINF : Tdouble;cvar;external libxml2;
{ These macros may later turn into functions  }
{*
 * xmlXPathNodeSetGetLength:
 * @ns:  a node-set
 *
 * Implement a functionality similar to the DOM NodeList.length.
 *
 * Returns the number of nodes in the node-set.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function xmlXPathNodeSetGetLength(ns : longint) : longint;

{*
 * xmlXPathNodeSetItem:
 * @ns:  a node-set
 * @index:  index of a node in the set
 *
 * Implements a functionality similar to the DOM NodeList.item().
 *
 * Returns the xmlNodePtr at the given @index in @ns or NULL if
 *         @index is out of range (0 to length-1)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathNodeSetItem(ns,index : longint) : longint;

{*
 * xmlXPathNodeSetIsEmpty:
 * @ns: a node-set
 *
 * Checks whether @ns is empty or not.
 *
 * Returns %TRUE if @ns is an empty node-set.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathNodeSetIsEmpty(ns : longint) : longint;

procedure xmlXPathFreeObject(obj:TxmlXPathObjectPtr);cdecl;external libxml2;
function xmlXPathNodeSetCreate(val:TxmlNodePtr):TxmlNodeSetPtr;cdecl;external libxml2;
procedure xmlXPathFreeNodeSetList(obj:TxmlXPathObjectPtr);cdecl;external libxml2;
procedure xmlXPathFreeNodeSet(obj:TxmlNodeSetPtr);cdecl;external libxml2;
function xmlXPathObjectCopy(val:TxmlXPathObjectPtr):TxmlXPathObjectPtr;cdecl;external libxml2;
function xmlXPathCmpNodes(node1:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external libxml2;
{*
 * Conversion functions to basic types.
  }
function xmlXPathCastNumberToBoolean(val:Tdouble):longint;cdecl;external libxml2;
function xmlXPathCastStringToBoolean(val:PxmlChar):longint;cdecl;external libxml2;
function xmlXPathCastNodeSetToBoolean(ns:TxmlNodeSetPtr):longint;cdecl;external libxml2;
function xmlXPathCastToBoolean(val:TxmlXPathObjectPtr):longint;cdecl;external libxml2;
function xmlXPathCastBooleanToNumber(val:longint):Tdouble;cdecl;external libxml2;
function xmlXPathCastStringToNumber(val:PxmlChar):Tdouble;cdecl;external libxml2;
function xmlXPathCastNodeToNumber(node:TxmlNodePtr):Tdouble;cdecl;external libxml2;
function xmlXPathCastNodeSetToNumber(ns:TxmlNodeSetPtr):Tdouble;cdecl;external libxml2;
function xmlXPathCastToNumber(val:TxmlXPathObjectPtr):Tdouble;cdecl;external libxml2;
function xmlXPathCastBooleanToString(val:longint):PxmlChar;cdecl;external libxml2;
function xmlXPathCastNumberToString(val:Tdouble):PxmlChar;cdecl;external libxml2;
function xmlXPathCastNodeToString(node:TxmlNodePtr):PxmlChar;cdecl;external libxml2;
function xmlXPathCastNodeSetToString(ns:TxmlNodeSetPtr):PxmlChar;cdecl;external libxml2;
function xmlXPathCastToString(val:TxmlXPathObjectPtr):PxmlChar;cdecl;external libxml2;
function xmlXPathConvertBoolean(val:TxmlXPathObjectPtr):TxmlXPathObjectPtr;cdecl;external libxml2;
function xmlXPathConvertNumber(val:TxmlXPathObjectPtr):TxmlXPathObjectPtr;cdecl;external libxml2;
function xmlXPathConvertString(val:TxmlXPathObjectPtr):TxmlXPathObjectPtr;cdecl;external libxml2;
{*
 * Context handling.
  }
function xmlXPathNewContext(doc:TxmlDocPtr):TxmlXPathContextPtr;cdecl;external libxml2;
procedure xmlXPathFreeContext(ctxt:TxmlXPathContextPtr);cdecl;external libxml2;
function xmlXPathContextSetCache(ctxt:TxmlXPathContextPtr; active:longint; value:longint; options:longint):longint;cdecl;external libxml2;
{*
 * Evaluation functions.
  }
function xmlXPathOrderDocElems(doc:TxmlDocPtr):longint;cdecl;external libxml2;
function xmlXPathSetContextNode(node:TxmlNodePtr; ctx:TxmlXPathContextPtr):longint;cdecl;external libxml2;
function xmlXPathNodeEval(node:TxmlNodePtr; str:PxmlChar; ctx:TxmlXPathContextPtr):TxmlXPathObjectPtr;cdecl;external libxml2;
function xmlXPathEval(str:PxmlChar; ctx:TxmlXPathContextPtr):TxmlXPathObjectPtr;cdecl;external libxml2;
function xmlXPathEvalExpression(str:PxmlChar; ctxt:TxmlXPathContextPtr):TxmlXPathObjectPtr;cdecl;external libxml2;
function xmlXPathEvalPredicate(ctxt:TxmlXPathContextPtr; res:TxmlXPathObjectPtr):longint;cdecl;external libxml2;
{*
 * Separate compilation/evaluation entry points.
  }
function xmlXPathCompile(str:PxmlChar):TxmlXPathCompExprPtr;cdecl;external libxml2;
function xmlXPathCtxtCompile(ctxt:TxmlXPathContextPtr; str:PxmlChar):TxmlXPathCompExprPtr;cdecl;external libxml2;
function xmlXPathCompiledEval(comp:TxmlXPathCompExprPtr; ctx:TxmlXPathContextPtr):TxmlXPathObjectPtr;cdecl;external libxml2;
function xmlXPathCompiledEvalToBoolean(comp:TxmlXPathCompExprPtr; ctxt:TxmlXPathContextPtr):longint;cdecl;external libxml2;
procedure xmlXPathFreeCompExpr(comp:TxmlXPathCompExprPtr);cdecl;external libxml2;
{$endif}
{ LIBXML_XPATH_ENABLED  }
{$if defined(LIBXML_XPATH_ENABLED) || defined(LIBXML_SCHEMAS_ENABLED)}

procedure xmlXPathInit;cdecl;external libxml2;
function xmlXPathIsNaN(val:Tdouble):longint;cdecl;external libxml2;
function xmlXPathIsInf(val:Tdouble):longint;cdecl;external libxml2;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_XPATH_ENABLED or LIBXML_SCHEMAS_ENABLED }
{$endif}
{ ! __XML_XPATH_H__  }

// === Konventiert am: 27-2-25 17:45:52 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathNodeSetGetLength(ns : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if ns then
    if_local1:=ns^.nodeNr
  else
    if_local1:=0;
  xmlXPathNodeSetGetLength:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathNodeSetItem(ns,index : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if ((ns<>NULL) and (@(index>=0))) and (@(index<(ns^.nodeNr))) then
    if_local1:=ns^.(nodeTab[index])
  else
    if_local1:=NULL;
  xmlXPathNodeSetItem:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathNodeSetIsEmpty(ns : longint) : longint;
begin
  xmlXPathNodeSetIsEmpty:=((ns=NULL) or ((ns^.nodeNr)=0)) or ((ns^.nodeTab)=NULL);
end;


end.

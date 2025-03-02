
unit xpathInternals;
interface

{
  Automatically converted by H2Pas 1.0.0 from xpathInternals.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xpathInternals.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PFILE  = ^FILE;
PxmlChar  = ^xmlChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: internal interfaces for XML Path Language implementation
 * Description: internal interfaces for XML Path Language implementation
 *              used to build new modules on top of XPath like XPointer and
 *              XSLT
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_XPATH_INTERNALS_H__}
{$define __XML_XPATH_INTERNALS_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/xpath.h>}
{$ifdef LIBXML_XPATH_ENABLED}
{ C++ extern C conditionnal removed }
{***********************************************************************
 *									*
 *			Helpers						*
 *									*
 *********************************************************************** }
{
 * Many of these macros may later turn into functions. They
 * shouldn't be used in #ifdef's preprocessor instructions.
  }
{*
 * xmlXPathSetError:
 * @ctxt:  an XPath parser context
 * @err:  an xmlXPathError code
 *
 * Raises an error.
  }
{#define xmlXPathSetError(ctxt, err)					\ }
{     xmlXPatherror((ctxt), __FILE__, __LINE__, (err));			\ }
{      if ((ctxt) != NULL) (ctxt)->error = (err);  }
{*
 * xmlXPathSetArityError:
 * @ctxt:  an XPath parser context
 *
 * Raises an XPATH_INVALID_ARITY error.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function xmlXPathSetArityError(ctxt : longint) : longint;

{*
 * xmlXPathSetTypeError:
 * @ctxt:  an XPath parser context
 *
 * Raises an XPATH_INVALID_TYPE error.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathSetTypeError(ctxt : longint) : longint;

{*
 * xmlXPathGetError:
 * @ctxt:  an XPath parser context
 *
 * Get the error code of an XPath context.
 *
 * Returns the context error.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathGetError(ctxt : longint) : longint;

{*
 * xmlXPathCheckError:
 * @ctxt:  an XPath parser context
 *
 * Check if an XPath error was raised.
 *
 * Returns true if an error has been raised, false otherwise.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathCheckError(ctxt : longint) : longint;

{*
 * xmlXPathGetDocument:
 * @ctxt:  an XPath parser context
 *
 * Get the document of an XPath context.
 *
 * Returns the context document.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathGetDocument(ctxt : longint) : longint;

{*
 * xmlXPathGetContextNode:
 * @ctxt: an XPath parser context
 *
 * Get the context node of an XPath context.
 *
 * Returns the context node.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathGetContextNode(ctxt : longint) : longint;

function xmlXPathPopBoolean(ctxt:TxmlXPathParserContextPtr):longint;cdecl;external;
function xmlXPathPopNumber(ctxt:TxmlXPathParserContextPtr):Tdouble;cdecl;external;
function xmlXPathPopString(ctxt:TxmlXPathParserContextPtr):PxmlChar;cdecl;external;
function xmlXPathPopNodeSet(ctxt:TxmlXPathParserContextPtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathPopExternal(ctxt:TxmlXPathParserContextPtr):pointer;cdecl;external;
{*
 * xmlXPathReturnBoolean:
 * @ctxt:  an XPath parser context
 * @val:  a boolean
 *
 * Pushes the boolean @val on the context stack.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnBoolean(ctxt,val : longint) : longint;

{*
 * xmlXPathReturnTrue:
 * @ctxt:  an XPath parser context
 *
 * Pushes true on the context stack.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnTrue(ctxt : longint) : longint;

{*
 * xmlXPathReturnFalse:
 * @ctxt:  an XPath parser context
 *
 * Pushes false on the context stack.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnFalse(ctxt : longint) : longint;

{*
 * xmlXPathReturnNumber:
 * @ctxt:  an XPath parser context
 * @val:  a double
 *
 * Pushes the double @val on the context stack.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnNumber(ctxt,val : longint) : longint;

{*
 * xmlXPathReturnString:
 * @ctxt:  an XPath parser context
 * @str:  a string
 *
 * Pushes the string @str on the context stack.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnString(ctxt,str : longint) : longint;

{*
 * xmlXPathReturnEmptyString:
 * @ctxt:  an XPath parser context
 *
 * Pushes an empty string on the stack.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnEmptyString(ctxt : longint) : longint;

{*
 * xmlXPathReturnNodeSet:
 * @ctxt:  an XPath parser context
 * @ns:  a node-set
 *
 * Pushes the node-set @ns on the context stack.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnNodeSet(ctxt,ns : longint) : longint;

{*
 * xmlXPathReturnEmptyNodeSet:
 * @ctxt:  an XPath parser context
 *
 * Pushes an empty node-set on the context stack.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnEmptyNodeSet(ctxt : longint) : longint;

{*
 * xmlXPathReturnExternal:
 * @ctxt:  an XPath parser context
 * @val:  user data
 *
 * Pushes user data on the context stack.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnExternal(ctxt,val : longint) : longint;

{*
 * xmlXPathStackIsNodeSet:
 * @ctxt: an XPath parser context
 *
 * Check if the current value on the XPath stack is a node set or
 * an XSLT value tree.
 *
 * Returns true if the current object on the stack is a node-set.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathStackIsNodeSet(ctxt : longint) : longint;

{*
 * xmlXPathStackIsExternal:
 * @ctxt: an XPath parser context
 *
 * Checks if the current value on the XPath stack is an external
 * object.
 *
 * Returns true if the current object on the stack is an external
 * object.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathStackIsExternal(ctxt : longint) : longint;

{*
 * xmlXPathEmptyNodeSet:
 * @ns:  a node-set
 *
 * Empties a node-set.
  }
{#define xmlXPathEmptyNodeSet(ns)					\ }
{     while ((ns)->nodeNr > 0) (ns)->nodeTab[--(ns)->nodeNr] = NULL;  }
{*
 * CHECK_ERROR:
 *
 * Macro to return from the function if an XPath error was detected.
  }
{#define CHECK_ERROR							\ }
{    if (ctxt->error != XPATH_EXPRESSION_OK) return }
{*
 * CHECK_ERROR0:
 *
 * Macro to return 0 from the function if an XPath error was detected.
  }
{#define CHECK_ERROR0							\ }
{    if (ctxt->error != XPATH_EXPRESSION_OK) return(0) }
{*
 * XP_ERROR:
 * @X:  the error code
 *
 * Macro to raise an XPath error and return.
  }
{#define XP_ERROR(X)							\ }
{     xmlXPathErr(ctxt, X); return;  }
{*
 * XP_ERROR0:
 * @X:  the error code
 *
 * Macro to raise an XPath error and return 0.
  }
{#define XP_ERROR0(X)							\ }
{     xmlXPathErr(ctxt, X); return(0);  }
{*
 * CHECK_TYPE:
 * @typeval:  the XPath type
 *
 * Macro to check that the value on top of the XPath stack is of a given
 * type.
  }
{#define CHECK_TYPE(typeval)						\ }
{    if ((ctxt->value == NULL) || (ctxt->value->type != typeval))	\ }
{        XP_ERROR(XPATH_INVALID_TYPE) }
{*
 * CHECK_TYPE0:
 * @typeval:  the XPath type
 *
 * Macro to check that the value on top of the XPath stack is of a given
 * type. Return(0) in case of failure
  }
{#define CHECK_TYPE0(typeval)						\ }
{    if ((ctxt->value == NULL) || (ctxt->value->type != typeval))	\ }
{        XP_ERROR0(XPATH_INVALID_TYPE) }
{*
 * CHECK_ARITY:
 * @x:  the number of expected args
 *
 * Macro to check that the number of args passed to an XPath function matches.
  }
{#define CHECK_ARITY(x)							\ }
{    if (ctxt == NULL) return;						\ }
{    if (nargs != (x))							\ }
{        XP_ERROR(XPATH_INVALID_ARITY);					\ }
{    if (ctxt->valueNr < ctxt->valueFrame + (x))				\ }
{        XP_ERROR(XPATH_STACK_ERROR); }
{*
 * CAST_TO_STRING:
 *
 * Macro to try to cast the value on the top of the XPath stack to a string.
  }
{#define CAST_TO_STRING							\ }
{    if ((ctxt->value != NULL) && (ctxt->value->type != XPATH_STRING))	\ }
{        xmlXPathStringFunction(ctxt, 1); }
{*
 * CAST_TO_NUMBER:
 *
 * Macro to try to cast the value on the top of the XPath stack to a number.
  }
{#define CAST_TO_NUMBER							\ }
{    if ((ctxt->value != NULL) && (ctxt->value->type != XPATH_NUMBER))	\ }
{        xmlXPathNumberFunction(ctxt, 1); }
{*
 * CAST_TO_BOOLEAN:
 *
 * Macro to try to cast the value on the top of the XPath stack to a boolean.
  }
{#define CAST_TO_BOOLEAN							\ }
{    if ((ctxt->value != NULL) && (ctxt->value->type != XPATH_BOOLEAN))	\ }
{        xmlXPathBooleanFunction(ctxt, 1); }
{
 * Variable Lookup forwarding.
  }
procedure xmlXPathRegisterVariableLookup(ctxt:TxmlXPathContextPtr; f:TxmlXPathVariableLookupFunc; data:pointer);cdecl;external;
{
 * Function Lookup forwarding.
  }
procedure xmlXPathRegisterFuncLookup(ctxt:TxmlXPathContextPtr; f:TxmlXPathFuncLookupFunc; funcCtxt:pointer);cdecl;external;
{
 * Error reporting.
  }
(* Const before type ignored *)
procedure xmlXPatherror(ctxt:TxmlXPathParserContextPtr; file:Pchar; line:longint; no:longint);cdecl;external;
procedure xmlXPathErr(ctxt:TxmlXPathParserContextPtr; error:longint);cdecl;external;
{$ifdef LIBXML_DEBUG_ENABLED}
procedure xmlXPathDebugDumpObject(output:PFILE; cur:TxmlXPathObjectPtr; depth:longint);cdecl;external;
procedure xmlXPathDebugDumpCompExpr(output:PFILE; comp:TxmlXPathCompExprPtr; depth:longint);cdecl;external;
{$endif}
{*
 * NodeSet handling.
  }

function xmlXPathNodeSetContains(cur:TxmlNodeSetPtr; val:TxmlNodePtr):longint;cdecl;external;
function xmlXPathDifference(nodes1:TxmlNodeSetPtr; nodes2:TxmlNodeSetPtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathIntersection(nodes1:TxmlNodeSetPtr; nodes2:TxmlNodeSetPtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathDistinctSorted(nodes:TxmlNodeSetPtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathDistinct(nodes:TxmlNodeSetPtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathHasSameNodes(nodes1:TxmlNodeSetPtr; nodes2:TxmlNodeSetPtr):longint;cdecl;external;
function xmlXPathNodeLeadingSorted(nodes:TxmlNodeSetPtr; node:TxmlNodePtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathLeadingSorted(nodes1:TxmlNodeSetPtr; nodes2:TxmlNodeSetPtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathNodeLeading(nodes:TxmlNodeSetPtr; node:TxmlNodePtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathLeading(nodes1:TxmlNodeSetPtr; nodes2:TxmlNodeSetPtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathNodeTrailingSorted(nodes:TxmlNodeSetPtr; node:TxmlNodePtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathTrailingSorted(nodes1:TxmlNodeSetPtr; nodes2:TxmlNodeSetPtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathNodeTrailing(nodes:TxmlNodeSetPtr; node:TxmlNodePtr):TxmlNodeSetPtr;cdecl;external;
function xmlXPathTrailing(nodes1:TxmlNodeSetPtr; nodes2:TxmlNodeSetPtr):TxmlNodeSetPtr;cdecl;external;
{*
 * Extending a context.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlXPathRegisterNs(ctxt:TxmlXPathContextPtr; prefix:PxmlChar; ns_uri:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlXPathNsLookup(ctxt:TxmlXPathContextPtr; prefix:PxmlChar):PxmlChar;cdecl;external;
procedure xmlXPathRegisteredNsCleanup(ctxt:TxmlXPathContextPtr);cdecl;external;
(* Const before type ignored *)
function xmlXPathRegisterFunc(ctxt:TxmlXPathContextPtr; name:PxmlChar; f:TxmlXPathFunction):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlXPathRegisterFuncNS(ctxt:TxmlXPathContextPtr; name:PxmlChar; ns_uri:PxmlChar; f:TxmlXPathFunction):longint;cdecl;external;
(* Const before type ignored *)
function xmlXPathRegisterVariable(ctxt:TxmlXPathContextPtr; name:PxmlChar; value:TxmlXPathObjectPtr):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlXPathRegisterVariableNS(ctxt:TxmlXPathContextPtr; name:PxmlChar; ns_uri:PxmlChar; value:TxmlXPathObjectPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlXPathFunctionLookup(ctxt:TxmlXPathContextPtr; name:PxmlChar):TxmlXPathFunction;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlXPathFunctionLookupNS(ctxt:TxmlXPathContextPtr; name:PxmlChar; ns_uri:PxmlChar):TxmlXPathFunction;cdecl;external;
procedure xmlXPathRegisteredFuncsCleanup(ctxt:TxmlXPathContextPtr);cdecl;external;
(* Const before type ignored *)
function xmlXPathVariableLookup(ctxt:TxmlXPathContextPtr; name:PxmlChar):TxmlXPathObjectPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlXPathVariableLookupNS(ctxt:TxmlXPathContextPtr; name:PxmlChar; ns_uri:PxmlChar):TxmlXPathObjectPtr;cdecl;external;
procedure xmlXPathRegisteredVariablesCleanup(ctxt:TxmlXPathContextPtr);cdecl;external;
{*
 * Utilities to extend XPath.
  }
(* Const before type ignored *)
function xmlXPathNewParserContext(str:PxmlChar; ctxt:TxmlXPathContextPtr):TxmlXPathParserContextPtr;cdecl;external;
procedure xmlXPathFreeParserContext(ctxt:TxmlXPathParserContextPtr);cdecl;external;
{ TODO: remap to xmlXPathValuePop and Push.  }
function valuePop(ctxt:TxmlXPathParserContextPtr):TxmlXPathObjectPtr;cdecl;external;
function valuePush(ctxt:TxmlXPathParserContextPtr; value:TxmlXPathObjectPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlXPathNewString(val:PxmlChar):TxmlXPathObjectPtr;cdecl;external;
(* Const before type ignored *)
function xmlXPathNewCString(val:Pchar):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathWrapString(val:PxmlChar):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathWrapCString(val:Pchar):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathNewFloat(val:Tdouble):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathNewBoolean(val:longint):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathNewNodeSet(val:TxmlNodePtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathNewValueTree(val:TxmlNodePtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathNodeSetAdd(cur:TxmlNodeSetPtr; val:TxmlNodePtr):longint;cdecl;external;
function xmlXPathNodeSetAddUnique(cur:TxmlNodeSetPtr; val:TxmlNodePtr):longint;cdecl;external;
function xmlXPathNodeSetAddNs(cur:TxmlNodeSetPtr; node:TxmlNodePtr; ns:TxmlNsPtr):longint;cdecl;external;
procedure xmlXPathNodeSetSort(set:TxmlNodeSetPtr);cdecl;external;
procedure xmlXPathRoot(ctxt:TxmlXPathParserContextPtr);cdecl;external;
procedure xmlXPathEvalExpr(ctxt:TxmlXPathParserContextPtr);cdecl;external;
function xmlXPathParseName(ctxt:TxmlXPathParserContextPtr):PxmlChar;cdecl;external;
function xmlXPathParseNCName(ctxt:TxmlXPathParserContextPtr):PxmlChar;cdecl;external;
{
 * Existing functions.
  }
(* Const before type ignored *)
function xmlXPathStringEvalNumber(str:PxmlChar):Tdouble;cdecl;external;
function xmlXPathEvaluatePredicateResult(ctxt:TxmlXPathParserContextPtr; res:TxmlXPathObjectPtr):longint;cdecl;external;
procedure xmlXPathRegisterAllFunctions(ctxt:TxmlXPathContextPtr);cdecl;external;
function xmlXPathNodeSetMerge(val1:TxmlNodeSetPtr; val2:TxmlNodeSetPtr):TxmlNodeSetPtr;cdecl;external;
procedure xmlXPathNodeSetDel(cur:TxmlNodeSetPtr; val:TxmlNodePtr);cdecl;external;
procedure xmlXPathNodeSetRemove(cur:TxmlNodeSetPtr; val:longint);cdecl;external;
function xmlXPathNewNodeSetList(val:TxmlNodeSetPtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathWrapNodeSet(val:TxmlNodeSetPtr):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathWrapExternal(val:pointer):TxmlXPathObjectPtr;cdecl;external;
function xmlXPathEqualValues(ctxt:TxmlXPathParserContextPtr):longint;cdecl;external;
function xmlXPathNotEqualValues(ctxt:TxmlXPathParserContextPtr):longint;cdecl;external;
function xmlXPathCompareValues(ctxt:TxmlXPathParserContextPtr; inf:longint; strict:longint):longint;cdecl;external;
procedure xmlXPathValueFlipSign(ctxt:TxmlXPathParserContextPtr);cdecl;external;
procedure xmlXPathAddValues(ctxt:TxmlXPathParserContextPtr);cdecl;external;
procedure xmlXPathSubValues(ctxt:TxmlXPathParserContextPtr);cdecl;external;
procedure xmlXPathMultValues(ctxt:TxmlXPathParserContextPtr);cdecl;external;
procedure xmlXPathDivValues(ctxt:TxmlXPathParserContextPtr);cdecl;external;
procedure xmlXPathModValues(ctxt:TxmlXPathParserContextPtr);cdecl;external;
(* Const before type ignored *)
function xmlXPathIsNodeType(name:PxmlChar):longint;cdecl;external;
{
 * Some of the axis navigation routines.
  }
function xmlXPathNextSelf(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextChild(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextDescendant(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextDescendantOrSelf(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextParent(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextAncestorOrSelf(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextFollowingSibling(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextFollowing(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextNamespace(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextAttribute(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextPreceding(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextAncestor(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlXPathNextPrecedingSibling(ctxt:TxmlXPathParserContextPtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
{
 * The official core of XPath functions.
  }
procedure xmlXPathLastFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathPositionFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathCountFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathIdFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathLocalNameFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathNamespaceURIFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathStringFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathStringLengthFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathConcatFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathContainsFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathStartsWithFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathSubstringFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathSubstringBeforeFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathSubstringAfterFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathNormalizeFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathTranslateFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathNotFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathTrueFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathFalseFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathLangFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathNumberFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathSumFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathFloorFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathCeilingFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathRoundFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
procedure xmlXPathBooleanFunction(ctxt:TxmlXPathParserContextPtr; nargs:longint);cdecl;external;
{*
 * Really internal functions
  }
procedure xmlXPathNodeSetFreeNs(ns:TxmlNsPtr);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_XPATH_ENABLED  }
{$endif}
{ ! __XML_XPATH_INTERNALS_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathSetArityError(ctxt : longint) : longint;
begin
  xmlXPathSetArityError:=xmlXPathSetError(ctxt,XPATH_INVALID_ARITY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathSetTypeError(ctxt : longint) : longint;
begin
  xmlXPathSetTypeError:=xmlXPathSetError(ctxt,XPATH_INVALID_TYPE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathGetError(ctxt : longint) : longint;
begin
  xmlXPathGetError:=ctxt^.error;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathCheckError(ctxt : longint) : longint;
begin
  xmlXPathCheckError:=(ctxt^.error)<>XPATH_EXPRESSION_OK;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathGetDocument(ctxt : longint) : longint;
begin
  xmlXPathGetDocument:=ctxt^.(context^.doc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathGetContextNode(ctxt : longint) : longint;
begin
  xmlXPathGetContextNode:=ctxt^.(context^.node);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnBoolean(ctxt,val : longint) : longint;
begin
  xmlXPathReturnBoolean:=valuePush(ctxt,xmlXPathNewBoolean(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnTrue(ctxt : longint) : longint;
begin
  xmlXPathReturnTrue:=xmlXPathReturnBoolean(ctxt,1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnFalse(ctxt : longint) : longint;
begin
  xmlXPathReturnFalse:=xmlXPathReturnBoolean(ctxt,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnNumber(ctxt,val : longint) : longint;
begin
  xmlXPathReturnNumber:=valuePush(ctxt,xmlXPathNewFloat(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnString(ctxt,str : longint) : longint;
begin
  xmlXPathReturnString:=valuePush(ctxt,xmlXPathWrapString(str));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnEmptyString(ctxt : longint) : longint;
begin
  xmlXPathReturnEmptyString:=valuePush(ctxt,xmlXPathNewCString(''));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnNodeSet(ctxt,ns : longint) : longint;
begin
  xmlXPathReturnNodeSet:=valuePush(ctxt,xmlXPathWrapNodeSet(ns));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnEmptyNodeSet(ctxt : longint) : longint;
begin
  xmlXPathReturnEmptyNodeSet:=valuePush(ctxt,xmlXPathNewNodeSet(NULL));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathReturnExternal(ctxt,val : longint) : longint;
begin
  xmlXPathReturnExternal:=valuePush(ctxt,xmlXPathWrapExternal(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathStackIsNodeSet(ctxt : longint) : longint;
begin
  xmlXPathStackIsNodeSet:=((ctxt^.value)<>NULL) and (@(((ctxt^.(value^._type))=XPATH_NODESET) or ((ctxt^.(value^._type))=XPATH_XSLT_TREE)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlXPathStackIsExternal(ctxt : longint) : longint;
begin
  xmlXPathStackIsExternal:=((ctxt^.value)<>NULL) and (@((ctxt^.(value^._type))=XPATH_USERS));
end;


end.

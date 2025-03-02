/*
 * Summary: internal interfaces for XML Path Language implementation
 * Description: internal interfaces for XML Path Language implementation
 *              used to build new modules on top of XPath like XPointer and
 *              XSLT
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_XPATH_INTERNALS_H__
#define __XML_XPATH_INTERNALS_H__

#include <libxml/xmlversion.h>
#include <libxml/xpath.h>

#ifdef LIBXML_XPATH_ENABLED

#ifdef __cplusplus
extern "C" {
#endif

/************************************************************************
 *									*
 *			Helpers						*
 *									*
 ************************************************************************/

/*
 * Many of these macros may later turn into functions. They
 * shouldn't be used in #ifdef's preprocessor instructions.
 */
/**
 * xmlXPathSetError:
 * @ctxt:  an XPath parser context
 * @err:  an xmlXPathError code
 *
 * Raises an error.
 */
//#define xmlXPathSetError(ctxt, err)					\
//    { xmlXPatherror((ctxt), __FILE__, __LINE__, (err));			\
//      if ((ctxt) != NULL) (ctxt)->error = (err); }

/**
 * xmlXPathSetArityError:
 * @ctxt:  an XPath parser context
 *
 * Raises an XPATH_INVALID_ARITY error.
 */
#define xmlXPathSetArityError(ctxt)					\
    xmlXPathSetError((ctxt), XPATH_INVALID_ARITY)

/**
 * xmlXPathSetTypeError:
 * @ctxt:  an XPath parser context
 *
 * Raises an XPATH_INVALID_TYPE error.
 */
#define xmlXPathSetTypeError(ctxt)					\
    xmlXPathSetError((ctxt), XPATH_INVALID_TYPE)

/**
 * xmlXPathGetError:
 * @ctxt:  an XPath parser context
 *
 * Get the error code of an XPath context.
 *
 * Returns the context error.
 */
#define xmlXPathGetError(ctxt)	  ((ctxt)->error)

/**
 * xmlXPathCheckError:
 * @ctxt:  an XPath parser context
 *
 * Check if an XPath error was raised.
 *
 * Returns true if an error has been raised, false otherwise.
 */
#define xmlXPathCheckError(ctxt)  ((ctxt)->error != XPATH_EXPRESSION_OK)

/**
 * xmlXPathGetDocument:
 * @ctxt:  an XPath parser context
 *
 * Get the document of an XPath context.
 *
 * Returns the context document.
 */
#define xmlXPathGetDocument(ctxt)	((ctxt)->context->doc)

/**
 * xmlXPathGetContextNode:
 * @ctxt: an XPath parser context
 *
 * Get the context node of an XPath context.
 *
 * Returns the context node.
 */
#define xmlXPathGetContextNode(ctxt)	((ctxt)->context->node)

extern int 
		xmlXPathPopBoolean	(xmlXPathParserContextPtr ctxt);
extern double 
		xmlXPathPopNumber	(xmlXPathParserContextPtr ctxt);
extern xmlChar * 
		xmlXPathPopString	(xmlXPathParserContextPtr ctxt);
extern xmlNodeSetPtr 
		xmlXPathPopNodeSet	(xmlXPathParserContextPtr ctxt);
extern void * 
		xmlXPathPopExternal	(xmlXPathParserContextPtr ctxt);

/**
 * xmlXPathReturnBoolean:
 * @ctxt:  an XPath parser context
 * @val:  a boolean
 *
 * Pushes the boolean @val on the context stack.
 */
#define xmlXPathReturnBoolean(ctxt, val)				\
    valuePush((ctxt), xmlXPathNewBoolean(val))

/**
 * xmlXPathReturnTrue:
 * @ctxt:  an XPath parser context
 *
 * Pushes true on the context stack.
 */
#define xmlXPathReturnTrue(ctxt)   xmlXPathReturnBoolean((ctxt), 1)

/**
 * xmlXPathReturnFalse:
 * @ctxt:  an XPath parser context
 *
 * Pushes false on the context stack.
 */
#define xmlXPathReturnFalse(ctxt)  xmlXPathReturnBoolean((ctxt), 0)

/**
 * xmlXPathReturnNumber:
 * @ctxt:  an XPath parser context
 * @val:  a double
 *
 * Pushes the double @val on the context stack.
 */
#define xmlXPathReturnNumber(ctxt, val)					\
    valuePush((ctxt), xmlXPathNewFloat(val))

/**
 * xmlXPathReturnString:
 * @ctxt:  an XPath parser context
 * @str:  a string
 *
 * Pushes the string @str on the context stack.
 */
#define xmlXPathReturnString(ctxt, str)					\
    valuePush((ctxt), xmlXPathWrapString(str))

/**
 * xmlXPathReturnEmptyString:
 * @ctxt:  an XPath parser context
 *
 * Pushes an empty string on the stack.
 */
#define xmlXPathReturnEmptyString(ctxt)					\
    valuePush((ctxt), xmlXPathNewCString(""))

/**
 * xmlXPathReturnNodeSet:
 * @ctxt:  an XPath parser context
 * @ns:  a node-set
 *
 * Pushes the node-set @ns on the context stack.
 */
#define xmlXPathReturnNodeSet(ctxt, ns)					\
    valuePush((ctxt), xmlXPathWrapNodeSet(ns))

/**
 * xmlXPathReturnEmptyNodeSet:
 * @ctxt:  an XPath parser context
 *
 * Pushes an empty node-set on the context stack.
 */
#define xmlXPathReturnEmptyNodeSet(ctxt)				\
    valuePush((ctxt), xmlXPathNewNodeSet(NULL))

/**
 * xmlXPathReturnExternal:
 * @ctxt:  an XPath parser context
 * @val:  user data
 *
 * Pushes user data on the context stack.
 */
#define xmlXPathReturnExternal(ctxt, val)				\
    valuePush((ctxt), xmlXPathWrapExternal(val))

/**
 * xmlXPathStackIsNodeSet:
 * @ctxt: an XPath parser context
 *
 * Check if the current value on the XPath stack is a node set or
 * an XSLT value tree.
 *
 * Returns true if the current object on the stack is a node-set.
 */
#define xmlXPathStackIsNodeSet(ctxt)					\
    (((ctxt)->value != NULL)						\
     && (((ctxt)->value->type == XPATH_NODESET)				\
         | ((ctxt)->value->type == XPATH_XSLT_TREE)))

/**
 * xmlXPathStackIsExternal:
 * @ctxt: an XPath parser context
 *
 * Checks if the current value on the XPath stack is an external
 * object.
 *
 * Returns true if the current object on the stack is an external
 * object.
 */
#define xmlXPathStackIsExternal(ctxt)					\
	((ctxt->value != NULL) && (ctxt->value->type == XPATH_USERS))

/**
 * xmlXPathEmptyNodeSet:
 * @ns:  a node-set
 *
 * Empties a node-set.
 */
//#define xmlXPathEmptyNodeSet(ns)					\
//    { while ((ns)->nodeNr > 0) (ns)->nodeTab[--(ns)->nodeNr] = NULL; }

/**
 * CHECK_ERROR:
 *
 * Macro to return from the function if an XPath error was detected.
 */
//#define CHECK_ERROR							\
//    if (ctxt->error != XPATH_EXPRESSION_OK) return

/**
 * CHECK_ERROR0:
 *
 * Macro to return 0 from the function if an XPath error was detected.
 */
//#define CHECK_ERROR0							\
//    if (ctxt->error != XPATH_EXPRESSION_OK) return(0)

/**
 * XP_ERROR:
 * @X:  the error code
 *
 * Macro to raise an XPath error and return.
 */
//#define XP_ERROR(X)							\
//    { xmlXPathErr(ctxt, X); return; }

/**
 * XP_ERROR0:
 * @X:  the error code
 *
 * Macro to raise an XPath error and return 0.
 */
//#define XP_ERROR0(X)							\
//    { xmlXPathErr(ctxt, X); return(0); }

/**
 * CHECK_TYPE:
 * @typeval:  the XPath type
 *
 * Macro to check that the value on top of the XPath stack is of a given
 * type.
 */
//#define CHECK_TYPE(typeval)						\
//    if ((ctxt->value == NULL) || (ctxt->value->type != typeval))	\
//        XP_ERROR(XPATH_INVALID_TYPE)

/**
 * CHECK_TYPE0:
 * @typeval:  the XPath type
 *
 * Macro to check that the value on top of the XPath stack is of a given
 * type. Return(0) in case of failure
 */
//#define CHECK_TYPE0(typeval)						\
//    if ((ctxt->value == NULL) || (ctxt->value->type != typeval))	\
//        XP_ERROR0(XPATH_INVALID_TYPE)

/**
 * CHECK_ARITY:
 * @x:  the number of expected args
 *
 * Macro to check that the number of args passed to an XPath function matches.
 */
//#define CHECK_ARITY(x)							\
//    if (ctxt == NULL) return;						\
//    if (nargs != (x))							\
//        XP_ERROR(XPATH_INVALID_ARITY);					\
//    if (ctxt->valueNr < ctxt->valueFrame + (x))				\
//        XP_ERROR(XPATH_STACK_ERROR);

/**
 * CAST_TO_STRING:
 *
 * Macro to try to cast the value on the top of the XPath stack to a string.
 */
//#define CAST_TO_STRING							\
//    if ((ctxt->value != NULL) && (ctxt->value->type != XPATH_STRING))	\
//        xmlXPathStringFunction(ctxt, 1);

/**
 * CAST_TO_NUMBER:
 *
 * Macro to try to cast the value on the top of the XPath stack to a number.
 */
//#define CAST_TO_NUMBER							\
//    if ((ctxt->value != NULL) && (ctxt->value->type != XPATH_NUMBER))	\
//        xmlXPathNumberFunction(ctxt, 1);

/**
 * CAST_TO_BOOLEAN:
 *
 * Macro to try to cast the value on the top of the XPath stack to a boolean.
 */
//#define CAST_TO_BOOLEAN							\
//    if ((ctxt->value != NULL) && (ctxt->value->type != XPATH_BOOLEAN))	\
//        xmlXPathBooleanFunction(ctxt, 1);

/*
 * Variable Lookup forwarding.
 */

extern void 
	xmlXPathRegisterVariableLookup	(xmlXPathContextPtr ctxt,
					 xmlXPathVariableLookupFunc f,
					 void *data);

/*
 * Function Lookup forwarding.
 */

extern void 
	    xmlXPathRegisterFuncLookup	(xmlXPathContextPtr ctxt,
					 xmlXPathFuncLookupFunc f,
					 void *funcCtxt);

/*
 * Error reporting.
 */
extern void 
		xmlXPatherror	(xmlXPathParserContextPtr ctxt,
				 const char *file,
				 int line,
				 int no);

extern void 
		xmlXPathErr	(xmlXPathParserContextPtr ctxt,
				 int error);

#ifdef LIBXML_DEBUG_ENABLED
extern void 
		xmlXPathDebugDumpObject	(FILE *output,
					 xmlXPathObjectPtr cur,
					 int depth);
extern void 
	    xmlXPathDebugDumpCompExpr(FILE *output,
					 xmlXPathCompExprPtr comp,
					 int depth);
#endif
/**
 * NodeSet handling.
 */
extern int 
		xmlXPathNodeSetContains		(xmlNodeSetPtr cur,
						 xmlNodePtr val);
extern xmlNodeSetPtr 
		xmlXPathDifference		(xmlNodeSetPtr nodes1,
						 xmlNodeSetPtr nodes2);
extern xmlNodeSetPtr 
		xmlXPathIntersection		(xmlNodeSetPtr nodes1,
						 xmlNodeSetPtr nodes2);

extern xmlNodeSetPtr 
		xmlXPathDistinctSorted		(xmlNodeSetPtr nodes);
extern xmlNodeSetPtr 
		xmlXPathDistinct		(xmlNodeSetPtr nodes);

extern int 
		xmlXPathHasSameNodes		(xmlNodeSetPtr nodes1,
						 xmlNodeSetPtr nodes2);

extern xmlNodeSetPtr 
		xmlXPathNodeLeadingSorted	(xmlNodeSetPtr nodes,
						 xmlNodePtr node);
extern xmlNodeSetPtr 
		xmlXPathLeadingSorted		(xmlNodeSetPtr nodes1,
						 xmlNodeSetPtr nodes2);
extern xmlNodeSetPtr 
		xmlXPathNodeLeading		(xmlNodeSetPtr nodes,
						 xmlNodePtr node);
extern xmlNodeSetPtr 
		xmlXPathLeading			(xmlNodeSetPtr nodes1,
						 xmlNodeSetPtr nodes2);

extern xmlNodeSetPtr 
		xmlXPathNodeTrailingSorted	(xmlNodeSetPtr nodes,
						 xmlNodePtr node);
extern xmlNodeSetPtr 
		xmlXPathTrailingSorted		(xmlNodeSetPtr nodes1,
						 xmlNodeSetPtr nodes2);
extern xmlNodeSetPtr 
		xmlXPathNodeTrailing		(xmlNodeSetPtr nodes,
						 xmlNodePtr node);
extern xmlNodeSetPtr 
		xmlXPathTrailing		(xmlNodeSetPtr nodes1,
						 xmlNodeSetPtr nodes2);


/**
 * Extending a context.
 */

extern int 
		xmlXPathRegisterNs		(xmlXPathContextPtr ctxt,
						 const xmlChar *prefix,
						 const xmlChar *ns_uri);
extern const xmlChar * 
		xmlXPathNsLookup		(xmlXPathContextPtr ctxt,
						 const xmlChar *prefix);
extern void 
		xmlXPathRegisteredNsCleanup	(xmlXPathContextPtr ctxt);

extern int 
		xmlXPathRegisterFunc		(xmlXPathContextPtr ctxt,
						 const xmlChar *name,
						 xmlXPathFunction f);
extern int 
		xmlXPathRegisterFuncNS		(xmlXPathContextPtr ctxt,
						 const xmlChar *name,
						 const xmlChar *ns_uri,
						 xmlXPathFunction f);
extern int 
		xmlXPathRegisterVariable	(xmlXPathContextPtr ctxt,
						 const xmlChar *name,
						 xmlXPathObjectPtr value);
extern int 
		xmlXPathRegisterVariableNS	(xmlXPathContextPtr ctxt,
						 const xmlChar *name,
						 const xmlChar *ns_uri,
						 xmlXPathObjectPtr value);
extern xmlXPathFunction 
		xmlXPathFunctionLookup		(xmlXPathContextPtr ctxt,
						 const xmlChar *name);
extern xmlXPathFunction 
		xmlXPathFunctionLookupNS	(xmlXPathContextPtr ctxt,
						 const xmlChar *name,
						 const xmlChar *ns_uri);
extern void 
		xmlXPathRegisteredFuncsCleanup	(xmlXPathContextPtr ctxt);
extern xmlXPathObjectPtr 
		xmlXPathVariableLookup		(xmlXPathContextPtr ctxt,
						 const xmlChar *name);
extern xmlXPathObjectPtr 
		xmlXPathVariableLookupNS	(xmlXPathContextPtr ctxt,
						 const xmlChar *name,
						 const xmlChar *ns_uri);
extern void 
		xmlXPathRegisteredVariablesCleanup(xmlXPathContextPtr ctxt);

/**
 * Utilities to extend XPath.
 */
extern xmlXPathParserContextPtr 
		  xmlXPathNewParserContext	(const xmlChar *str,
						 xmlXPathContextPtr ctxt);
extern void 
		xmlXPathFreeParserContext	(xmlXPathParserContextPtr ctxt);

/* TODO: remap to xmlXPathValuePop and Push. */
extern xmlXPathObjectPtr 
		valuePop			(xmlXPathParserContextPtr ctxt);
extern int 
		valuePush			(xmlXPathParserContextPtr ctxt,
						 xmlXPathObjectPtr value);

extern xmlXPathObjectPtr 
		xmlXPathNewString		(const xmlChar *val);
extern xmlXPathObjectPtr 
		xmlXPathNewCString		(const char *val);
extern xmlXPathObjectPtr 
		xmlXPathWrapString		(xmlChar *val);
extern xmlXPathObjectPtr 
		xmlXPathWrapCString		(char * val);
extern xmlXPathObjectPtr 
		xmlXPathNewFloat		(double val);
extern xmlXPathObjectPtr 
		xmlXPathNewBoolean		(int val);
extern xmlXPathObjectPtr 
		xmlXPathNewNodeSet		(xmlNodePtr val);
extern xmlXPathObjectPtr 
		xmlXPathNewValueTree		(xmlNodePtr val);
extern int 
		xmlXPathNodeSetAdd		(xmlNodeSetPtr cur,
						 xmlNodePtr val);
extern int 
		xmlXPathNodeSetAddUnique	(xmlNodeSetPtr cur,
						 xmlNodePtr val);
extern int 
		xmlXPathNodeSetAddNs		(xmlNodeSetPtr cur,
						 xmlNodePtr node,
						 xmlNsPtr ns);
extern void 
		xmlXPathNodeSetSort		(xmlNodeSetPtr set);

extern void 
		xmlXPathRoot			(xmlXPathParserContextPtr ctxt);
extern void 
		xmlXPathEvalExpr		(xmlXPathParserContextPtr ctxt);
extern xmlChar * 
		xmlXPathParseName		(xmlXPathParserContextPtr ctxt);
extern xmlChar * 
		xmlXPathParseNCName		(xmlXPathParserContextPtr ctxt);

/*
 * Existing functions.
 */
extern double 
		xmlXPathStringEvalNumber	(const xmlChar *str);
extern int 
		xmlXPathEvaluatePredicateResult (xmlXPathParserContextPtr ctxt,
						 xmlXPathObjectPtr res);
extern void 
		xmlXPathRegisterAllFunctions	(xmlXPathContextPtr ctxt);
extern xmlNodeSetPtr 
		xmlXPathNodeSetMerge		(xmlNodeSetPtr val1,
						 xmlNodeSetPtr val2);
extern void 
		xmlXPathNodeSetDel		(xmlNodeSetPtr cur,
						 xmlNodePtr val);
extern void 
		xmlXPathNodeSetRemove		(xmlNodeSetPtr cur,
						 int val);
extern xmlXPathObjectPtr 
		xmlXPathNewNodeSetList		(xmlNodeSetPtr val);
extern xmlXPathObjectPtr 
		xmlXPathWrapNodeSet		(xmlNodeSetPtr val);
extern xmlXPathObjectPtr 
		xmlXPathWrapExternal		(void *val);

extern int  xmlXPathEqualValues(xmlXPathParserContextPtr ctxt);
extern int  xmlXPathNotEqualValues(xmlXPathParserContextPtr ctxt);
extern int  xmlXPathCompareValues(xmlXPathParserContextPtr ctxt, int inf, int strict);
extern void  xmlXPathValueFlipSign(xmlXPathParserContextPtr ctxt);
extern void  xmlXPathAddValues(xmlXPathParserContextPtr ctxt);
extern void  xmlXPathSubValues(xmlXPathParserContextPtr ctxt);
extern void  xmlXPathMultValues(xmlXPathParserContextPtr ctxt);
extern void  xmlXPathDivValues(xmlXPathParserContextPtr ctxt);
extern void  xmlXPathModValues(xmlXPathParserContextPtr ctxt);

extern int  xmlXPathIsNodeType(const xmlChar *name);

/*
 * Some of the axis navigation routines.
 */
extern xmlNodePtr  xmlXPathNextSelf(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextChild(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextDescendant(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextDescendantOrSelf(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextParent(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextAncestorOrSelf(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextFollowingSibling(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextFollowing(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextNamespace(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextAttribute(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextPreceding(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextAncestor(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
extern xmlNodePtr  xmlXPathNextPrecedingSibling(xmlXPathParserContextPtr ctxt,
			xmlNodePtr cur);
/*
 * The official core of XPath functions.
 */
extern void  xmlXPathLastFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathPositionFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathCountFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathIdFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathLocalNameFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathNamespaceURIFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathStringFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathStringLengthFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathConcatFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathContainsFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathStartsWithFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathSubstringFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathSubstringBeforeFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathSubstringAfterFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathNormalizeFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathTranslateFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathNotFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathTrueFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathFalseFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathLangFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathNumberFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathSumFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathFloorFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathCeilingFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathRoundFunction(xmlXPathParserContextPtr ctxt, int nargs);
extern void  xmlXPathBooleanFunction(xmlXPathParserContextPtr ctxt, int nargs);

/**
 * Really internal functions
 */
extern void  xmlXPathNodeSetFreeNs(xmlNsPtr ns);

#ifdef __cplusplus
}
#endif

#endif /* LIBXML_XPATH_ENABLED */
#endif /* ! __XML_XPATH_INTERNALS_H__ */

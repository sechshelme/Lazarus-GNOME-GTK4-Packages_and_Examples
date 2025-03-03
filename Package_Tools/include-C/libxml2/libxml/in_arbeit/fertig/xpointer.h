/*
 * Summary: API to handle XML Pointers
 * Description: API to handle XML Pointers
 * Base implementation was made accordingly to
 * W3C Candidate Recommendation 7 June 2000
 * http://www.w3.org/TR/2000/CR-xptr-20000607
 *
 * Added support for the element() scheme described in:
 * W3C Proposed Recommendation 13 November 2002
 * http://www.w3.org/TR/2002/PR-xptr-element-20021113/
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_XPTR_H__
#define __XML_XPTR_H__

#include <libxml/xmlversion.h>

#ifdef LIBXML_XPTR_ENABLED

#include <libxml/tree.h>
#include <libxml/xpath.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * A Location Set
 */
typedef struct _xmlLocationSet xmlLocationSet;
typedef xmlLocationSet *xmlLocationSetPtr;
struct _xmlLocationSet {
    int locNr;		      /* number of locations in the set */
    int locMax;		      /* size of the array as allocated */
    xmlXPathObjectPtr *locTab;/* array of locations */
};

/*
 * Handling of location sets.
 */

extern xmlLocationSetPtr 
		    xmlXPtrLocationSetCreate	(xmlXPathObjectPtr val);
extern void 
		    xmlXPtrFreeLocationSet	(xmlLocationSetPtr obj);
extern xmlLocationSetPtr 
		    xmlXPtrLocationSetMerge	(xmlLocationSetPtr val1,
						 xmlLocationSetPtr val2);
extern xmlXPathObjectPtr 
		    xmlXPtrNewRange		(xmlNodePtr start,
						 int startindex,
						 xmlNodePtr end,
						 int endindex);
extern xmlXPathObjectPtr 
		    xmlXPtrNewRangePoints	(xmlXPathObjectPtr start,
						 xmlXPathObjectPtr end);
extern xmlXPathObjectPtr 
		    xmlXPtrNewRangeNodePoint	(xmlNodePtr start,
						 xmlXPathObjectPtr end);
extern xmlXPathObjectPtr 
		    xmlXPtrNewRangePointNode	(xmlXPathObjectPtr start,
						 xmlNodePtr end);
extern xmlXPathObjectPtr 
		    xmlXPtrNewRangeNodes	(xmlNodePtr start,
						 xmlNodePtr end);
extern xmlXPathObjectPtr 
		    xmlXPtrNewLocationSetNodes	(xmlNodePtr start,
						 xmlNodePtr end);
extern xmlXPathObjectPtr 
		    xmlXPtrNewLocationSetNodeSet(xmlNodeSetPtr set);
extern xmlXPathObjectPtr 
		    xmlXPtrNewRangeNodeObject	(xmlNodePtr start,
						 xmlXPathObjectPtr end);
extern xmlXPathObjectPtr 
		    xmlXPtrNewCollapsedRange	(xmlNodePtr start);
extern void 
		    xmlXPtrLocationSetAdd	(xmlLocationSetPtr cur,
						 xmlXPathObjectPtr val);
extern xmlXPathObjectPtr 
		    xmlXPtrWrapLocationSet	(xmlLocationSetPtr val);
extern void 
		    xmlXPtrLocationSetDel	(xmlLocationSetPtr cur,
						 xmlXPathObjectPtr val);
extern void 
		    xmlXPtrLocationSetRemove	(xmlLocationSetPtr cur,
						 int val);

/*
 * Functions.
 */
extern xmlXPathContextPtr 
		    xmlXPtrNewContext		(xmlDocPtr doc,
						 xmlNodePtr here,
						 xmlNodePtr origin);
extern xmlXPathObjectPtr 
		    xmlXPtrEval			(const xmlChar *str,
						 xmlXPathContextPtr ctx);
extern void 
		    xmlXPtrRangeToFunction	(xmlXPathParserContextPtr ctxt,
						 int nargs);
extern xmlNodePtr 
		    xmlXPtrBuildNodeList	(xmlXPathObjectPtr obj);
extern void 
		    xmlXPtrEvalRangePredicate	(xmlXPathParserContextPtr ctxt);
#ifdef __cplusplus
}
#endif

#endif /* LIBXML_XPTR_ENABLED */
#endif /* __XML_XPTR_H__ */

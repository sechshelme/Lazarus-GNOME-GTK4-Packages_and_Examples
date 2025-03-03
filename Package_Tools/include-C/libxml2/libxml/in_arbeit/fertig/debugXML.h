/*
 * Summary: Tree debugging APIs
 * Description: Interfaces to a set of routines used for debugging the tree
 *              produced by the XML parser.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __DEBUG_XML__
#define __DEBUG_XML__
#include <stdio.h>
#include <libxml/xmlversion.h>
#include <libxml/tree.h>

#ifdef LIBXML_DEBUG_ENABLED

#include <libxml/xpath.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * The standard Dump routines.
 */
extern void 
	xmlDebugDumpString	(FILE *output,
				 const xmlChar *str);
extern void 
	xmlDebugDumpAttr	(FILE *output,
				 xmlAttrPtr attr,
				 int depth);
extern void 
	xmlDebugDumpAttrList	(FILE *output,
				 xmlAttrPtr attr,
				 int depth);
extern void 
	xmlDebugDumpOneNode	(FILE *output,
				 xmlNodePtr node,
				 int depth);
extern void 
	xmlDebugDumpNode	(FILE *output,
				 xmlNodePtr node,
				 int depth);
extern void 
	xmlDebugDumpNodeList	(FILE *output,
				 xmlNodePtr node,
				 int depth);
extern void 
	xmlDebugDumpDocumentHead(FILE *output,
				 xmlDocPtr doc);
extern void 
	xmlDebugDumpDocument	(FILE *output,
				 xmlDocPtr doc);
extern void 
	xmlDebugDumpDTD		(FILE *output,
				 xmlDtdPtr dtd);
extern void 
	xmlDebugDumpEntities	(FILE *output,
				 xmlDocPtr doc);

/****************************************************************
 *								*
 *			Checking routines			*
 *								*
 ****************************************************************/

extern int 
	xmlDebugCheckDocument	(FILE * output,
				 xmlDocPtr doc);

/****************************************************************
 *								*
 *			XML shell helpers			*
 *								*
 ****************************************************************/

extern void 
	xmlLsOneNode		(FILE *output, xmlNodePtr node);
extern int 
	xmlLsCountNode		(xmlNodePtr node);

extern const char * 
	xmlBoolToText		(int boolval);

/****************************************************************
 *								*
 *	 The XML shell related structures and functions		*
 *								*
 ****************************************************************/

#ifdef LIBXML_XPATH_ENABLED
/**
 * xmlShellReadlineFunc:
 * @prompt:  a string prompt
 *
 * This is a generic signature for the XML shell input function.
 *
 * Returns a string which will be freed by the Shell.
 */
typedef char * (* xmlShellReadlineFunc)(char *prompt);

/**
 * xmlShellCtxt:
 *
 * A debugging shell context.
 * TODO: add the defined function tables.
 */
typedef struct _xmlShellCtxt xmlShellCtxt;
typedef xmlShellCtxt *xmlShellCtxtPtr;
struct _xmlShellCtxt {
    char *filename;
    xmlDocPtr doc;
    xmlNodePtr node;
    xmlXPathContextPtr pctxt;
    int loaded;
    FILE *output;
    xmlShellReadlineFunc input;
};

/**
 * xmlShellCmd:
 * @ctxt:  a shell context
 * @arg:  a string argument
 * @node:  a first node
 * @node2:  a second node
 *
 * This is a generic signature for the XML shell functions.
 *
 * Returns an int, negative returns indicating errors.
 */
typedef int (* xmlShellCmd) (xmlShellCtxtPtr ctxt,
                             char *arg,
			     xmlNodePtr node,
			     xmlNodePtr node2);

extern void 
	xmlShellPrintXPathError	(int errorType,
				 const char *arg);
extern void 
	xmlShellPrintXPathResult(xmlXPathObjectPtr list);
extern int 
	xmlShellList		(xmlShellCtxtPtr ctxt,
				 char *arg,
				 xmlNodePtr node,
				 xmlNodePtr node2);
extern int 
	xmlShellBase		(xmlShellCtxtPtr ctxt,
				 char *arg,
				 xmlNodePtr node,
				 xmlNodePtr node2);
extern int 
	xmlShellDir		(xmlShellCtxtPtr ctxt,
				 char *arg,
				 xmlNodePtr node,
				 xmlNodePtr node2);
extern int 
	xmlShellLoad		(xmlShellCtxtPtr ctxt,
				 char *filename,
				 xmlNodePtr node,
				 xmlNodePtr node2);
#ifdef LIBXML_OUTPUT_ENABLED
extern void 
	xmlShellPrintNode	(xmlNodePtr node);
extern int 
	xmlShellCat		(xmlShellCtxtPtr ctxt,
				 char *arg,
				 xmlNodePtr node,
				 xmlNodePtr node2);
extern int 
	xmlShellWrite		(xmlShellCtxtPtr ctxt,
				 char *filename,
				 xmlNodePtr node,
				 xmlNodePtr node2);
extern int 
	xmlShellSave		(xmlShellCtxtPtr ctxt,
				 char *filename,
				 xmlNodePtr node,
				 xmlNodePtr node2);
#endif /* LIBXML_OUTPUT_ENABLED */
#ifdef LIBXML_VALID_ENABLED
extern int 
	xmlShellValidate	(xmlShellCtxtPtr ctxt,
				 char *dtd,
				 xmlNodePtr node,
				 xmlNodePtr node2);
#endif /* LIBXML_VALID_ENABLED */
extern int 
	xmlShellDu		(xmlShellCtxtPtr ctxt,
				 char *arg,
				 xmlNodePtr tree,
				 xmlNodePtr node2);
extern int 
	xmlShellPwd		(xmlShellCtxtPtr ctxt,
				 char *buffer,
				 xmlNodePtr node,
				 xmlNodePtr node2);

/*
 * The Shell interface.
 */
extern void 
	xmlShell		(xmlDocPtr doc,
				 char *filename,
				 xmlShellReadlineFunc input,
				 FILE *output);

#endif /* LIBXML_XPATH_ENABLED */

#ifdef __cplusplus
}
#endif

#endif /* LIBXML_DEBUG_ENABLED */
#endif /* __DEBUG_XML__ */

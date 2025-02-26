/*
 * Summary: Old SAX version 1 handler, deprecated
 * Description: DEPRECATED set of SAX version 1 interfaces used to
 *              build the DOM tree.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */


#ifndef __XML_SAX_H__
#define __XML_SAX_H__

#include <stdio.h>
#include <stdlib.h>
#include <libxml/xmlversion.h>
#include <libxml/parser.h>
#include <libxml/xlink.h>

#ifdef LIBXML_LEGACY_ENABLED

#ifdef __cplusplus
extern "C" {
#endif
extern const xmlChar * 
		getPublicId			(void *ctx);
extern const xmlChar * 
		getSystemId			(void *ctx);
extern void 
		setDocumentLocator		(void *ctx,
						 xmlSAXLocatorPtr loc);

extern int 
		getLineNumber			(void *ctx);
extern int 
		getColumnNumber			(void *ctx);

extern int 
		isStandalone			(void *ctx);
extern int 
		hasInternalSubset		(void *ctx);
extern int 
		hasExternalSubset		(void *ctx);

extern void 
		internalSubset			(void *ctx,
						 const xmlChar *name,
						 const xmlChar *ExternalID,
						 const xmlChar *SystemID);
extern void 
		externalSubset			(void *ctx,
						 const xmlChar *name,
						 const xmlChar *ExternalID,
						 const xmlChar *SystemID);
extern xmlEntityPtr 
		getEntity			(void *ctx,
						 const xmlChar *name);
extern xmlEntityPtr 
		getParameterEntity		(void *ctx,
						 const xmlChar *name);
extern xmlParserInputPtr 
		resolveEntity			(void *ctx,
						 const xmlChar *publicId,
						 const xmlChar *systemId);

extern void 
		entityDecl			(void *ctx,
						 const xmlChar *name,
						 int type,
						 const xmlChar *publicId,
						 const xmlChar *systemId,
						 xmlChar *content);
extern void 
		attributeDecl			(void *ctx,
						 const xmlChar *elem,
						 const xmlChar *fullname,
						 int type,
						 int def,
						 const xmlChar *defaultValue,
						 xmlEnumerationPtr tree);
extern void 
		elementDecl			(void *ctx,
						 const xmlChar *name,
						 int type,
						 xmlElementContentPtr content);
extern void 
		notationDecl			(void *ctx,
						 const xmlChar *name,
						 const xmlChar *publicId,
						 const xmlChar *systemId);
extern void 
		unparsedEntityDecl		(void *ctx,
						 const xmlChar *name,
						 const xmlChar *publicId,
						 const xmlChar *systemId,
						 const xmlChar *notationName);

extern void 
		startDocument			(void *ctx);
extern void 
		endDocument			(void *ctx);
extern void 
		attribute			(void *ctx,
						 const xmlChar *fullname,
						 const xmlChar *value);
extern void 
		startElement			(void *ctx,
						 const xmlChar *fullname,
						 const xmlChar **atts);
extern void 
		endElement			(void *ctx,
						 const xmlChar *name);
extern void 
		reference			(void *ctx,
						 const xmlChar *name);
extern void 
		characters			(void *ctx,
						 const xmlChar *ch,
						 int len);
extern void 
		ignorableWhitespace		(void *ctx,
						 const xmlChar *ch,
						 int len);
extern void 
		processingInstruction		(void *ctx,
						 const xmlChar *target,
						 const xmlChar *data);
extern void 
		globalNamespace			(void *ctx,
						 const xmlChar *href,
						 const xmlChar *prefix);
extern void 
		setNamespace			(void *ctx,
						 const xmlChar *name);
extern xmlNsPtr 
		getNamespace			(void *ctx);
extern int 
		checkNamespace			(void *ctx,
						 xmlChar *nameSpace);
extern void 
		namespaceDecl			(void *ctx,
						 const xmlChar *href,
						 const xmlChar *prefix);
extern void 
		comment				(void *ctx,
						 const xmlChar *value);
extern void 
		cdataBlock			(void *ctx,
						 const xmlChar *value,
						 int len);

#ifdef LIBXML_SAX1_ENABLED
extern void 
		initxmlDefaultSAXHandler	(xmlSAXHandlerV1 *hdlr,
						 int warning);
#ifdef LIBXML_HTML_ENABLED
extern void 
		inithtmlDefaultSAXHandler	(xmlSAXHandlerV1 *hdlr);
#endif
#ifdef LIBXML_DOCB_ENABLED
extern void 
		initdocbDefaultSAXHandler	(xmlSAXHandlerV1 *hdlr);
#endif
#endif /* LIBXML_SAX1_ENABLED */

#ifdef __cplusplus
}
#endif

#endif /* LIBXML_LEGACY_ENABLED */

#endif /* __XML_SAX_H__ */

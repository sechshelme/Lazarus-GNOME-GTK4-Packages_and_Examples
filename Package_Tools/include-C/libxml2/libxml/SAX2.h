/*
 * Summary: SAX2 parser interface used to build the DOM tree
 * Description: those are the default SAX2 interfaces used by
 *              the library when building DOM tree.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */


#ifndef __XML_SAX2_H__
#define __XML_SAX2_H__

#include <stdio.h>
#include <stdlib.h>
#include <libxml/xmlversion.h>
#include <libxml/parser.h>
#include <libxml/xlink.h>

#ifdef __cplusplus
extern "C" {
#endif
extern const xmlChar * 
		xmlSAX2GetPublicId		(void *ctx);
extern const xmlChar * 
		xmlSAX2GetSystemId		(void *ctx);
extern void 
		xmlSAX2SetDocumentLocator	(void *ctx,
						 xmlSAXLocatorPtr loc);

extern int 
		xmlSAX2GetLineNumber		(void *ctx);
extern int 
		xmlSAX2GetColumnNumber		(void *ctx);

extern int 
		xmlSAX2IsStandalone		(void *ctx);
extern int 
		xmlSAX2HasInternalSubset	(void *ctx);
extern int 
		xmlSAX2HasExternalSubset	(void *ctx);

extern void 
		xmlSAX2InternalSubset		(void *ctx,
						 const xmlChar *name,
						 const xmlChar *ExternalID,
						 const xmlChar *SystemID);
extern void 
		xmlSAX2ExternalSubset		(void *ctx,
						 const xmlChar *name,
						 const xmlChar *ExternalID,
						 const xmlChar *SystemID);
extern xmlEntityPtr 
		xmlSAX2GetEntity		(void *ctx,
						 const xmlChar *name);
extern xmlEntityPtr 
		xmlSAX2GetParameterEntity	(void *ctx,
						 const xmlChar *name);
extern xmlParserInputPtr 
		xmlSAX2ResolveEntity		(void *ctx,
						 const xmlChar *publicId,
						 const xmlChar *systemId);

extern void 
		xmlSAX2EntityDecl		(void *ctx,
						 const xmlChar *name,
						 int type,
						 const xmlChar *publicId,
						 const xmlChar *systemId,
						 xmlChar *content);
extern void 
		xmlSAX2AttributeDecl		(void *ctx,
						 const xmlChar *elem,
						 const xmlChar *fullname,
						 int type,
						 int def,
						 const xmlChar *defaultValue,
						 xmlEnumerationPtr tree);
extern void 
		xmlSAX2ElementDecl		(void *ctx,
						 const xmlChar *name,
						 int type,
						 xmlElementContentPtr content);
extern void 
		xmlSAX2NotationDecl		(void *ctx,
						 const xmlChar *name,
						 const xmlChar *publicId,
						 const xmlChar *systemId);
extern void 
		xmlSAX2UnparsedEntityDecl	(void *ctx,
						 const xmlChar *name,
						 const xmlChar *publicId,
						 const xmlChar *systemId,
						 const xmlChar *notationName);

extern void 
		xmlSAX2StartDocument		(void *ctx);
extern void 
		xmlSAX2EndDocument		(void *ctx);
#if defined(LIBXML_SAX1_ENABLED) || defined(LIBXML_HTML_ENABLED) || \
    defined(LIBXML_WRITER_ENABLED) || defined(LIBXML_DOCB_ENABLED) || \
    defined(LIBXML_LEGACY_ENABLED)
extern void 
		xmlSAX2StartElement		(void *ctx,
						 const xmlChar *fullname,
						 const xmlChar **atts);
extern void 
		xmlSAX2EndElement		(void *ctx,
						 const xmlChar *name);
#endif /* LIBXML_SAX1_ENABLED or LIBXML_HTML_ENABLED or LIBXML_LEGACY_ENABLED */
extern void 
		xmlSAX2StartElementNs		(void *ctx,
						 const xmlChar *localname,
						 const xmlChar *prefix,
						 const xmlChar *URI,
						 int nb_namespaces,
						 const xmlChar **namespaces,
						 int nb_attributes,
						 int nb_defaulted,
						 const xmlChar **attributes);
extern void 
		xmlSAX2EndElementNs		(void *ctx,
						 const xmlChar *localname,
						 const xmlChar *prefix,
						 const xmlChar *URI);
extern void 
		xmlSAX2Reference		(void *ctx,
						 const xmlChar *name);
extern void 
		xmlSAX2Characters		(void *ctx,
						 const xmlChar *ch,
						 int len);
extern void 
		xmlSAX2IgnorableWhitespace	(void *ctx,
						 const xmlChar *ch,
						 int len);
extern void 
		xmlSAX2ProcessingInstruction	(void *ctx,
						 const xmlChar *target,
						 const xmlChar *data);
extern void 
		xmlSAX2Comment			(void *ctx,
						 const xmlChar *value);
extern void 
		xmlSAX2CDataBlock		(void *ctx,
						 const xmlChar *value,
						 int len);

#ifdef LIBXML_SAX1_ENABLED
extern int 
		xmlSAXDefaultVersion		(int version);
#endif /* LIBXML_SAX1_ENABLED */

extern int 
		xmlSAXVersion			(xmlSAXHandler *hdlr,
						 int version);
extern void 
		xmlSAX2InitDefaultSAXHandler    (xmlSAXHandler *hdlr,
						 int warning);
#ifdef LIBXML_HTML_ENABLED
extern void 
		xmlSAX2InitHtmlDefaultSAXHandler(xmlSAXHandler *hdlr);
extern void 
		htmlDefaultSAXHandlerInit	(void);
#endif
#ifdef LIBXML_DOCB_ENABLED
extern void 
		xmlSAX2InitDocbDefaultSAXHandler(xmlSAXHandler *hdlr);
extern void 
		docbDefaultSAXHandlerInit	(void);
#endif
extern void 
		xmlDefaultSAXHandlerInit	(void);
#ifdef __cplusplus
}
#endif
#endif /* __XML_SAX2_H__ */

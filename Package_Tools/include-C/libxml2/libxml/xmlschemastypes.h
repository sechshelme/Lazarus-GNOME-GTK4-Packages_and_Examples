/*
 * Summary: implementation of XML Schema Datatypes
 * Description: module providing the XML Schema Datatypes implementation
 *              both definition and validity checking
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */


#ifndef __XML_SCHEMA_TYPES_H__
#define __XML_SCHEMA_TYPES_H__

#include <libxml/xmlversion.h>

#ifdef LIBXML_SCHEMAS_ENABLED

#include <libxml/schemasInternals.h>
#include <libxml/xmlschemas.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    XML_SCHEMA_WHITESPACE_UNKNOWN = 0,
    XML_SCHEMA_WHITESPACE_PRESERVE = 1,
    XML_SCHEMA_WHITESPACE_REPLACE = 2,
    XML_SCHEMA_WHITESPACE_COLLAPSE = 3
} xmlSchemaWhitespaceValueType;

extern void 
		xmlSchemaInitTypes		(void);
extern void 
		xmlSchemaCleanupTypes		(void);
extern xmlSchemaTypePtr 
		xmlSchemaGetPredefinedType	(const xmlChar *name,
						 const xmlChar *ns);
extern int 
		xmlSchemaValidatePredefinedType	(xmlSchemaTypePtr type,
						 const xmlChar *value,
						 xmlSchemaValPtr *val);
extern int 
		xmlSchemaValPredefTypeNode	(xmlSchemaTypePtr type,
						 const xmlChar *value,
						 xmlSchemaValPtr *val,
						 xmlNodePtr node);
extern int 
		xmlSchemaValidateFacet		(xmlSchemaTypePtr base,
						 xmlSchemaFacetPtr facet,
						 const xmlChar *value,
						 xmlSchemaValPtr val);
extern int 
		xmlSchemaValidateFacetWhtsp	(xmlSchemaFacetPtr facet,
						 xmlSchemaWhitespaceValueType fws,
						 xmlSchemaValType valType,
						 const xmlChar *value,
						 xmlSchemaValPtr val,
						 xmlSchemaWhitespaceValueType ws);
extern void 
		xmlSchemaFreeValue		(xmlSchemaValPtr val);
extern xmlSchemaFacetPtr 
		xmlSchemaNewFacet		(void);
extern int 
		xmlSchemaCheckFacet		(xmlSchemaFacetPtr facet,
						 xmlSchemaTypePtr typeDecl,
						 xmlSchemaParserCtxtPtr ctxt,
						 const xmlChar *name);
extern void 
		xmlSchemaFreeFacet		(xmlSchemaFacetPtr facet);
extern int 
		xmlSchemaCompareValues		(xmlSchemaValPtr x,
						 xmlSchemaValPtr y);
extern xmlSchemaTypePtr 
    xmlSchemaGetBuiltInListSimpleTypeItemType	(xmlSchemaTypePtr type);
extern int 
    xmlSchemaValidateListSimpleTypeFacet	(xmlSchemaFacetPtr facet,
						 const xmlChar *value,
						 unsigned long actualLen,
						 unsigned long *expectedLen);
extern xmlSchemaTypePtr 
		xmlSchemaGetBuiltInType		(xmlSchemaValType type);
extern int 
		xmlSchemaIsBuiltInTypeFacet	(xmlSchemaTypePtr type,
						 int facetType);
extern xmlChar * 
		xmlSchemaCollapseString		(const xmlChar *value);
extern xmlChar * 
		xmlSchemaWhiteSpaceReplace	(const xmlChar *value);
extern unsigned long  
		xmlSchemaGetFacetValueAsULong	(xmlSchemaFacetPtr facet);
extern int 
		xmlSchemaValidateLengthFacet	(xmlSchemaTypePtr type,
						 xmlSchemaFacetPtr facet,
						 const xmlChar *value,
						 xmlSchemaValPtr val,
						 unsigned long *length);
extern int 
		xmlSchemaValidateLengthFacetWhtsp(xmlSchemaFacetPtr facet,
						  xmlSchemaValType valType,
						  const xmlChar *value,
						  xmlSchemaValPtr val,
						  unsigned long *length,
						  xmlSchemaWhitespaceValueType ws);
extern int 
		xmlSchemaValPredefTypeNodeNoNorm(xmlSchemaTypePtr type,
						 const xmlChar *value,
						 xmlSchemaValPtr *val,
						 xmlNodePtr node);
extern int 
		xmlSchemaGetCanonValue		(xmlSchemaValPtr val,
						 const xmlChar **retValue);
extern int 
		xmlSchemaGetCanonValueWhtsp	(xmlSchemaValPtr val,
						 const xmlChar **retValue,
						 xmlSchemaWhitespaceValueType ws);
extern int 
		xmlSchemaValueAppend		(xmlSchemaValPtr prev,
						 xmlSchemaValPtr cur);
extern xmlSchemaValPtr 
		xmlSchemaValueGetNext		(xmlSchemaValPtr cur);
extern const xmlChar * 
		xmlSchemaValueGetAsString	(xmlSchemaValPtr val);
extern int 
		xmlSchemaValueGetAsBoolean	(xmlSchemaValPtr val);
extern xmlSchemaValPtr 
		xmlSchemaNewStringValue		(xmlSchemaValType type,
						 const xmlChar *value);
extern xmlSchemaValPtr 
		xmlSchemaNewNOTATIONValue	(const xmlChar *name,
						 const xmlChar *ns);
extern xmlSchemaValPtr 
		xmlSchemaNewQNameValue		(const xmlChar *namespaceName,
						 const xmlChar *localName);
extern int 
		xmlSchemaCompareValuesWhtsp	(xmlSchemaValPtr x,
						 xmlSchemaWhitespaceValueType xws,
						 xmlSchemaValPtr y,
						 xmlSchemaWhitespaceValueType yws);
extern xmlSchemaValPtr 
		xmlSchemaCopyValue		(xmlSchemaValPtr val);
extern xmlSchemaValType 
		xmlSchemaGetValType		(xmlSchemaValPtr val);

#ifdef __cplusplus
}
#endif

#endif /* LIBXML_SCHEMAS_ENABLED */
#endif /* __XML_SCHEMA_TYPES_H__ */

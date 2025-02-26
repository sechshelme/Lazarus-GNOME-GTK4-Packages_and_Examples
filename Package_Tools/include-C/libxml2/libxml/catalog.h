/**
 * Summary: interfaces to the Catalog handling system
 * Description: the catalog module implements the support for
 * XML Catalogs and SGML catalogs
 *
 * SGML Open Technical Resolution TR9401:1997.
 * http://www.jclark.com/sp/catalog.htm
 *
 * XML Catalogs Working Draft 06 August 2001
 * http://www.oasis-open.org/committees/entity/spec-2001-08-06.html
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_CATALOG_H__
#define __XML_CATALOG_H__

#include <stdio.h>

#include <libxml/xmlversion.h>
#include <libxml/xmlstring.h>
#include <libxml/tree.h>

#ifdef LIBXML_CATALOG_ENABLED

#ifdef __cplusplus
extern "C" {
#endif

/**
 * XML_CATALOGS_NAMESPACE:
 *
 * The namespace for the XML Catalogs elements.
 */
#define XML_CATALOGS_NAMESPACE					\
    (const xmlChar *) "urn:oasis:names:tc:entity:xmlns:xml:catalog"
/**
 * XML_CATALOG_PI:
 *
 * The specific XML Catalog Processing Instruction name.
 */
#define XML_CATALOG_PI						\
    (const xmlChar *) "oasis-xml-catalog"

/*
 * The API is voluntarily limited to general cataloging.
 */
typedef enum {
    XML_CATA_PREFER_NONE = 0,
    XML_CATA_PREFER_PUBLIC = 1,
    XML_CATA_PREFER_SYSTEM
} xmlCatalogPrefer;

typedef enum {
    XML_CATA_ALLOW_NONE = 0,
    XML_CATA_ALLOW_GLOBAL = 1,
    XML_CATA_ALLOW_DOCUMENT = 2,
    XML_CATA_ALLOW_ALL = 3
} xmlCatalogAllow;

typedef struct _xmlCatalog xmlCatalog;
typedef xmlCatalog *xmlCatalogPtr;

/*
 * Operations on a given catalog.
 */
extern xmlCatalogPtr 
		xmlNewCatalog		(int sgml);
extern xmlCatalogPtr 
		xmlLoadACatalog		(const char *filename);
extern xmlCatalogPtr 
		xmlLoadSGMLSuperCatalog	(const char *filename);
extern int 
		xmlConvertSGMLCatalog	(xmlCatalogPtr catal);
extern int 
		xmlACatalogAdd		(xmlCatalogPtr catal,
					 const xmlChar *type,
					 const xmlChar *orig,
					 const xmlChar *replace);
extern int 
		xmlACatalogRemove	(xmlCatalogPtr catal,
					 const xmlChar *value);
extern xmlChar * 
		xmlACatalogResolve	(xmlCatalogPtr catal,
					 const xmlChar *pubID,
	                                 const xmlChar *sysID);
extern xmlChar * 
		xmlACatalogResolveSystem(xmlCatalogPtr catal,
					 const xmlChar *sysID);
extern xmlChar * 
		xmlACatalogResolvePublic(xmlCatalogPtr catal,
					 const xmlChar *pubID);
extern xmlChar * 
		xmlACatalogResolveURI	(xmlCatalogPtr catal,
					 const xmlChar *URI);
#ifdef LIBXML_OUTPUT_ENABLED
extern void 
		xmlACatalogDump		(xmlCatalogPtr catal,
					 FILE *out);
#endif /* LIBXML_OUTPUT_ENABLED */
extern void 
		xmlFreeCatalog		(xmlCatalogPtr catal);
extern int 
		xmlCatalogIsEmpty	(xmlCatalogPtr catal);

/*
 * Global operations.
 */
extern void 
		xmlInitializeCatalog	(void);
extern int 
		xmlLoadCatalog		(const char *filename);
extern void 
		xmlLoadCatalogs		(const char *paths);
extern void 
		xmlCatalogCleanup	(void);
#ifdef LIBXML_OUTPUT_ENABLED
extern void 
		xmlCatalogDump		(FILE *out);
#endif /* LIBXML_OUTPUT_ENABLED */
extern xmlChar * 
		xmlCatalogResolve	(const xmlChar *pubID,
	                                 const xmlChar *sysID);
extern xmlChar * 
		xmlCatalogResolveSystem	(const xmlChar *sysID);
extern xmlChar * 
		xmlCatalogResolvePublic	(const xmlChar *pubID);
extern xmlChar * 
		xmlCatalogResolveURI	(const xmlChar *URI);
extern int 
		xmlCatalogAdd		(const xmlChar *type,
					 const xmlChar *orig,
					 const xmlChar *replace);
extern int 
		xmlCatalogRemove	(const xmlChar *value);
extern xmlDocPtr 
		xmlParseCatalogFile	(const char *filename);
extern int 
		xmlCatalogConvert	(void);

/*
 * Strictly minimal interfaces for per-document catalogs used
 * by the parser.
 */
extern void 
		xmlCatalogFreeLocal	(void *catalogs);
extern void * 
		xmlCatalogAddLocal	(void *catalogs,
					 const xmlChar *URL);
extern xmlChar * 
		xmlCatalogLocalResolve	(void *catalogs,
					 const xmlChar *pubID,
	                                 const xmlChar *sysID);
extern xmlChar * 
		xmlCatalogLocalResolveURI(void *catalogs,
					 const xmlChar *URI);
/*
 * Preference settings.
 */
extern int 
		xmlCatalogSetDebug	(int level);
extern xmlCatalogPrefer 
		xmlCatalogSetDefaultPrefer(xmlCatalogPrefer prefer);
extern void 
		xmlCatalogSetDefaults	(xmlCatalogAllow allow);
extern xmlCatalogAllow 
		xmlCatalogGetDefaults	(void);


/* DEPRECATED interfaces */
extern const xmlChar * 
		xmlCatalogGetSystem	(const xmlChar *sysID);
extern const xmlChar * 
		xmlCatalogGetPublic	(const xmlChar *pubID);

#ifdef __cplusplus
}
#endif
#endif /* LIBXML_CATALOG_ENABLED */
#endif /* __XML_CATALOG_H__ */

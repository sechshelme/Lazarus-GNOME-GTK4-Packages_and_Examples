/**
 * Summary: library of generic URI related routines
 * Description: library of generic URI related routines
 *              Implements RFC 2396
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_URI_H__
#define __XML_URI_H__

#include <libxml/xmlversion.h>
#include <libxml/tree.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * xmlURI:
 *
 * A parsed URI reference. This is a struct containing the various fields
 * as described in RFC 2396 but separated for further processing.
 *
 * Note: query is a deprecated field which is incorrectly unescaped.
 * query_raw takes precedence over query if the former is set.
 * See: http://mail.gnome.org/archives/xml/2007-April/thread.html#00127
 */
typedef struct _xmlURI xmlURI;
typedef xmlURI *xmlURIPtr;
struct _xmlURI {
    char *scheme;	/* the URI scheme */
    char *opaque;	/* opaque part */
    char *authority;	/* the authority part */
    char *server;	/* the server part */
    char *user;		/* the user part */
    int port;		/* the port number */
    char *path;		/* the path string */
    char *query;	/* the query string (deprecated - use with caution) */
    char *fragment;	/* the fragment identifier */
    int  cleanup;	/* parsing potentially unclean URI */
    char *query_raw;	/* the query string (as it appears in the URI) */
};

/*
 * This function is in tree.h:
 * xmlChar *	xmlNodeGetBase	(xmlDocPtr doc,
 *                               xmlNodePtr cur);
 */
extern xmlURIPtr 
		xmlCreateURI		(void);
extern xmlChar * 
		xmlBuildURI		(const xmlChar *URI,
					 const xmlChar *base);
extern xmlChar * 
		xmlBuildRelativeURI	(const xmlChar *URI,
					 const xmlChar *base);
extern xmlURIPtr 
		xmlParseURI		(const char *str);
extern xmlURIPtr 
		xmlParseURIRaw		(const char *str,
					 int raw);
extern int 
		xmlParseURIReference	(xmlURIPtr uri,
					 const char *str);
extern xmlChar * 
		xmlSaveUri		(xmlURIPtr uri);
extern void 
		xmlPrintURI		(FILE *stream,
					 xmlURIPtr uri);
extern xmlChar * 
		xmlURIEscapeStr         (const xmlChar *str,
					 const xmlChar *list);
extern char * 
		xmlURIUnescapeString	(const char *str,
					 int len,
					 char *target);
extern int 
		xmlNormalizeURIPath	(char *path);
extern xmlChar * 
		xmlURIEscape		(const xmlChar *str);
extern void 
		xmlFreeURI		(xmlURIPtr uri);
extern xmlChar* 
		xmlCanonicPath		(const xmlChar *path);
extern xmlChar* 
		xmlPathToURI		(const xmlChar *path);

#ifdef __cplusplus
}
#endif
#endif /* __XML_URI_H__ */

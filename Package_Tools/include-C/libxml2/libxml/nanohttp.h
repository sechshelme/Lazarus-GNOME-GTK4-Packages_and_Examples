/*
 * Summary: minimal HTTP implementation
 * Description: minimal HTTP implementation allowing to fetch resources
 *              like external subset.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __NANO_HTTP_H__
#define __NANO_HTTP_H__

#include <libxml/xmlversion.h>

#ifdef LIBXML_HTTP_ENABLED

#ifdef __cplusplus
extern "C" {
#endif
extern void 
	xmlNanoHTTPInit		(void);
extern void 
	xmlNanoHTTPCleanup	(void);
extern void 
	xmlNanoHTTPScanProxy	(const char *URL);
extern int 
	xmlNanoHTTPFetch	(const char *URL,
				 const char *filename,
				 char **contentType);
extern void * 
	xmlNanoHTTPMethod	(const char *URL,
				 const char *method,
				 const char *input,
				 char **contentType,
				 const char *headers,
				 int   ilen);
extern void * 
	xmlNanoHTTPMethodRedir	(const char *URL,
				 const char *method,
				 const char *input,
				 char **contentType,
				 char **redir,
				 const char *headers,
				 int   ilen);
extern void * 
	xmlNanoHTTPOpen		(const char *URL,
				 char **contentType);
extern void * 
	xmlNanoHTTPOpenRedir	(const char *URL,
				 char **contentType,
				 char **redir);
extern int 
	xmlNanoHTTPReturnCode	(void *ctx);
extern const char * 
	xmlNanoHTTPAuthHeader	(void *ctx);
extern const char * 
	xmlNanoHTTPRedir	(void *ctx);
extern int 
	xmlNanoHTTPContentLength( void * ctx );
extern const char * 
	xmlNanoHTTPEncoding	(void *ctx);
extern const char * 
	xmlNanoHTTPMimeType	(void *ctx);
extern int 
	xmlNanoHTTPRead		(void *ctx,
				 void *dest,
				 int len);
#ifdef LIBXML_OUTPUT_ENABLED
extern int 
	xmlNanoHTTPSave		(void *ctxt,
				 const char *filename);
#endif /* LIBXML_OUTPUT_ENABLED */
extern void 
	xmlNanoHTTPClose	(void *ctx);
#ifdef __cplusplus
}
#endif

#endif /* LIBXML_HTTP_ENABLED */
#endif /* __NANO_HTTP_H__ */

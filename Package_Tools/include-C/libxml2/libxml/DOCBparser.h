/*
 * Summary: old DocBook SGML parser
 * Description: interface for a DocBook SGML non-verifying parser
 * This code is DEPRECATED, and should not be used anymore.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __DOCB_PARSER_H__
#define __DOCB_PARSER_H__
#include <libxml/xmlversion.h>

#ifdef LIBXML_DOCB_ENABLED

#include <libxml/parser.h>
#include <libxml/parserInternals.h>

#ifndef IN_LIBXML
#ifdef __GNUC__
#warning "The DOCBparser module has been deprecated in libxml2-2.6.0"
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Most of the back-end structures from XML and SGML are shared.
 */
typedef xmlParserCtxt docbParserCtxt;
typedef xmlParserCtxtPtr docbParserCtxtPtr;
typedef xmlSAXHandler docbSAXHandler;
typedef xmlSAXHandlerPtr docbSAXHandlerPtr;
typedef xmlParserInput docbParserInput;
typedef xmlParserInputPtr docbParserInputPtr;
typedef xmlDocPtr docbDocPtr;

/*
 * There is only few public functions.
 */
extern int 
		     docbEncodeEntities(unsigned char *out,
                                        int *outlen,
                                        const unsigned char *in,
                                        int *inlen, int quoteChar);

extern docbDocPtr 
		     docbSAXParseDoc   (xmlChar *cur,
                                        const char *encoding,
                                        docbSAXHandlerPtr sax,
                                        void *userData);
extern docbDocPtr 
		     docbParseDoc      (xmlChar *cur,
                                        const char *encoding);
extern docbDocPtr 
		     docbSAXParseFile  (const char *filename,
                                        const char *encoding,
                                        docbSAXHandlerPtr sax,
                                        void *userData);
extern docbDocPtr 
		     docbParseFile     (const char *filename,
                                        const char *encoding);

/**
 * Interfaces for the Push mode.
 */
extern void 
		     docbFreeParserCtxt      (docbParserCtxtPtr ctxt);
extern docbParserCtxtPtr 
		     docbCreatePushParserCtxt(docbSAXHandlerPtr sax,
                                              void *user_data,
                                              const char *chunk,
                                              int size,
                                              const char *filename,
                                              xmlCharEncoding enc);
extern int 
		     docbParseChunk          (docbParserCtxtPtr ctxt,
                                              const char *chunk,
                                              int size,
                                              int terminate);
extern docbParserCtxtPtr 
		     docbCreateFileParserCtxt(const char *filename,
                                              const char *encoding);
extern int 
		     docbParseDocument       (docbParserCtxtPtr ctxt);

#ifdef __cplusplus
}
#endif

#endif /* LIBXML_DOCB_ENABLED */

#endif /* __DOCB_PARSER_H__ */

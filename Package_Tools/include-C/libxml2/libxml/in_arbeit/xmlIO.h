/*
 * Summary: interface for the I/O interfaces used by the parser
 * Description: interface for the I/O interfaces used by the parser
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_IO_H__
#define __XML_IO_H__

#include <stdio.h>
#include <libxml/xmlversion.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Those are the functions and datatypes for the parser input
 * I/O structures.
 */

/**
 * xmlInputMatchCallback:
 * @filename: the filename or URI
 *
 * Callback used in the I/O Input API to detect if the current handler
 * can provide input functionality for this resource.
 *
 * Returns 1 if yes and 0 if another Input module should be used
 */
typedef int ( *xmlInputMatchCallback) (char const *filename);
/**
 * xmlInputOpenCallback:
 * @filename: the filename or URI
 *
 * Callback used in the I/O Input API to open the resource
 *
 * Returns an Input context or NULL in case or error
 */
typedef void * ( *xmlInputOpenCallback) (char const *filename);
/**
 * xmlInputReadCallback:
 * @context:  an Input context
 * @buffer:  the buffer to store data read
 * @len:  the length of the buffer in bytes
 *
 * Callback used in the I/O Input API to read the resource
 *
 * Returns the number of bytes read or -1 in case of error
 */
typedef int ( *xmlInputReadCallback) (void * context, char * buffer, int len);
/**
 * xmlInputCloseCallback:
 * @context:  an Input context
 *
 * Callback used in the I/O Input API to close the resource
 *
 * Returns 0 or -1 in case of error
 */
typedef int ( *xmlInputCloseCallback) (void * context);

#ifdef LIBXML_OUTPUT_ENABLED
/*
 * Those are the functions and datatypes for the library output
 * I/O structures.
 */

/**
 * xmlOutputMatchCallback:
 * @filename: the filename or URI
 *
 * Callback used in the I/O Output API to detect if the current handler
 * can provide output functionality for this resource.
 *
 * Returns 1 if yes and 0 if another Output module should be used
 */
typedef int ( *xmlOutputMatchCallback) (char const *filename);
/**
 * xmlOutputOpenCallback:
 * @filename: the filename or URI
 *
 * Callback used in the I/O Output API to open the resource
 *
 * Returns an Output context or NULL in case or error
 */
typedef void * ( *xmlOutputOpenCallback) (char const *filename);
/**
 * xmlOutputWriteCallback:
 * @context:  an Output context
 * @buffer:  the buffer of data to write
 * @len:  the length of the buffer in bytes
 *
 * Callback used in the I/O Output API to write to the resource
 *
 * Returns the number of bytes written or -1 in case of error
 */
typedef int ( *xmlOutputWriteCallback) (void * context, const char * buffer,
                                       int len);
/**
 * xmlOutputCloseCallback:
 * @context:  an Output context
 *
 * Callback used in the I/O Output API to close the resource
 *
 * Returns 0 or -1 in case of error
 */
typedef int ( *xmlOutputCloseCallback) (void * context);
#endif /* LIBXML_OUTPUT_ENABLED */

#ifdef __cplusplus
}
#endif

#include <libxml/globals.h>
#include <libxml/tree.h>
#include <libxml/parser.h>
#include <libxml/encoding.h>

#ifdef __cplusplus
extern "C" {
#endif
struct _xmlParserInputBuffer {
    void*                  context;
    xmlInputReadCallback   readcallback;
    xmlInputCloseCallback  closecallback;

    xmlCharEncodingHandlerPtr encoder; /* I18N conversions to UTF-8 */

    xmlBufPtr buffer;    /* Local buffer encoded in UTF-8 */
    xmlBufPtr raw;       /* if encoder != NULL buffer for raw input */
    int	compressed;	    /* -1=unknown, 0=not compressed, 1=compressed */
    int error;
    unsigned long rawconsumed;/* amount consumed from raw */
};


#ifdef LIBXML_OUTPUT_ENABLED
struct _xmlOutputBuffer {
    void*                   context;
    xmlOutputWriteCallback  writecallback;
    xmlOutputCloseCallback  closecallback;

    xmlCharEncodingHandlerPtr encoder; /* I18N conversions to UTF-8 */

    xmlBufPtr buffer;    /* Local buffer encoded in UTF-8 or ISOLatin */
    xmlBufPtr conv;      /* if encoder != NULL buffer for output */
    int written;            /* total number of byte written */
    int error;
};
#endif /* LIBXML_OUTPUT_ENABLED */

/*
 * Interfaces for input
 */
extern void 
	xmlCleanupInputCallbacks		(void);

extern int 
	xmlPopInputCallbacks			(void);

extern void 
	xmlRegisterDefaultInputCallbacks	(void);
extern xmlParserInputBufferPtr 
	xmlAllocParserInputBuffer		(xmlCharEncoding enc);

extern xmlParserInputBufferPtr 
	xmlParserInputBufferCreateFilename	(const char *URI,
                                                 xmlCharEncoding enc);
extern xmlParserInputBufferPtr 
	xmlParserInputBufferCreateFile		(FILE *file,
                                                 xmlCharEncoding enc);
extern xmlParserInputBufferPtr 
	xmlParserInputBufferCreateFd		(int fd,
	                                         xmlCharEncoding enc);
extern xmlParserInputBufferPtr 
	xmlParserInputBufferCreateMem		(const char *mem, int size,
	                                         xmlCharEncoding enc);
extern xmlParserInputBufferPtr 
	xmlParserInputBufferCreateStatic	(const char *mem, int size,
	                                         xmlCharEncoding enc);
extern xmlParserInputBufferPtr 
	xmlParserInputBufferCreateIO		(xmlInputReadCallback   ioread,
						 xmlInputCloseCallback  ioclose,
						 void *ioctx,
	                                         xmlCharEncoding enc);
extern int 
	xmlParserInputBufferRead		(xmlParserInputBufferPtr in,
						 int len);
extern int 
	xmlParserInputBufferGrow		(xmlParserInputBufferPtr in,
						 int len);
extern int 
	xmlParserInputBufferPush		(xmlParserInputBufferPtr in,
						 int len,
						 const char *buf);
extern void 
	xmlFreeParserInputBuffer		(xmlParserInputBufferPtr in);
extern char * 
	xmlParserGetDirectory			(const char *filename);

extern int 
	xmlRegisterInputCallbacks		(xmlInputMatchCallback matchFunc,
						 xmlInputOpenCallback openFunc,
						 xmlInputReadCallback readFunc,
						 xmlInputCloseCallback closeFunc);

xmlParserInputBufferPtr
	__xmlParserInputBufferCreateFilename(const char *URI,
						xmlCharEncoding enc);

#ifdef LIBXML_OUTPUT_ENABLED
/*
 * Interfaces for output
 */
extern void 
	xmlCleanupOutputCallbacks		(void);
extern int 
	xmlPopOutputCallbacks			(void);
extern void 
	xmlRegisterDefaultOutputCallbacks(void);
extern xmlOutputBufferPtr 
	xmlAllocOutputBuffer		(xmlCharEncodingHandlerPtr encoder);

extern xmlOutputBufferPtr 
	xmlOutputBufferCreateFilename	(const char *URI,
					 xmlCharEncodingHandlerPtr encoder,
					 int compression);

extern xmlOutputBufferPtr 
	xmlOutputBufferCreateFile	(FILE *file,
					 xmlCharEncodingHandlerPtr encoder);

extern xmlOutputBufferPtr 
	xmlOutputBufferCreateBuffer	(xmlBufferPtr buffer,
					 xmlCharEncodingHandlerPtr encoder);

extern xmlOutputBufferPtr 
	xmlOutputBufferCreateFd		(int fd,
					 xmlCharEncodingHandlerPtr encoder);

extern xmlOutputBufferPtr 
	xmlOutputBufferCreateIO		(xmlOutputWriteCallback   iowrite,
					 xmlOutputCloseCallback  ioclose,
					 void *ioctx,
					 xmlCharEncodingHandlerPtr encoder);

/* Couple of APIs to get the output without digging into the buffers */
extern const xmlChar * 
        xmlOutputBufferGetContent       (xmlOutputBufferPtr out);
extern size_t 
        xmlOutputBufferGetSize          (xmlOutputBufferPtr out);

extern int 
	xmlOutputBufferWrite		(xmlOutputBufferPtr out,
					 int len,
					 const char *buf);
extern int 
	xmlOutputBufferWriteString	(xmlOutputBufferPtr out,
					 const char *str);
extern int 
	xmlOutputBufferWriteEscape	(xmlOutputBufferPtr out,
					 const xmlChar *str,
					 xmlCharEncodingOutputFunc escaping);

extern int 
	xmlOutputBufferFlush		(xmlOutputBufferPtr out);
extern int 
	xmlOutputBufferClose		(xmlOutputBufferPtr out);

extern int 
	xmlRegisterOutputCallbacks	(xmlOutputMatchCallback matchFunc,
					 xmlOutputOpenCallback openFunc,
					 xmlOutputWriteCallback writeFunc,
					 xmlOutputCloseCallback closeFunc);

xmlOutputBufferPtr
	__xmlOutputBufferCreateFilename(const char *URI,
                              xmlCharEncodingHandlerPtr encoder,
                              int compression);

#ifdef LIBXML_HTTP_ENABLED
/*  This function only exists if HTTP support built into the library  */
extern void 
	xmlRegisterHTTPPostCallbacks	(void );
#endif /* LIBXML_HTTP_ENABLED */

#endif /* LIBXML_OUTPUT_ENABLED */

extern xmlParserInputPtr 
	xmlCheckHTTPInput		(xmlParserCtxtPtr ctxt,
					 xmlParserInputPtr ret);

/*
 * A predefined entity loader disabling network accesses
 */
extern xmlParserInputPtr 
	xmlNoNetExternalEntityLoader	(const char *URL,
					 const char *ID,
					 xmlParserCtxtPtr ctxt);

/*
 * xmlNormalizeWindowsPath is obsolete, don't use it.
 * Check xmlCanonicPath in uri.h for a better alternative.
 */
extern xmlChar * 
	xmlNormalizeWindowsPath		(const xmlChar *path);

extern int 
	xmlCheckFilename		(const char *path);
/**
 * Default 'file://' protocol callbacks
 */
extern int 
	xmlFileMatch			(const char *filename);
extern void * 
	xmlFileOpen			(const char *filename);
extern int 
	xmlFileRead			(void * context,
					 char * buffer,
					 int len);
extern int 
	xmlFileClose			(void * context);

/**
 * Default 'http://' protocol callbacks
 */
#ifdef LIBXML_HTTP_ENABLED
extern int 
	xmlIOHTTPMatch			(const char *filename);
extern void * 
	xmlIOHTTPOpen			(const char *filename);
#ifdef LIBXML_OUTPUT_ENABLED
extern void * 
	xmlIOHTTPOpenW			(const char * post_uri,
					 int   compression );
#endif /* LIBXML_OUTPUT_ENABLED */
extern int 
	xmlIOHTTPRead			(void * context,
					 char * buffer,
					 int len);
extern int 
	xmlIOHTTPClose			(void * context);
#endif /* LIBXML_HTTP_ENABLED */

/**
 * Default 'ftp://' protocol callbacks
 */
#ifdef LIBXML_FTP_ENABLED
extern int 
	xmlIOFTPMatch			(const char *filename);
extern void * 
	xmlIOFTPOpen			(const char *filename);
extern int 
	xmlIOFTPRead			(void * context,
					 char * buffer,
					 int len);
extern int 
	xmlIOFTPClose			(void * context);
#endif /* LIBXML_FTP_ENABLED */

#ifdef __cplusplus
}
#endif

#endif /* __XML_IO_H__ */

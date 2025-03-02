/*
 * Summary: the XMLReader implementation
 * Description: API of the XML streaming API based on C# interfaces.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_XMLREADER_H__
#define __XML_XMLREADER_H__

#include <libxml/xmlversion.h>
#include <libxml/tree.h>
#include <libxml/xmlIO.h>
#ifdef LIBXML_SCHEMAS_ENABLED
#include <libxml/relaxng.h>
#include <libxml/xmlschemas.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/**
 * xmlParserSeverities:
 *
 * How severe an error callback is when the per-reader error callback API
 * is used.
 */
typedef enum {
    XML_PARSER_SEVERITY_VALIDITY_WARNING = 1,
    XML_PARSER_SEVERITY_VALIDITY_ERROR = 2,
    XML_PARSER_SEVERITY_WARNING = 3,
    XML_PARSER_SEVERITY_ERROR = 4
} xmlParserSeverities;

#ifdef LIBXML_READER_ENABLED

/**
 * xmlTextReaderMode:
 *
 * Internal state values for the reader.
 */
typedef enum {
    XML_TEXTREADER_MODE_INITIAL = 0,
    XML_TEXTREADER_MODE_INTERACTIVE = 1,
    XML_TEXTREADER_MODE_ERROR = 2,
    XML_TEXTREADER_MODE_EOF =3,
    XML_TEXTREADER_MODE_CLOSED = 4,
    XML_TEXTREADER_MODE_READING = 5
} xmlTextReaderMode;

/**
 * xmlParserProperties:
 *
 * Some common options to use with xmlTextReaderSetParserProp, but it
 * is better to use xmlParserOption and the xmlReaderNewxxx and
 * xmlReaderForxxx APIs now.
 */
typedef enum {
    XML_PARSER_LOADDTD = 1,
    XML_PARSER_DEFAULTATTRS = 2,
    XML_PARSER_VALIDATE = 3,
    XML_PARSER_SUBST_ENTITIES = 4
} xmlParserProperties;

/**
 * xmlReaderTypes:
 *
 * Predefined constants for the different types of nodes.
 */
typedef enum {
    XML_READER_TYPE_NONE = 0,
    XML_READER_TYPE_ELEMENT = 1,
    XML_READER_TYPE_ATTRIBUTE = 2,
    XML_READER_TYPE_TEXT = 3,
    XML_READER_TYPE_CDATA = 4,
    XML_READER_TYPE_ENTITY_REFERENCE = 5,
    XML_READER_TYPE_ENTITY = 6,
    XML_READER_TYPE_PROCESSING_INSTRUCTION = 7,
    XML_READER_TYPE_COMMENT = 8,
    XML_READER_TYPE_DOCUMENT = 9,
    XML_READER_TYPE_DOCUMENT_TYPE = 10,
    XML_READER_TYPE_DOCUMENT_FRAGMENT = 11,
    XML_READER_TYPE_NOTATION = 12,
    XML_READER_TYPE_WHITESPACE = 13,
    XML_READER_TYPE_SIGNIFICANT_WHITESPACE = 14,
    XML_READER_TYPE_END_ELEMENT = 15,
    XML_READER_TYPE_END_ENTITY = 16,
    XML_READER_TYPE_XML_DECLARATION = 17
} xmlReaderTypes;

/**
 * xmlTextReader:
 *
 * Structure for an xmlReader context.
 */
typedef struct _xmlTextReader xmlTextReader;

/**
 * xmlTextReaderPtr:
 *
 * Pointer to an xmlReader context.
 */
typedef xmlTextReader *xmlTextReaderPtr;

/*
 * Constructors & Destructor
 */
extern xmlTextReaderPtr 
			xmlNewTextReader	(xmlParserInputBufferPtr input,
	                                         const char *URI);
extern xmlTextReaderPtr 
			xmlNewTextReaderFilename(const char *URI);

extern void 
			xmlFreeTextReader	(xmlTextReaderPtr reader);

extern int 
            xmlTextReaderSetup(xmlTextReaderPtr reader,
                   xmlParserInputBufferPtr input, const char *URL,
                   const char *encoding, int options);

/*
 * Iterators
 */
extern int 
			xmlTextReaderRead	(xmlTextReaderPtr reader);

#ifdef LIBXML_WRITER_ENABLED
extern xmlChar * 
			xmlTextReaderReadInnerXml(xmlTextReaderPtr reader);

extern xmlChar * 
			xmlTextReaderReadOuterXml(xmlTextReaderPtr reader);
#endif

extern xmlChar * 
			xmlTextReaderReadString	(xmlTextReaderPtr reader);
extern int 
			xmlTextReaderReadAttributeValue(xmlTextReaderPtr reader);

/*
 * Attributes of the node
 */
extern int 
			xmlTextReaderAttributeCount(xmlTextReaderPtr reader);
extern int 
			xmlTextReaderDepth	(xmlTextReaderPtr reader);
extern int 
			xmlTextReaderHasAttributes(xmlTextReaderPtr reader);
extern int 
			xmlTextReaderHasValue(xmlTextReaderPtr reader);
extern int 
			xmlTextReaderIsDefault	(xmlTextReaderPtr reader);
extern int 
			xmlTextReaderIsEmptyElement(xmlTextReaderPtr reader);
extern int 
			xmlTextReaderNodeType	(xmlTextReaderPtr reader);
extern int 
			xmlTextReaderQuoteChar	(xmlTextReaderPtr reader);
extern int 
			xmlTextReaderReadState	(xmlTextReaderPtr reader);
extern int 
                        xmlTextReaderIsNamespaceDecl(xmlTextReaderPtr reader);

extern const xmlChar * 
		    xmlTextReaderConstBaseUri	(xmlTextReaderPtr reader);
extern const xmlChar * 
		    xmlTextReaderConstLocalName	(xmlTextReaderPtr reader);
extern const xmlChar * 
		    xmlTextReaderConstName	(xmlTextReaderPtr reader);
extern const xmlChar * 
		    xmlTextReaderConstNamespaceUri(xmlTextReaderPtr reader);
extern const xmlChar * 
		    xmlTextReaderConstPrefix	(xmlTextReaderPtr reader);
extern const xmlChar * 
		    xmlTextReaderConstXmlLang	(xmlTextReaderPtr reader);
extern const xmlChar * 
		    xmlTextReaderConstString	(xmlTextReaderPtr reader,
						 const xmlChar *str);
extern const xmlChar * 
		    xmlTextReaderConstValue	(xmlTextReaderPtr reader);

/*
 * use the Const version of the routine for
 * better performance and simpler code
 */
extern xmlChar * 
			xmlTextReaderBaseUri	(xmlTextReaderPtr reader);
extern xmlChar * 
			xmlTextReaderLocalName	(xmlTextReaderPtr reader);
extern xmlChar * 
			xmlTextReaderName	(xmlTextReaderPtr reader);
extern xmlChar * 
			xmlTextReaderNamespaceUri(xmlTextReaderPtr reader);
extern xmlChar * 
			xmlTextReaderPrefix	(xmlTextReaderPtr reader);
extern xmlChar * 
			xmlTextReaderXmlLang	(xmlTextReaderPtr reader);
extern xmlChar * 
			xmlTextReaderValue	(xmlTextReaderPtr reader);

/*
 * Methods of the XmlTextReader
 */
extern int 
		    xmlTextReaderClose		(xmlTextReaderPtr reader);
extern xmlChar * 
		    xmlTextReaderGetAttributeNo	(xmlTextReaderPtr reader,
						 int no);
extern xmlChar * 
		    xmlTextReaderGetAttribute	(xmlTextReaderPtr reader,
						 const xmlChar *name);
extern xmlChar * 
		    xmlTextReaderGetAttributeNs	(xmlTextReaderPtr reader,
						 const xmlChar *localName,
						 const xmlChar *namespaceURI);
extern xmlParserInputBufferPtr 
		    xmlTextReaderGetRemainder	(xmlTextReaderPtr reader);
extern xmlChar * 
		    xmlTextReaderLookupNamespace(xmlTextReaderPtr reader,
						 const xmlChar *prefix);
extern int 
		    xmlTextReaderMoveToAttributeNo(xmlTextReaderPtr reader,
						 int no);
extern int 
		    xmlTextReaderMoveToAttribute(xmlTextReaderPtr reader,
						 const xmlChar *name);
extern int 
		    xmlTextReaderMoveToAttributeNs(xmlTextReaderPtr reader,
						 const xmlChar *localName,
						 const xmlChar *namespaceURI);
extern int 
		    xmlTextReaderMoveToFirstAttribute(xmlTextReaderPtr reader);
extern int 
		    xmlTextReaderMoveToNextAttribute(xmlTextReaderPtr reader);
extern int 
		    xmlTextReaderMoveToElement	(xmlTextReaderPtr reader);
extern int 
		    xmlTextReaderNormalization	(xmlTextReaderPtr reader);
extern const xmlChar * 
		    xmlTextReaderConstEncoding  (xmlTextReaderPtr reader);

/*
 * Extensions
 */
extern int 
		    xmlTextReaderSetParserProp	(xmlTextReaderPtr reader,
						 int prop,
						 int value);
extern int 
		    xmlTextReaderGetParserProp	(xmlTextReaderPtr reader,
						 int prop);
extern xmlNodePtr 
		    xmlTextReaderCurrentNode	(xmlTextReaderPtr reader);

extern int 
            xmlTextReaderGetParserLineNumber(xmlTextReaderPtr reader);

extern int 
            xmlTextReaderGetParserColumnNumber(xmlTextReaderPtr reader);

extern xmlNodePtr 
		    xmlTextReaderPreserve	(xmlTextReaderPtr reader);
#ifdef LIBXML_PATTERN_ENABLED
extern int 
		    xmlTextReaderPreservePattern(xmlTextReaderPtr reader,
						 const xmlChar *pattern,
						 const xmlChar **namespaces);
#endif /* LIBXML_PATTERN_ENABLED */
extern xmlDocPtr 
		    xmlTextReaderCurrentDoc	(xmlTextReaderPtr reader);
extern xmlNodePtr 
		    xmlTextReaderExpand		(xmlTextReaderPtr reader);
extern int 
		    xmlTextReaderNext		(xmlTextReaderPtr reader);
extern int 
		    xmlTextReaderNextSibling	(xmlTextReaderPtr reader);
extern int 
		    xmlTextReaderIsValid	(xmlTextReaderPtr reader);
#ifdef LIBXML_SCHEMAS_ENABLED
extern int 
		    xmlTextReaderRelaxNGValidate(xmlTextReaderPtr reader,
						 const char *rng);
extern int 
		    xmlTextReaderRelaxNGValidateCtxt(xmlTextReaderPtr reader,
						 xmlRelaxNGValidCtxtPtr ctxt,
						 int options);

extern int 
		    xmlTextReaderRelaxNGSetSchema(xmlTextReaderPtr reader,
						 xmlRelaxNGPtr schema);
extern int 
		    xmlTextReaderSchemaValidate	(xmlTextReaderPtr reader,
						 const char *xsd);
extern int 
		    xmlTextReaderSchemaValidateCtxt(xmlTextReaderPtr reader,
						 xmlSchemaValidCtxtPtr ctxt,
						 int options);
extern int 
		    xmlTextReaderSetSchema	(xmlTextReaderPtr reader,
						 xmlSchemaPtr schema);
#endif
extern const xmlChar * 
		    xmlTextReaderConstXmlVersion(xmlTextReaderPtr reader);
extern int 
		    xmlTextReaderStandalone     (xmlTextReaderPtr reader);


/*
 * Index lookup
 */
extern long 
		xmlTextReaderByteConsumed	(xmlTextReaderPtr reader);

/*
 * New more complete APIs for simpler creation and reuse of readers
 */
extern xmlTextReaderPtr 
		xmlReaderWalker		(xmlDocPtr doc);
extern xmlTextReaderPtr 
		xmlReaderForDoc		(const xmlChar * cur,
					 const char *URL,
					 const char *encoding,
					 int options);
extern xmlTextReaderPtr 
		xmlReaderForFile	(const char *filename,
					 const char *encoding,
					 int options);
extern xmlTextReaderPtr 
		xmlReaderForMemory	(const char *buffer,
					 int size,
					 const char *URL,
					 const char *encoding,
					 int options);
extern xmlTextReaderPtr 
		xmlReaderForFd		(int fd,
					 const char *URL,
					 const char *encoding,
					 int options);
extern xmlTextReaderPtr 
		xmlReaderForIO		(xmlInputReadCallback ioread,
					 xmlInputCloseCallback ioclose,
					 void *ioctx,
					 const char *URL,
					 const char *encoding,
					 int options);

extern int 
		xmlReaderNewWalker	(xmlTextReaderPtr reader,
					 xmlDocPtr doc);
extern int 
		xmlReaderNewDoc		(xmlTextReaderPtr reader,
					 const xmlChar * cur,
					 const char *URL,
					 const char *encoding,
					 int options);
extern int 
		xmlReaderNewFile	(xmlTextReaderPtr reader,
					 const char *filename,
					 const char *encoding,
					 int options);
extern int 
		xmlReaderNewMemory	(xmlTextReaderPtr reader,
					 const char *buffer,
					 int size,
					 const char *URL,
					 const char *encoding,
					 int options);
extern int 
		xmlReaderNewFd		(xmlTextReaderPtr reader,
					 int fd,
					 const char *URL,
					 const char *encoding,
					 int options);
extern int 
		xmlReaderNewIO		(xmlTextReaderPtr reader,
					 xmlInputReadCallback ioread,
					 xmlInputCloseCallback ioclose,
					 void *ioctx,
					 const char *URL,
					 const char *encoding,
					 int options);
/*
 * Error handling extensions
 */
typedef void *  xmlTextReaderLocatorPtr;

/**
 * xmlTextReaderErrorFunc:
 * @arg: the user argument
 * @msg: the message
 * @severity: the severity of the error
 * @locator: a locator indicating where the error occurred
 *
 * Signature of an error callback from a reader parser
 */
typedef void ( *xmlTextReaderErrorFunc)(void *arg,
					       const char *msg,
					       xmlParserSeverities severity,
					       xmlTextReaderLocatorPtr locator);
extern int 
	    xmlTextReaderLocatorLineNumber(xmlTextReaderLocatorPtr locator);
extern xmlChar * 
	    xmlTextReaderLocatorBaseURI (xmlTextReaderLocatorPtr locator);
extern void 
	    xmlTextReaderSetErrorHandler(xmlTextReaderPtr reader,
					 xmlTextReaderErrorFunc f,
					 void *arg);
extern void 
	    xmlTextReaderSetStructuredErrorHandler(xmlTextReaderPtr reader,
						   xmlStructuredErrorFunc f,
						   void *arg);
extern void 
	    xmlTextReaderGetErrorHandler(xmlTextReaderPtr reader,
					 xmlTextReaderErrorFunc *f,
					 void **arg);

#endif /* LIBXML_READER_ENABLED */

#ifdef __cplusplus
}
#endif

#endif /* __XML_XMLREADER_H__ */


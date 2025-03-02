/*
 * Summary: text writing API for XML
 * Description: text writing API for XML
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Alfred Mickautsch <alfred@mickautsch.de>
 */

#ifndef __XML_XMLWRITER_H__
#define __XML_XMLWRITER_H__

#include <libxml/xmlversion.h>

#ifdef LIBXML_WRITER_ENABLED

#include <stdarg.h>
#include <libxml/xmlIO.h>
#include <libxml/list.h>
#include <libxml/xmlstring.h>

#ifdef __cplusplus
extern "C" {
#endif

    typedef struct _xmlTextWriter xmlTextWriter;
    typedef xmlTextWriter *xmlTextWriterPtr;

/*
 * Constructors & Destructor
 */
    extern xmlTextWriterPtr 
        xmlNewTextWriter(xmlOutputBufferPtr out);
    extern xmlTextWriterPtr 
        xmlNewTextWriterFilename(const char *uri, int compression);
    extern xmlTextWriterPtr 
        xmlNewTextWriterMemory(xmlBufferPtr buf, int compression);
    extern xmlTextWriterPtr 
        xmlNewTextWriterPushParser(xmlParserCtxtPtr ctxt, int compression);
    extern xmlTextWriterPtr 
        xmlNewTextWriterDoc(xmlDocPtr * doc, int compression);
    extern xmlTextWriterPtr 
        xmlNewTextWriterTree(xmlDocPtr doc, xmlNodePtr node,
                             int compression);
    extern void  xmlFreeTextWriter(xmlTextWriterPtr writer);

/*
 * Functions
 */


/*
 * Document
 */
    extern int 
        xmlTextWriterStartDocument(xmlTextWriterPtr writer,
                                   const char *version,
                                   const char *encoding,
                                   const char *standalone);
    extern int  xmlTextWriterEndDocument(xmlTextWriterPtr
                                                   writer);

/*
 * Comments
 */
    extern int  xmlTextWriterStartComment(xmlTextWriterPtr
                                                    writer);
    extern int  xmlTextWriterEndComment(xmlTextWriterPtr writer);
    extern int 
        xmlTextWriterWriteFormatComment(xmlTextWriterPtr writer,
                                        const char *format, ...)
					;
    extern int 
        xmlTextWriterWriteVFormatComment(xmlTextWriterPtr writer,
                                         const char *format,
                                         va_list argptr)
					 ;
    extern int  xmlTextWriterWriteComment(xmlTextWriterPtr
                                                    writer,
                                                    const xmlChar *
                                                    content);

/*
 * Elements
 */
    extern int 
        xmlTextWriterStartElement(xmlTextWriterPtr writer,
                                  const xmlChar * name);
    extern int  xmlTextWriterStartElementNS(xmlTextWriterPtr
                                                      writer,
                                                      const xmlChar *
                                                      prefix,
                                                      const xmlChar * name,
                                                      const xmlChar *
                                                      namespaceURI);
    extern int  xmlTextWriterEndElement(xmlTextWriterPtr writer);
    extern int  xmlTextWriterFullEndElement(xmlTextWriterPtr
                                                      writer);

/*
 * Elements conveniency functions
 */
    extern int 
        xmlTextWriterWriteFormatElement(xmlTextWriterPtr writer,
                                        const xmlChar * name,
                                        const char *format, ...)
					;
    extern int 
        xmlTextWriterWriteVFormatElement(xmlTextWriterPtr writer,
                                         const xmlChar * name,
                                         const char *format,
                                         va_list argptr)
					 ;
    extern int  xmlTextWriterWriteElement(xmlTextWriterPtr
                                                    writer,
                                                    const xmlChar * name,
                                                    const xmlChar *
                                                    content);
    extern int 
        xmlTextWriterWriteFormatElementNS(xmlTextWriterPtr writer,
                                          const xmlChar * prefix,
                                          const xmlChar * name,
                                          const xmlChar * namespaceURI,
                                          const char *format, ...)
					  ;
    extern int 
        xmlTextWriterWriteVFormatElementNS(xmlTextWriterPtr writer,
                                           const xmlChar * prefix,
                                           const xmlChar * name,
                                           const xmlChar * namespaceURI,
                                           const char *format,
                                           va_list argptr)
					   ;
    extern int  xmlTextWriterWriteElementNS(xmlTextWriterPtr
                                                      writer,
                                                      const xmlChar *
                                                      prefix,
                                                      const xmlChar * name,
                                                      const xmlChar *
                                                      namespaceURI,
                                                      const xmlChar *
                                                      content);

/*
 * Text
 */
    extern int 
        xmlTextWriterWriteFormatRaw(xmlTextWriterPtr writer,
                                    const char *format, ...)
				    ;
    extern int 
        xmlTextWriterWriteVFormatRaw(xmlTextWriterPtr writer,
                                     const char *format, va_list argptr)
				     ;
    extern int 
        xmlTextWriterWriteRawLen(xmlTextWriterPtr writer,
                                 const xmlChar * content, int len);
    extern int 
        xmlTextWriterWriteRaw(xmlTextWriterPtr writer,
                              const xmlChar * content);
    extern int  xmlTextWriterWriteFormatString(xmlTextWriterPtr
                                                         writer,
                                                         const char
                                                         *format, ...)
							 ;
    extern int  xmlTextWriterWriteVFormatString(xmlTextWriterPtr
                                                          writer,
                                                          const char
                                                          *format,
                                                          va_list argptr)
							  ;
    extern int  xmlTextWriterWriteString(xmlTextWriterPtr writer,
                                                   const xmlChar *
                                                   content);
    extern int  xmlTextWriterWriteBase64(xmlTextWriterPtr writer,
                                                   const char *data,
                                                   int start, int len);
    extern int  xmlTextWriterWriteBinHex(xmlTextWriterPtr writer,
                                                   const char *data,
                                                   int start, int len);

/*
 * Attributes
 */
    extern int 
        xmlTextWriterStartAttribute(xmlTextWriterPtr writer,
                                    const xmlChar * name);
    extern int  xmlTextWriterStartAttributeNS(xmlTextWriterPtr
                                                        writer,
                                                        const xmlChar *
                                                        prefix,
                                                        const xmlChar *
                                                        name,
                                                        const xmlChar *
                                                        namespaceURI);
    extern int  xmlTextWriterEndAttribute(xmlTextWriterPtr
                                                    writer);

/*
 * Attributes conveniency functions
 */
    extern int 
        xmlTextWriterWriteFormatAttribute(xmlTextWriterPtr writer,
                                          const xmlChar * name,
                                          const char *format, ...)
					  ;
    extern int 
        xmlTextWriterWriteVFormatAttribute(xmlTextWriterPtr writer,
                                           const xmlChar * name,
                                           const char *format,
                                           va_list argptr)
					   ;
    extern int  xmlTextWriterWriteAttribute(xmlTextWriterPtr
                                                      writer,
                                                      const xmlChar * name,
                                                      const xmlChar *
                                                      content);
    extern int 
        xmlTextWriterWriteFormatAttributeNS(xmlTextWriterPtr writer,
                                            const xmlChar * prefix,
                                            const xmlChar * name,
                                            const xmlChar * namespaceURI,
                                            const char *format, ...)
					    ;
    extern int 
        xmlTextWriterWriteVFormatAttributeNS(xmlTextWriterPtr writer,
                                             const xmlChar * prefix,
                                             const xmlChar * name,
                                             const xmlChar * namespaceURI,
                                             const char *format,
                                             va_list argptr)
					    ;
    extern int  xmlTextWriterWriteAttributeNS(xmlTextWriterPtr
                                                        writer,
                                                        const xmlChar *
                                                        prefix,
                                                        const xmlChar *
                                                        name,
                                                        const xmlChar *
                                                        namespaceURI,
                                                        const xmlChar *
                                                        content);

/*
 * PI's
 */
    extern int 
        xmlTextWriterStartPI(xmlTextWriterPtr writer,
                             const xmlChar * target);
    extern int  xmlTextWriterEndPI(xmlTextWriterPtr writer);

/*
 * PI conveniency functions
 */
    extern int 
        xmlTextWriterWriteFormatPI(xmlTextWriterPtr writer,
                                   const xmlChar * target,
                                   const char *format, ...)
				   ;
    extern int 
        xmlTextWriterWriteVFormatPI(xmlTextWriterPtr writer,
                                    const xmlChar * target,
                                    const char *format, va_list argptr)
				    ;
    extern int 
        xmlTextWriterWritePI(xmlTextWriterPtr writer,
                             const xmlChar * target,
                             const xmlChar * content);

/**
 * xmlTextWriterWriteProcessingInstruction:
 *
 * This macro maps to xmlTextWriterWritePI
 */
#define xmlTextWriterWriteProcessingInstruction xmlTextWriterWritePI

/*
 * CDATA
 */
    extern int  xmlTextWriterStartCDATA(xmlTextWriterPtr writer);
    extern int  xmlTextWriterEndCDATA(xmlTextWriterPtr writer);

/*
 * CDATA conveniency functions
 */
    extern int 
        xmlTextWriterWriteFormatCDATA(xmlTextWriterPtr writer,
                                      const char *format, ...)
				      ;
    extern int 
        xmlTextWriterWriteVFormatCDATA(xmlTextWriterPtr writer,
                                       const char *format, va_list argptr)
				       ;
    extern int 
        xmlTextWriterWriteCDATA(xmlTextWriterPtr writer,
                                const xmlChar * content);

/*
 * DTD
 */
    extern int 
        xmlTextWriterStartDTD(xmlTextWriterPtr writer,
                              const xmlChar * name,
                              const xmlChar * pubid,
                              const xmlChar * sysid);
    extern int  xmlTextWriterEndDTD(xmlTextWriterPtr writer);

/*
 * DTD conveniency functions
 */
    extern int 
        xmlTextWriterWriteFormatDTD(xmlTextWriterPtr writer,
                                    const xmlChar * name,
                                    const xmlChar * pubid,
                                    const xmlChar * sysid,
                                    const char *format, ...)
				    ;
    extern int 
        xmlTextWriterWriteVFormatDTD(xmlTextWriterPtr writer,
                                     const xmlChar * name,
                                     const xmlChar * pubid,
                                     const xmlChar * sysid,
                                     const char *format, va_list argptr)
				  ;
    extern int 
        xmlTextWriterWriteDTD(xmlTextWriterPtr writer,
                              const xmlChar * name,
                              const xmlChar * pubid,
                              const xmlChar * sysid,
                              const xmlChar * subset);

/**
 * xmlTextWriterWriteDocType:
 *
 * this macro maps to xmlTextWriterWriteDTD
 */
#define xmlTextWriterWriteDocType xmlTextWriterWriteDTD

/*
 * DTD element definition
 */
    extern int 
        xmlTextWriterStartDTDElement(xmlTextWriterPtr writer,
                                     const xmlChar * name);
    extern int  xmlTextWriterEndDTDElement(xmlTextWriterPtr
                                                     writer);

/*
 * DTD element definition conveniency functions
 */
    extern int 
        xmlTextWriterWriteFormatDTDElement(xmlTextWriterPtr writer,
                                           const xmlChar * name,
                                           const char *format, ...)
					   ;
    extern int 
        xmlTextWriterWriteVFormatDTDElement(xmlTextWriterPtr writer,
                                            const xmlChar * name,
                                            const char *format,
                                            va_list argptr)
					    ;
    extern int  xmlTextWriterWriteDTDElement(xmlTextWriterPtr
                                                       writer,
                                                       const xmlChar *
                                                       name,
                                                       const xmlChar *
                                                       content);

/*
 * DTD attribute list definition
 */
    extern int 
        xmlTextWriterStartDTDAttlist(xmlTextWriterPtr writer,
                                     const xmlChar * name);
    extern int  xmlTextWriterEndDTDAttlist(xmlTextWriterPtr
                                                     writer);

/*
 * DTD attribute list definition conveniency functions
 */
    extern int 
        xmlTextWriterWriteFormatDTDAttlist(xmlTextWriterPtr writer,
                                           const xmlChar * name,
                                           const char *format, ...)
					   ;
    extern int 
        xmlTextWriterWriteVFormatDTDAttlist(xmlTextWriterPtr writer,
                                            const xmlChar * name,
                                            const char *format,
                                            va_list argptr)
					    ;
    extern int  xmlTextWriterWriteDTDAttlist(xmlTextWriterPtr
                                                       writer,
                                                       const xmlChar *
                                                       name,
                                                       const xmlChar *
                                                       content);

/*
 * DTD entity definition
 */
    extern int 
        xmlTextWriterStartDTDEntity(xmlTextWriterPtr writer,
                                    int pe, const xmlChar * name);
    extern int  xmlTextWriterEndDTDEntity(xmlTextWriterPtr
                                                    writer);

/*
 * DTD entity definition conveniency functions
 */
    extern int 
        xmlTextWriterWriteFormatDTDInternalEntity(xmlTextWriterPtr writer,
                                                  int pe,
                                                  const xmlChar * name,
                                                  const char *format, ...)
						  ;
    extern int 
        xmlTextWriterWriteVFormatDTDInternalEntity(xmlTextWriterPtr writer,
                                                   int pe,
                                                   const xmlChar * name,
                                                   const char *format,
                                                   va_list argptr)
						   ;
    extern int 
        xmlTextWriterWriteDTDInternalEntity(xmlTextWriterPtr writer,
                                            int pe,
                                            const xmlChar * name,
                                            const xmlChar * content);
    extern int 
        xmlTextWriterWriteDTDExternalEntity(xmlTextWriterPtr writer,
                                            int pe,
                                            const xmlChar * name,
                                            const xmlChar * pubid,
                                            const xmlChar * sysid,
                                            const xmlChar * ndataid);
    extern int 
        xmlTextWriterWriteDTDExternalEntityContents(xmlTextWriterPtr
                                                    writer,
                                                    const xmlChar * pubid,
                                                    const xmlChar * sysid,
                                                    const xmlChar *
                                                    ndataid);
    extern int  xmlTextWriterWriteDTDEntity(xmlTextWriterPtr
                                                      writer, int pe,
                                                      const xmlChar * name,
                                                      const xmlChar *
                                                      pubid,
                                                      const xmlChar *
                                                      sysid,
                                                      const xmlChar *
                                                      ndataid,
                                                      const xmlChar *
                                                      content);

/*
 * DTD notation definition
 */
    extern int 
        xmlTextWriterWriteDTDNotation(xmlTextWriterPtr writer,
                                      const xmlChar * name,
                                      const xmlChar * pubid,
                                      const xmlChar * sysid);

/*
 * Indentation
 */
    extern int 
        xmlTextWriterSetIndent(xmlTextWriterPtr writer, int indent);
    extern int 
        xmlTextWriterSetIndentString(xmlTextWriterPtr writer,
                                     const xmlChar * str);

    extern int 
        xmlTextWriterSetQuoteChar(xmlTextWriterPtr writer, xmlChar quotechar);


/*
 * misc
 */
    extern int  xmlTextWriterFlush(xmlTextWriterPtr writer);

#ifdef __cplusplus
}
#endif

#endif /* LIBXML_WRITER_ENABLED */

#endif                          /* __XML_XMLWRITER_H__ */

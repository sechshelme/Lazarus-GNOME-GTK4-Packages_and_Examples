/*
 * Summary: set of routines to process strings
 * Description: type and interfaces needed for the internal string handling
 *              of the library, especially UTF8 processing.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_STRING_H__
#define __XML_STRING_H__

#include <stdarg.h>
#include <libxml/xmlversion.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * xmlChar:
 *
 * This is a basic byte in an UTF-8 encoded string.
 * It's unsigned allowing to pinpoint case where char * are assigned
 * to xmlChar * (possibly making serialization back impossible).
 */
typedef unsigned char xmlChar;

/**
 * BAD_CAST:
 *
 * Macro to cast a string to an xmlChar * when one know its safe.
 */
//#define BAD_CAST (xmlChar *)

/*
 * xmlChar handling
 */
extern xmlChar * 
                xmlStrdup                (const xmlChar *cur);
extern xmlChar * 
                xmlStrndup               (const xmlChar *cur,
                                         int len);
extern xmlChar * 
                xmlCharStrndup           (const char *cur,
                                         int len);
extern xmlChar * 
                xmlCharStrdup            (const char *cur);
extern xmlChar * 
                xmlStrsub                (const xmlChar *str,
                                         int start,
                                         int len);
extern const xmlChar * 
                xmlStrchr                (const xmlChar *str,
                                         xmlChar val);
extern const xmlChar * 
                xmlStrstr                (const xmlChar *str,
                                         const xmlChar *val);
extern const xmlChar * 
                xmlStrcasestr            (const xmlChar *str,
                                         const xmlChar *val);
extern int 
                xmlStrcmp                (const xmlChar *str1,
                                         const xmlChar *str2);
extern int 
                xmlStrncmp               (const xmlChar *str1,
                                         const xmlChar *str2,
                                         int len);
extern int 
                xmlStrcasecmp            (const xmlChar *str1,
                                         const xmlChar *str2);
extern int 
                xmlStrncasecmp           (const xmlChar *str1,
                                         const xmlChar *str2,
                                         int len);
extern int 
                xmlStrEqual              (const xmlChar *str1,
                                         const xmlChar *str2);
extern int 
                xmlStrQEqual             (const xmlChar *pref,
                                         const xmlChar *name,
                                         const xmlChar *str);
extern int 
                xmlStrlen                (const xmlChar *str);
extern xmlChar * 
                xmlStrcat                (xmlChar *cur,
                                         const xmlChar *add);
extern xmlChar * 
                xmlStrncat               (xmlChar *cur,
                                         const xmlChar *add,
                                         int len);
extern xmlChar * 
                xmlStrncatNew            (const xmlChar *str1,
                                         const xmlChar *str2,
                                         int len);
extern int 
                xmlStrPrintf             (xmlChar *buf,
                                         int len,
                                         const char *msg,
                                         ...) ;
extern int 
                xmlStrVPrintf                (xmlChar *buf,
                                         int len,
                                         const char *msg,
                                         va_list ap);

extern int 
        xmlGetUTF8Char                   (const unsigned char *utf,
                                         int *len);
extern int 
        xmlCheckUTF8                     (const unsigned char *utf);
extern int 
        xmlUTF8Strsize                   (const xmlChar *utf,
                                         int len);
extern xmlChar * 
        xmlUTF8Strndup                   (const xmlChar *utf,
                                         int len);
extern const xmlChar * 
        xmlUTF8Strpos                    (const xmlChar *utf,
                                         int pos);
extern int 
        xmlUTF8Strloc                    (const xmlChar *utf,
                                         const xmlChar *utfchar);
extern xmlChar * 
        xmlUTF8Strsub                    (const xmlChar *utf,
                                         int start,
                                         int len);
extern int 
        xmlUTF8Strlen                    (const xmlChar *utf);
extern int 
        xmlUTF8Size                      (const xmlChar *utf);
extern int 
        xmlUTF8Charcmp                   (const xmlChar *utf1,
                                         const xmlChar *utf2);

#ifdef __cplusplus
}
#endif
#endif /* __XML_STRING_H__ */

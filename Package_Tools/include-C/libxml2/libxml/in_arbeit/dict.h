/*
 * Summary: string dictionary
 * Description: dictionary of reusable strings, just used to avoid allocation
 *         and freeing operations.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_DICT_H__
#define __XML_DICT_H__

#include <stddef.h>
#include <libxml/xmlversion.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * The dictionary.
 */
typedef struct _xmlDict xmlDict;
typedef xmlDict *xmlDictPtr;

/*
 * Initializer
 */
extern int   xmlInitializeDict(void);

/*
 * Constructor and destructor.
 */
extern xmlDictPtr 
			xmlDictCreate	(void);
extern size_t 
			xmlDictSetLimit	(xmlDictPtr dict,
                                         size_t limit);
extern size_t 
			xmlDictGetUsage (xmlDictPtr dict);
extern xmlDictPtr 
			xmlDictCreateSub(xmlDictPtr sub);
extern int 
			xmlDictReference(xmlDictPtr dict);
extern void 
			xmlDictFree	(xmlDictPtr dict);

/*
 * Lookup of entry in the dictionary.
 */
extern const xmlChar * 
			xmlDictLookup	(xmlDictPtr dict,
		                         const xmlChar *name,
		                         int len);
extern const xmlChar * 
			xmlDictExists	(xmlDictPtr dict,
		                         const xmlChar *name,
		                         int len);
extern const xmlChar * 
			xmlDictQLookup	(xmlDictPtr dict,
		                         const xmlChar *prefix,
		                         const xmlChar *name);
extern int 
			xmlDictOwns	(xmlDictPtr dict,
					 const xmlChar *str);
extern int 
			xmlDictSize	(xmlDictPtr dict);

/*
 * Cleanup function
 */
extern void 
                        xmlDictCleanup  (void);

#ifdef __cplusplus
}
#endif
#endif /* ! __XML_DICT_H__ */

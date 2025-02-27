/*
 * Summary: Chained hash tables
 * Description: This module implements the hash table support used in
 *		various places in the library.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Bjorn Reese <bjorn.reese@systematic.dk>
 */

#ifndef __XML_HASH_H__
#define __XML_HASH_H__

#ifdef __cplusplus
extern "C" {
#endif

/*
 * The hash table.
 */
typedef struct _xmlHashTable xmlHashTable;
typedef xmlHashTable *xmlHashTablePtr;

#ifdef __cplusplus
}
#endif

#include <libxml/xmlversion.h>
#include <libxml/parser.h>
#include <libxml/dict.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Recent version of gcc produce a warning when a function pointer is assigned
 * to an object pointer, or vice versa.  The following macro is a dirty hack
 * to allow suppression of the warning.  If your architecture has function
 * pointers which are a different size than a void pointer, there may be some
 * serious trouble within the library.
 */
/**
 * XML_CAST_FPTR:
 * @fptr:  pointer to a function
 *
 * Macro to do a casting from an object pointer to a
 * function pointer without encountering a warning from
 * gcc
 *
 * #define XML_CAST_FPTR(fptr) (*(void **)(&fptr))
 * This macro violated ISO C aliasing rules (gcc4 on s390 broke)
 * so it is disabled now
 */

#define XML_CAST_FPTR(fptr) fptr


/*
 * function types:
 */
/**
 * xmlHashDeallocator:
 * @payload:  the data in the hash
 * @name:  the name associated
 *
 * Callback to free data from a hash.
 */
typedef void (*xmlHashDeallocator)(void *payload, const xmlChar *name);
/**
 * xmlHashCopier:
 * @payload:  the data in the hash
 * @name:  the name associated
 *
 * Callback to copy data from a hash.
 *
 * Returns a copy of the data or NULL in case of error.
 */
typedef void *(*xmlHashCopier)(void *payload, const xmlChar *name);
/**
 * xmlHashScanner:
 * @payload:  the data in the hash
 * @data:  extra scanner data
 * @name:  the name associated
 *
 * Callback when scanning data in a hash with the simple scanner.
 */
typedef void (*xmlHashScanner)(void *payload, void *data, const xmlChar *name);
/**
 * xmlHashScannerFull:
 * @payload:  the data in the hash
 * @data:  extra scanner data
 * @name:  the name associated
 * @name2:  the second name associated
 * @name3:  the third name associated
 *
 * Callback when scanning data in a hash with the full scanner.
 */
typedef void (*xmlHashScannerFull)(void *payload, void *data,
				   const xmlChar *name, const xmlChar *name2,
				   const xmlChar *name3);

/*
 * Constructor and destructor.
 */
extern xmlHashTablePtr 
			xmlHashCreate	(int size);
extern xmlHashTablePtr 
			xmlHashCreateDict(int size,
					 xmlDictPtr dict);
extern void 
			xmlHashFree	(xmlHashTablePtr table,
					 xmlHashDeallocator f);
extern void 
			xmlHashDefaultDeallocator(void *entry,
					 const xmlChar *name);

/*
 * Add a new entry to the hash table.
 */
extern int 
			xmlHashAddEntry	(xmlHashTablePtr table,
		                         const xmlChar *name,
		                         void *userdata);
extern int 
			xmlHashUpdateEntry(xmlHashTablePtr table,
		                         const xmlChar *name,
		                         void *userdata,
					 xmlHashDeallocator f);
extern int 
			xmlHashAddEntry2(xmlHashTablePtr table,
		                         const xmlChar *name,
		                         const xmlChar *name2,
		                         void *userdata);
extern int 
			xmlHashUpdateEntry2(xmlHashTablePtr table,
		                         const xmlChar *name,
		                         const xmlChar *name2,
		                         void *userdata,
					 xmlHashDeallocator f);
extern int 
			xmlHashAddEntry3(xmlHashTablePtr table,
		                         const xmlChar *name,
		                         const xmlChar *name2,
		                         const xmlChar *name3,
		                         void *userdata);
extern int 
			xmlHashUpdateEntry3(xmlHashTablePtr table,
		                         const xmlChar *name,
		                         const xmlChar *name2,
		                         const xmlChar *name3,
		                         void *userdata,
					 xmlHashDeallocator f);

/*
 * Remove an entry from the hash table.
 */
extern int 
			xmlHashRemoveEntry(xmlHashTablePtr table, const xmlChar *name,
                           xmlHashDeallocator f);
extern int 
			xmlHashRemoveEntry2(xmlHashTablePtr table, const xmlChar *name,
                            const xmlChar *name2, xmlHashDeallocator f);
extern int  
			xmlHashRemoveEntry3(xmlHashTablePtr table, const xmlChar *name,
                            const xmlChar *name2, const xmlChar *name3,
                            xmlHashDeallocator f);

/*
 * Retrieve the userdata.
 */
extern void * 
			xmlHashLookup	(xmlHashTablePtr table,
					 const xmlChar *name);
extern void * 
			xmlHashLookup2	(xmlHashTablePtr table,
					 const xmlChar *name,
					 const xmlChar *name2);
extern void * 
			xmlHashLookup3	(xmlHashTablePtr table,
					 const xmlChar *name,
					 const xmlChar *name2,
					 const xmlChar *name3);
extern void * 
			xmlHashQLookup	(xmlHashTablePtr table,
					 const xmlChar *name,
					 const xmlChar *prefix);
extern void * 
			xmlHashQLookup2	(xmlHashTablePtr table,
					 const xmlChar *name,
					 const xmlChar *prefix,
					 const xmlChar *name2,
					 const xmlChar *prefix2);
extern void * 
			xmlHashQLookup3	(xmlHashTablePtr table,
					 const xmlChar *name,
					 const xmlChar *prefix,
					 const xmlChar *name2,
					 const xmlChar *prefix2,
					 const xmlChar *name3,
					 const xmlChar *prefix3);

/*
 * Helpers.
 */
extern xmlHashTablePtr 
			xmlHashCopy	(xmlHashTablePtr table,
					 xmlHashCopier f);
extern int 
			xmlHashSize	(xmlHashTablePtr table);
extern void 
			xmlHashScan	(xmlHashTablePtr table,
					 xmlHashScanner f,
					 void *data);
extern void 
			xmlHashScan3	(xmlHashTablePtr table,
					 const xmlChar *name,
					 const xmlChar *name2,
					 const xmlChar *name3,
					 xmlHashScanner f,
					 void *data);
extern void 
			xmlHashScanFull	(xmlHashTablePtr table,
					 xmlHashScannerFull f,
					 void *data);
extern void 
			xmlHashScanFull3(xmlHashTablePtr table,
					 const xmlChar *name,
					 const xmlChar *name2,
					 const xmlChar *name3,
					 xmlHashScannerFull f,
					 void *data);
#ifdef __cplusplus
}
#endif
#endif /* ! __XML_HASH_H__ */

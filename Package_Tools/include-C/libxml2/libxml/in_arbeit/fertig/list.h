/*
 * Summary: lists interfaces
 * Description: this module implement the list support used in
 * various place in the library.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Gary Pennington <Gary.Pennington@uk.sun.com>
 */

#ifndef __XML_LINK_INCLUDE__
#define __XML_LINK_INCLUDE__

#include <libxml/xmlversion.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _xmlLink xmlLink;
typedef xmlLink *xmlLinkPtr;

typedef struct _xmlList xmlList;
typedef xmlList *xmlListPtr;

/**
 * xmlListDeallocator:
 * @lk:  the data to deallocate
 *
 * Callback function used to free data from a list.
 */
typedef void (*xmlListDeallocator) (xmlLinkPtr lk);
/**
 * xmlListDataCompare:
 * @data0: the first data
 * @data1: the second data
 *
 * Callback function used to compare 2 data.
 *
 * Returns 0 is equality, -1 or 1 otherwise depending on the ordering.
 */
typedef int  (*xmlListDataCompare) (const void *data0, const void *data1);
/**
 * xmlListWalker:
 * @data: the data found in the list
 * @user: extra user provided data to the walker
 *
 * Callback function used when walking a list with xmlListWalk().
 *
 * Returns 0 to stop walking the list, 1 otherwise.
 */
typedef int (*xmlListWalker) (const void *data, void *user);

/* Creation/Deletion */
extern xmlListPtr 
		xmlListCreate		(xmlListDeallocator deallocator,
	                                 xmlListDataCompare compare);
extern void 
		xmlListDelete		(xmlListPtr l);

/* Basic Operators */
extern void * 
		xmlListSearch		(xmlListPtr l,
					 void *data);
extern void * 
		xmlListReverseSearch	(xmlListPtr l,
					 void *data);
extern int 
		xmlListInsert		(xmlListPtr l,
					 void *data) ;
extern int 
		xmlListAppend		(xmlListPtr l,
					 void *data) ;
extern int 
		xmlListRemoveFirst	(xmlListPtr l,
					 void *data);
extern int 
		xmlListRemoveLast	(xmlListPtr l,
					 void *data);
extern int 
		xmlListRemoveAll	(xmlListPtr l,
					 void *data);
extern void 
		xmlListClear		(xmlListPtr l);
extern int 
		xmlListEmpty		(xmlListPtr l);
extern xmlLinkPtr 
		xmlListFront		(xmlListPtr l);
extern xmlLinkPtr 
		xmlListEnd		(xmlListPtr l);
extern int 
		xmlListSize		(xmlListPtr l);

extern void 
		xmlListPopFront		(xmlListPtr l);
extern void 
		xmlListPopBack		(xmlListPtr l);
extern int 
		xmlListPushFront	(xmlListPtr l,
					 void *data);
extern int 
		xmlListPushBack		(xmlListPtr l,
					 void *data);

/* Advanced Operators */
extern void 
		xmlListReverse		(xmlListPtr l);
extern void 
		xmlListSort		(xmlListPtr l);
extern void 
		xmlListWalk		(xmlListPtr l,
					 xmlListWalker walker,
					 void *user);
extern void 
		xmlListReverseWalk	(xmlListPtr l,
					 xmlListWalker walker,
					 void *user);
extern void 
		xmlListMerge		(xmlListPtr l1,
					 xmlListPtr l2);
extern xmlListPtr 
		xmlListDup		(const xmlListPtr old);
extern int 
		xmlListCopy		(xmlListPtr cur,
					 const xmlListPtr old);
/* Link operators */
extern void * 
		xmlLinkGetData          (xmlLinkPtr lk);

/* xmlListUnique() */
/* xmlListSwap */

#ifdef __cplusplus
}
#endif

#endif /* __XML_LINK_INCLUDE__ */

/**
 * Summary: interfaces for thread handling
 * Description: set of generic threading related routines
 *              should work with pthreads, Windows native or TLS threads
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __XML_THREADS_H__
#define __XML_THREADS_H__

#include <libxml/xmlversion.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * xmlMutex are a simple mutual exception locks.
 */
typedef struct _xmlMutex xmlMutex;
typedef xmlMutex *xmlMutexPtr;

/*
 * xmlRMutex are reentrant mutual exception locks.
 */
typedef struct _xmlRMutex xmlRMutex;
typedef xmlRMutex *xmlRMutexPtr;

#ifdef __cplusplus
}
#endif
#include <libxml/globals.h>
#ifdef __cplusplus
extern "C" {
#endif
extern xmlMutexPtr 
			xmlNewMutex	(void);
extern void 
			xmlMutexLock	(xmlMutexPtr tok);
extern void 
			xmlMutexUnlock	(xmlMutexPtr tok);
extern void 
			xmlFreeMutex	(xmlMutexPtr tok);

extern xmlRMutexPtr 
			xmlNewRMutex	(void);
extern void 
			xmlRMutexLock	(xmlRMutexPtr tok);
extern void 
			xmlRMutexUnlock	(xmlRMutexPtr tok);
extern void 
			xmlFreeRMutex	(xmlRMutexPtr tok);

/*
 * Library wide APIs.
 */
extern void 
			xmlInitThreads	(void);
extern void 
			xmlLockLibrary	(void);
extern void 
			xmlUnlockLibrary(void);
extern int 
			xmlGetThreadId	(void);
extern int 
			xmlIsMainThread	(void);
extern void 
			xmlCleanupThreads(void);
extern xmlGlobalStatePtr 
			xmlGetGlobalState(void);

#ifdef HAVE_PTHREAD_H
#elif defined(HAVE_WIN32_THREADS) && !defined(HAVE_COMPILER_TLS) && (!defined(LIBXML_STATIC) || defined(LIBXML_STATIC_FOR_DLL))
#if defined(LIBXML_STATIC_FOR_DLL)
int 
xmlDllMain(void *hinstDLL, unsigned long fdwReason,
           void *lpvReserved);
#endif
#endif

#ifdef __cplusplus
}
#endif


#endif /* __XML_THREADS_H__ */

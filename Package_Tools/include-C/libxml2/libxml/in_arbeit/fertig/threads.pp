
unit threads;
interface

{
  Automatically converted by H2Pas 1.0.0 from threads.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    threads.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PxmlMutex  = ^xmlMutex;
PxmlMutexPtr  = ^xmlMutexPtr;
PxmlRMutex  = ^xmlRMutex;
PxmlRMutexPtr  = ^xmlRMutexPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Summary: interfaces for thread handling
 * Description: set of generic threading related routines
 *              should work with pthreads, Windows native or TLS threads
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_THREADS_H__}
{$define __XML_THREADS_H__}
{$include <libxml/xmlversion.h>}
{ C++ extern C conditionnal removed }
{
 * xmlMutex are a simple mutual exception locks.
  }
type

  PxmlMutexPtr = ^TxmlMutexPtr;
  TxmlMutexPtr = PxmlMutex;
{
 * xmlRMutex are reentrant mutual exception locks.
  }

  PxmlRMutexPtr = ^TxmlRMutexPtr;
  TxmlRMutexPtr = PxmlRMutex;
{ C++ end of extern C conditionnal removed }
{$include <libxml/globals.h>}
{ C++ extern C conditionnal removed }

function xmlNewMutex:TxmlMutexPtr;cdecl;external;
procedure xmlMutexLock(tok:TxmlMutexPtr);cdecl;external;
procedure xmlMutexUnlock(tok:TxmlMutexPtr);cdecl;external;
procedure xmlFreeMutex(tok:TxmlMutexPtr);cdecl;external;
function xmlNewRMutex:TxmlRMutexPtr;cdecl;external;
procedure xmlRMutexLock(tok:TxmlRMutexPtr);cdecl;external;
procedure xmlRMutexUnlock(tok:TxmlRMutexPtr);cdecl;external;
procedure xmlFreeRMutex(tok:TxmlRMutexPtr);cdecl;external;
{
 * Library wide APIs.
  }
procedure xmlInitThreads;cdecl;external;
procedure xmlLockLibrary;cdecl;external;
procedure xmlUnlockLibrary;cdecl;external;
function xmlGetThreadId:longint;cdecl;external;
function xmlIsMainThread:longint;cdecl;external;
procedure xmlCleanupThreads;cdecl;external;
function xmlGetGlobalState:TxmlGlobalStatePtr;cdecl;external;
{$ifdef HAVE_PTHREAD_H}
(*** was #elif ****){$else defined(HAVE_WIN32_THREADS) && !defined(HAVE_COMPILER_TLS) && (!defined(LIBXML_STATIC) || defined(LIBXML_STATIC_FOR_DLL))}
{$if defined(LIBXML_STATIC_FOR_DLL)}

function xmlDllMain(hinstDLL:pointer; fdwReason:dword; lpvReserved:pointer):longint;cdecl;external;
{$endif}
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_THREADS_H__  }

implementation


end.

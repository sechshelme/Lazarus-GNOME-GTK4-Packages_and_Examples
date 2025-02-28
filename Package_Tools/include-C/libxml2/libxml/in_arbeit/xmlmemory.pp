
unit xmlmemory;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlmemory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlmemory.h
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
Pchar  = ^char;
PFILE  = ^FILE;
PxmlFreeFunc  = ^xmlFreeFunc;
PxmlMallocFunc  = ^xmlMallocFunc;
PxmlReallocFunc  = ^xmlReallocFunc;
PxmlStrdupFunc  = ^xmlStrdupFunc;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: interface for the memory allocator
 * Description: provides interfaces for the memory allocator,
 *              including debugging capabilities.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __DEBUG_MEMORY_ALLOC__}
{$define __DEBUG_MEMORY_ALLOC__}
{$include <stdio.h>}
{$include <libxml/xmlversion.h>}
{*
 * DEBUG_MEMORY:
 *
 * DEBUG_MEMORY replaces the allocator with a collect and debug
 * shell to the libc allocator.
 * DEBUG_MEMORY should only be activated when debugging
 * libxml i.e. if libxml has been configured with --with-debug-mem too.
  }
{ #define DEBUG_MEMORY_FREED  }
{ #define DEBUG_MEMORY_LOCATION  }
{$ifdef DEBUG}
{$ifndef DEBUG_MEMORY}
{$define DEBUG_MEMORY}
{$endif}
{$endif}
{*
 * DEBUG_MEMORY_LOCATION:
 *
 * DEBUG_MEMORY_LOCATION should be activated only when debugging
 * libxml i.e. if libxml has been configured with --with-debug-mem too.
  }
{$ifdef DEBUG_MEMORY_LOCATION}
{$endif}
{ C++ extern C conditionnal removed }
{
 * The XML memory wrapper support 4 basic overloadable functions.
  }
{*
 * xmlFreeFunc:
 * @mem: an already allocated block of memory
 *
 * Signature for a free() implementation.
  }
type

  TxmlFreeFunc = procedure (mem:pointer);cdecl;
{*
 * xmlMallocFunc:
 * @size:  the size requested in bytes
 *
 * Signature for a malloc() implementation.
 *
 * Returns a pointer to the newly allocated block or NULL in case of error.
  }

  PxmlMallocFunc = ^TxmlMallocFunc;
  TxmlMallocFunc = function (size:Tsize_t):pointer;cdecl;
{*
 * xmlReallocFunc:
 * @mem: an already allocated block of memory
 * @size:  the new size requested in bytes
 *
 * Signature for a realloc() implementation.
 *
 * Returns a pointer to the newly reallocated block or NULL in case of error.
  }

  PxmlReallocFunc = ^TxmlReallocFunc;
  TxmlReallocFunc = function (mem:pointer; size:Tsize_t):pointer;cdecl;
{*
 * xmlStrdupFunc:
 * @str: a zero terminated string
 *
 * Signature for an strdup() implementation.
 *
 * Returns the copy of the string or NULL in case of error.
  }
(* Const before type ignored *)

  PxmlStrdupFunc = ^TxmlStrdupFunc;
  TxmlStrdupFunc = function (str:Pchar):Pchar;cdecl;
{
 * The 4 interfaces used for all memory handling within libxml.
LIBXML_DLL_IMPORT xmlFreeFunc xmlFree;
LIBXML_DLL_IMPORT xmlMallocFunc xmlMalloc;
LIBXML_DLL_IMPORT xmlMallocFunc xmlMallocAtomic;
LIBXML_DLL_IMPORT xmlReallocFunc xmlRealloc;
LIBXML_DLL_IMPORT xmlStrdupFunc xmlMemStrdup;
  }
{
 * The way to overload the existing functions.
 * The xmlGc function have an extra entry for atomic block
 * allocations useful for garbage collected memory allocators
  }

function xmlMemSetup(freeFunc:TxmlFreeFunc; mallocFunc:TxmlMallocFunc; reallocFunc:TxmlReallocFunc; strdupFunc:TxmlStrdupFunc):longint;cdecl;external;
function xmlMemGet(freeFunc:PxmlFreeFunc; mallocFunc:PxmlMallocFunc; reallocFunc:PxmlReallocFunc; strdupFunc:PxmlStrdupFunc):longint;cdecl;external;
function xmlGcMemSetup(freeFunc:TxmlFreeFunc; mallocFunc:TxmlMallocFunc; mallocAtomicFunc:TxmlMallocFunc; reallocFunc:TxmlReallocFunc; strdupFunc:TxmlStrdupFunc):longint;cdecl;external;
function xmlGcMemGet(freeFunc:PxmlFreeFunc; mallocFunc:PxmlMallocFunc; mallocAtomicFunc:PxmlMallocFunc; reallocFunc:PxmlReallocFunc; strdupFunc:PxmlStrdupFunc):longint;cdecl;external;
{
 * Initialization of the memory layer.
  }
function xmlInitMemory:longint;cdecl;external;
{
 * Cleanup of the memory layer.
  }
procedure xmlCleanupMemory;cdecl;external;
{
 * These are specific to the XML debug memory wrapper.
  }
function xmlMemUsed:longint;cdecl;external;
function xmlMemBlocks:longint;cdecl;external;
procedure xmlMemDisplay(fp:PFILE);cdecl;external;
procedure xmlMemDisplayLast(fp:PFILE; nbBytes:longint);cdecl;external;
procedure xmlMemShow(fp:PFILE; nr:longint);cdecl;external;
procedure xmlMemoryDump;cdecl;external;
function xmlMemMalloc(size:Tsize_t):pointer;cdecl;external;
function xmlMemRealloc(ptr:pointer; size:Tsize_t):pointer;cdecl;external;
procedure xmlMemFree(ptr:pointer);cdecl;external;
(* Const before type ignored *)
function xmlMemoryStrdup(str:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function xmlMallocLoc(size:Tsize_t; file:Pchar; line:longint):pointer;cdecl;external;
(* Const before type ignored *)
function xmlReallocLoc(ptr:pointer; size:Tsize_t; file:Pchar; line:longint):pointer;cdecl;external;
(* Const before type ignored *)
function xmlMallocAtomicLoc(size:Tsize_t; file:Pchar; line:longint):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlMemStrdupLoc(str:Pchar; file:Pchar; line:longint):Pchar;cdecl;external;
{$ifdef DEBUG_MEMORY_LOCATION}
{*
 * xmlMalloc:
 * @size:  number of bytes to allocate
 *
 * Wrapper for the malloc() function used in the XML library.
 *
 * Returns the pointer to the allocated area or NULL in case of error.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlMalloc(size : longint) : longint;

{*
 * xmlMallocAtomic:
 * @size:  number of bytes to allocate
 *
 * Wrapper for the malloc() function used in the XML library for allocation
 * of block not containing pointers to other areas.
 *
 * Returns the pointer to the allocated area or NULL in case of error.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlMallocAtomic(size : longint) : longint;

{*
 * xmlRealloc:
 * @ptr:  pointer to the existing allocated area
 * @size:  number of bytes to allocate
 *
 * Wrapper for the realloc() function used in the XML library.
 *
 * Returns the pointer to the allocated area or NULL in case of error.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlRealloc(ptr,size : longint) : longint;

{*
 * xmlMemStrdup:
 * @str:  pointer to the existing string
 *
 * Wrapper for the strdup() function, xmlStrdup() is usually preferred.
 *
 * Returns the pointer to the allocated area or NULL in case of error.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlMemStrdup(str : longint) : longint;

{$endif}
{ DEBUG_MEMORY_LOCATION  }
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$ifndef __XML_GLOBALS_H}
{$ifndef __XML_THREADS_H__}
{$include <libxml/threads.h>}
{$include <libxml/globals.h>}
{$endif}
{$endif}
{$endif}
{ __DEBUG_MEMORY_ALLOC__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlMalloc(size : longint) : longint;
begin
  xmlMalloc:=xmlMallocLoc(size,__FILE__,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlMallocAtomic(size : longint) : longint;
begin
  xmlMallocAtomic:=xmlMallocAtomicLoc(size,__FILE__,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlRealloc(ptr,size : longint) : longint;
begin
  xmlRealloc:=xmlReallocLoc(ptr,size,__FILE__,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function xmlMemStrdup(str : longint) : longint;
begin
  xmlMemStrdup:=xmlMemStrdupLoc(str,__FILE__,__LINE__);
end;


end.

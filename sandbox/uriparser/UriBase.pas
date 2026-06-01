unit UriBase;

interface

uses
  fp_uriparser;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * uriparser - RFC 3986 URI parsing library
 *
 * Copyright (C) 2007, Weijia Song <songweijia@gmail.com>
 * Copyright (C) 2007, Sebastian Pipping <sebastian@pipping.org>
 * All rights reserved.
 *
 * Redistribution and use in source  and binary forms, with or without
 * modification, are permitted provided  that the following conditions
 * are met:
 *
 *     1. Redistributions  of  source  code   must  retain  the  above
 *        copyright notice, this list  of conditions and the following
 *        disclaimer.
 *
 *     2. Redistributions  in binary  form  must  reproduce the  above
 *        copyright notice, this list  of conditions and the following
 *        disclaimer  in  the  documentation  and/or  other  materials
 *        provided with the distribution.
 *
 *     3. Neither the  name of the  copyright holder nor the  names of
 *        its contributors may be used  to endorse or promote products
 *        derived from  this software  without specific  prior written
 *        permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND  ANY EXPRESS OR IMPLIED WARRANTIES,  INCLUDING, BUT NOT
 * LIMITED TO,  THE IMPLIED WARRANTIES OF  MERCHANTABILITY AND FITNESS
 * FOR  A  PARTICULAR  PURPOSE  ARE  DISCLAIMED.  IN  NO  EVENT  SHALL
 * THE  COPYRIGHT HOLDER  OR CONTRIBUTORS  BE LIABLE  FOR ANY  DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO,  PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA,  OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT  LIABILITY,  OR  TORT (INCLUDING  NEGLIGENCE  OR  OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{*
 * @file UriBase.h
 * Holds definitions independent of the encoding pass.
  }
{$ifndef URI_BASE_H}

const
  URI_BASE_H = 1;  
{ Version helper macro  }
{ Version  }
  URI_VER_MAJOR = 0;  
  URI_VER_MINOR = 9;  
  URI_VER_RELEASE = 7;  
  URI_VER_SUFFIX_ANSI = '';  

{ was #define dname def_expr }
function URI_VER_SUFFIX_UNICODE : longint; { return type might be wrong }

{ More version helper macros  }
type
  PUriBool = ^TUriBool;
  TUriBool = longint;
{*< Boolean type  }

const
  URI_TRUE = 1;  
  URI_FALSE = 0;  
{ Shared errors  }
  URI_SUCCESS = 0;  
{ Parsed text violates expected format  }
  URI_ERROR_SYNTAX = 1;  
{ One of the params passed was NULL
                                                although it mustn't be  }
  URI_ERROR_NULL = 2;  
{ Requested memory could not be allocated  }
  URI_ERROR_MALLOC = 3;  
{ Some output is to large for the receiving buffer  }
  URI_ERROR_OUTPUT_TOO_LARGE = 4;  
{ The called function is not implemented yet  }
  URI_ERROR_NOT_IMPLEMENTED = 8;  
{ The parameters passed contained invalid ranges  }
  URI_ERROR_RANGE_INVALID = 9;  
{ [>=0.9.0] The UriMemoryManager passed does not implement all needed functions  }
  URI_ERROR_MEMORY_MANAGER_INCOMPLETE = 10;  
{ Errors specific to ToString  }
{ Deprecated, test for URI_ERROR_OUTPUT_TOO_LARGE instead  }
  URI_ERROR_TOSTRING_TOO_LONG = URI_ERROR_OUTPUT_TOO_LARGE;  
{ Errors specific to AddBaseUri  }
{ Given base is not absolute  }
  URI_ERROR_ADDBASE_REL_BASE = 5;  
{ Errors specific to RemoveBaseUri  }
{ Given base is not absolute  }
  URI_ERROR_REMOVEBASE_REL_BASE = 6;  
{ Given base is not absolute  }
  URI_ERROR_REMOVEBASE_REL_SOURCE = 7;  
{ Error specific to uriTestMemoryManager  }
{ [>=0.9.0] The UriMemoryManager given did not pass the test suite  }
  URI_ERROR_MEMORY_MANAGER_FAULTY = 11;  
{$ifndef URI_DOXYGEN}
{$include <stdio.h> /* For NULL, snprintf */}
{$include <ctype.h> /* For wchar_t */}
{$include <string.h> /* For strlen, memset, memcpy */}
{$include <stdlib.h> /* For malloc */}
{$endif}
{ URI_DOXYGEN  }
{*
 * Holds an IPv4 address.
  }
{*< Each octet in one byte  }
type
  PUriIp4Struct = ^TUriIp4Struct;
  TUriIp4Struct = record
      data : array[0..3] of byte;
    end;
  TUriIp4 = TUriIp4Struct;
  PUriIp4 = ^TUriIp4;
{*< @copydoc UriIp4Struct  }
{*
 * Holds an IPv6 address.
  }
{*< Each quad in two bytes  }

  PUriIp6Struct = ^TUriIp6Struct;
  TUriIp6Struct = record
      data : array[0..15] of byte;
    end;
  TUriIp6 = TUriIp6Struct;
  PUriIp6 = ^TUriIp6;
{*< @copydoc UriIp6Struct  }
  PUriMemoryManagerStruct = ^TUriMemoryManagerStruct;
  TUriMemoryManagerStruct = record
      {undefined structure}
    end;

{ foward declaration to break loop  }
{*
 * Function signature that custom malloc(3) functions must conform to
 *
 * @since 0.9.0
  }

  PUriFuncMalloc = ^TUriFuncMalloc;
  TUriFuncMalloc = function (para1:PUriMemoryManagerStruct; para2:Tsize_t):pointer;cdecl;
{*
 * Function signature that custom calloc(3) functions must conform to
 *
 * @since 0.9.0
  }

  PUriFuncCalloc = ^TUriFuncCalloc;
  TUriFuncCalloc = function (para1:PUriMemoryManagerStruct; para2:Tsize_t; para3:Tsize_t):pointer;cdecl;
{*
 * Function signature that custom realloc(3) functions must conform to
 *
 * @since 0.9.0
  }

  PUriFuncRealloc = ^TUriFuncRealloc;
  TUriFuncRealloc = function (para1:PUriMemoryManagerStruct; para2:pointer; para3:Tsize_t):pointer;cdecl;
{*
 * Function signature that custom reallocarray(3) functions must conform to
 *
 * @since 0.9.0
  }

  PUriFuncReallocarray = ^TUriFuncReallocarray;
  TUriFuncReallocarray = function (para1:PUriMemoryManagerStruct; para2:pointer; para3:Tsize_t; para4:Tsize_t):pointer;cdecl;
{*
 * Function signature that custom free(3) functions must conform to
 *
 * @since 0.9.0
  }

  TUriFuncFree = procedure (para1:PUriMemoryManagerStruct; para2:pointer);cdecl;
{*
 * Class-like interface of custom memory managers
 *
 * @see uriCompleteMemoryManager
 * @see uriEmulateCalloc
 * @see uriEmulateReallocarray
 * @see uriTestMemoryManager
 * @since 0.9.0
  }
{*< Pointer to custom malloc(3)  }
{*< Pointer to custom calloc(3); to emulate using malloc and memset see uriEmulateCalloc  }
{*< Pointer to custom realloc(3)  }
{*< Pointer to custom reallocarray(3); to emulate using realloc see uriEmulateReallocarray  }
{*< Pointer to custom free(3)  }
{*< Pointer to data that the other function members need access to  }

  PUriMemoryManagerStruct = ^TUriMemoryManagerStruct;
  TUriMemoryManagerStruct = record
      malloc : TUriFuncMalloc;
      calloc : TUriFuncCalloc;
      realloc : TUriFuncRealloc;
      reallocarray : TUriFuncReallocarray;
      free : TUriFuncFree;
      userData : pointer;
    end;
  TUriMemoryManager = TUriMemoryManagerStruct;
  PUriMemoryManager = ^TUriMemoryManager;
{*< @copydoc UriMemoryManagerStruct  }
{*
 * Specifies a line break conversion mode.
  }
{*< Convert to Unix line breaks ("\\x0a")  }
{*< Convert to Windows line breaks ("\\x0d\\x0a")  }
{*< Convert to Macintosh line breaks ("\\x0d")  }
{*< @copydoc UriBreakConversionEnum::URI_BR_TO_LF  }
{*< @copydoc UriBreakConversionEnum::URI_BR_TO_CRLF  }
{*< @copydoc UriBreakConversionEnum::URI_BR_TO_CR  }
{*< Copy line breaks unmodified  }

  PUriBreakConversionEnum = ^TUriBreakConversionEnum;
  TUriBreakConversionEnum =  Longint;
  Const
    URI_BR_TO_LF = 0;
    URI_BR_TO_CRLF = 1;
    URI_BR_TO_CR = 2;
    URI_BR_TO_UNIX = URI_BR_TO_LF;
    URI_BR_TO_WINDOWS = URI_BR_TO_CRLF;
    URI_BR_TO_MAC = URI_BR_TO_CR;
    URI_BR_DONT_TOUCH = (URI_BR_TO_CR)+1;
;
  TUriBreakConversion = TUriBreakConversionEnum;
  PUriBreakConversion = ^TUriBreakConversion;
{*< @copydoc UriBreakConversionEnum  }
{*
 * Specifies which component of a %URI has to be normalized.
  }
{*< Do not normalize anything  }
{*< Normalize scheme (fix uppercase letters)  }
{*< Normalize user info (fix uppercase percent-encodings)  }
{*< Normalize host (fix uppercase letters)  }
{*< Normalize path (fix uppercase percent-encodings and redundant dot segments)  }
{*< Normalize query (fix uppercase percent-encodings)  }
{*< Normalize fragment (fix uppercase percent-encodings)  }
type
  PUriNormalizationMaskEnum = ^TUriNormalizationMaskEnum;
  TUriNormalizationMaskEnum =  Longint;
  Const
    URI_NORMALIZED = 0;
    URI_NORMALIZE_SCHEME = 1 shl 0;
    URI_NORMALIZE_USER_INFO = 1 shl 1;
    URI_NORMALIZE_HOST = 1 shl 2;
    URI_NORMALIZE_PATH = 1 shl 3;
    URI_NORMALIZE_QUERY = 1 shl 4;
    URI_NORMALIZE_FRAGMENT = 1 shl 5;
;
  TUriNormalizationMask = TUriNormalizationMaskEnum;
  PUriNormalizationMask = ^TUriNormalizationMask;
{*< @copydoc UriNormalizationMaskEnum  }
{*
 * Specifies how to resolve %URI references.
  }
{*< Full RFC conformance  }
{*< Treat %URI to resolve with identical scheme as having no scheme  }
type
  PUriResolutionOptionsEnum = ^TUriResolutionOptionsEnum;
  TUriResolutionOptionsEnum =  Longint;
  Const
    URI_RESOLVE_STRICTLY = 0;
    URI_RESOLVE_IDENTICAL_SCHEME_COMPAT = 1 shl 0;
;
  TUriResolutionOptions = TUriResolutionOptionsEnum;
  PUriResolutionOptions = ^TUriResolutionOptions;
{*< @copydoc UriResolutionOptionsEnum  }
{*
 * Wraps a memory manager backend that only provides malloc and free
 * to make a complete memory manager ready to be used.
 *
 * The core feature of this wrapper is that you don't need to implement
 * realloc if you don't want to.  The wrapped memory manager uses
 * backend->malloc, memcpy, and backend->free and soieof(size_t) extra
 * bytes per allocation to emulate fallback realloc for you.
 *
 * memory->calloc is uriEmulateCalloc.
 * memory->free uses backend->free and handles the size header.
 * memory->malloc uses backend->malloc and adds a size header.
 * memory->realloc uses memory->malloc, memcpy, and memory->free and reads
 *                 the size header.
 * memory->reallocarray is uriEmulateReallocarray.
 *
 * The internal workings behind memory->free, memory->malloc, and
 * memory->realloc may change so the functions exposed by these function
 * pointer sshould be consided internal and not public API.
 *
 * @param memory   <b>OUT</b>: Where to write the wrapped memory manager to
 * @param backend  <b>IN</b>: Memory manager to use as a backend
 * @return          Error code or 0 on success
 *
 * @see uriEmulateCalloc
 * @see uriEmulateReallocarray
 * @see UriMemoryManager
 * @since 0.9.0
  }

function uriCompleteMemoryManager(memory:PUriMemoryManager; backend:PUriMemoryManager):longint;cdecl;external luriparser;
{*
 * Offers emulation of calloc(3) based on memory->malloc and memset.
 * See "man 3 calloc" as well.
 *
 * @param memory  <b>IN</b>: Memory manager to use, should not be NULL
 * @param nmemb   <b>IN</b>: Number of elements to allocate
 * @param size    <b>IN</b>: Size in bytes per element
 * @return        Pointer to allocated memory or NULL
 *
 * @see uriCompleteMemoryManager
 * @see uriEmulateReallocarray
 * @see UriMemoryManager
 * @since 0.9.0
  }
function uriEmulateCalloc(memory:PUriMemoryManager; nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external luriparser;
{*
 * Offers emulation of reallocarray(3) based on memory->realloc.
 * See "man 3 reallocarray" as well.
 *
 * @param memory  <b>IN</b>: Memory manager to use, should not be NULL
 * @param ptr     <b>IN</b>: Pointer allocated using memory->malloc/... or NULL
 * @param nmemb   <b>IN</b>: Number of elements to allocate
 * @param size    <b>IN</b>: Size in bytes per element
 * @return        Pointer to allocated memory or NULL
 *
 * @see uriCompleteMemoryManager
 * @see uriEmulateCalloc
 * @see UriMemoryManager
 * @since 0.9.0
  }
function uriEmulateReallocarray(memory:PUriMemoryManager; ptr:pointer; nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external luriparser;
{*
 * Run multiple tests against a given memory manager.
 * For example, one test
 * 1. allocates a small amount of memory,
 * 2. writes some magic bytes to it,
 * 3. reallocates it,
 * 4. checks that previous values are still present,
 * 5. and frees that memory.
 *
 * It is recommended to compile with AddressSanitizer enabled
 * to take full advantage of uriTestMemoryManager.
 *
 * @param memory  <b>IN</b>: Memory manager to use, should not be NULL
 * @return        Error code or 0 on success
 *
 * @see uriEmulateCalloc
 * @see uriEmulateReallocarray
 * @see UriMemoryManager
 * @since 0.9.0
  }
function uriTestMemoryManager(memory:PUriMemoryManager):longint;cdecl;external luriparser;
{$endif}
{ URI_BASE_H  }

// === Konventiert am: 31-5-26 19:32:57 ===


implementation


{ was #define dname def_expr }
function URI_VER_SUFFIX_UNICODE : longint; { return type might be wrong }
  begin
    URI_VER_SUFFIX_UNICODE:=URI_ANSI_TO_UNICODE(URI_VER_SUFFIX_ANSI);
  end;


end.

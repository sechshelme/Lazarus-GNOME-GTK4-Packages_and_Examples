unit apr_general;

interface

uses
  fp_apr;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_GENERAL_H}
{$define APR_GENERAL_H}
{*
 * @file apr_general.h
 * This is collection of oddballs that didn't fit anywhere else,
 * and might move to more appropriate headers with the release
 * of APR 1.0.
 * @brief APR Miscellaneous library routines
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_errno.h"}
{$if APR_HAVE_SIGNAL_H}
{$include <signal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_general Miscellaneous library routines
 * @ingroup APR 
 * This is collection of oddballs that didn't fit anywhere else,
 * and might move to more appropriate headers with the release
 * of APR 1.0.
 * @
  }
{* FALSE  }
{$ifndef FALSE}

const
  FALSE = 0;  
{$endif}
{* TRUE  }
{$ifndef TRUE}

const
  TRUE =  not (_FALSE);  
{$endif}
{* a space  }

const
  APR_ASCII_BLANK = '\040';  
{* a carrige return  }
  APR_ASCII_CR = '\015';  
{* a line feed  }
  APR_ASCII_LF = '\012';  
{* a tab  }
  APR_ASCII_TAB = '\011';  
{* signal numbers typedef  }
type
  Papr_signum_t = ^Tapr_signum_t;
  Tapr_signum_t = longint;
{*
 * Finding offsets of elements within structures.
 * Taken from the X code... they've sweated portability of this stuff
 * so we don't have to.  Sigh...
 * @param p_type pointer type name
 * @param field  data field within the structure pointed to
 * @return offset
  }
{$if defined(CRAY) || (defined(__arm) && !(defined(LINUX) || defined(__FreeBSD__)))}
{$ifdef __STDC__}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function APR_OFFSET(p_type,field : longint) : longint;

{$else}
{$ifdef CRAY2}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function APR_OFFSET(p_type,field : longint) : longint;

{$else}
{ !CRAY2  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function APR_OFFSET(p_type,field : longint) : dword;

{$endif}
{ !CRAY2  }
{$endif}
{ __STDC__  }
{$else}
{ ! (CRAY || __arm)  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function APR_OFFSET(p_type,field : longint) : longint;

{$endif}
{ !CRAY  }
{*
 * Finding offsets of elements within structures.
 * @param s_type structure type name
 * @param field  data field within the structure
 * @return offset
  }
{$ifndef DOXYGEN}
{ A couple of prototypes for functions in case some platform doesn't 
 * have it
  }

function strcasecmp(a:Pchar; b:Pchar):longint;cdecl;external libapr;
function strncasecmp(a:Pchar; b:Pchar; n:Tsize_t):longint;cdecl;external libapr;
{$if (!APR_HAVE_MEMCHR)}

function memchr(s:pointer; c:longint; n:Tsize_t):pointer;cdecl;external libapr;
{$endif}
{* @  }
{*
 * @defgroup apr_library Library initialization and termination
 * @
  }
{*
 * Setup any APR internal data structures.  This MUST be the first function 
 * called for any APR library. It is safe to call apr_initialize several
 * times as long as apr_terminate() is called the same number of times.
 * @remark See apr_app_initialize() if this is an application, rather than
 * a library consumer of apr.
  }

function apr_initialize:Tapr_status_t;cdecl;external libapr;
{*
 * Set up an application with normalized argc, argv (and optionally env) in
 * order to deal with platform-specific oddities, such as Win32 services,
 * code pages and signals.  This must be the first function called for any
 * APR program.
 * @param argc Pointer to the argc that may be corrected
 * @param argv Pointer to the argv that may be corrected
 * @param env Pointer to the env that may be corrected, may be NULL
 * @remark See apr_initialize() if this is a library consumer of apr.
 * Otherwise, this call is identical to apr_initialize(), and must be closed
 * with a call to apr_terminate() at the end of program execution.
  }
function apr_app_initialize(argc:Plongint; argv:PPPchar; env:PPPchar):Tapr_status_t;cdecl;external libapr;
{*
 * Tear down any APR internal data structures which aren't torn down 
 * automatically. apr_terminate must be called once for every call to
 * apr_initialize() or apr_app_initialize().
 * @remark An APR program must call this function at termination once it 
 *         has stopped using APR services.  The APR developers suggest using
 *         @c atexit(apr_terminate) to ensure this is called.  When using APR
 *         from a language other than C that has problems with the calling
 *         convention, use apr_terminate2() instead.
 * @see apr_terminate2
  }
procedure apr_terminate;cdecl;external libapr;
{*
 * Tear down any APR internal data structures which aren't torn down 
 * automatically, same as apr_terminate()
 * @remark An APR program must call either the apr_terminate() or apr_terminate2
 *         function once it it has finished using APR services.  The APR 
 *         developers suggest using @c atexit(apr_terminate) to ensure this is done.
 *         apr_terminate2 exists to allow non-c language apps to tear down apr, 
 *         while apr_terminate() is recommended from c language applications.
  }
procedure apr_terminate2;cdecl;external libapr;
{* @  }
{*
 * @defgroup apr_random Random Functions
 * @
  }
{$if APR_HAS_RANDOM || defined(DOXYGEN)}
{ TODO: I'm not sure this is the best place to put this prototype... }
{*
 * Generate random bytes.
 * @param buf Buffer to fill with random bytes
 * @param length Length of buffer in bytes
  }

function apr_generate_random_bytes(buf:Pbyte; length:Tapr_size_t):Tapr_status_t;cdecl;external libapr;
{$endif}
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_GENERAL_H  }

// === Konventiert am: 10-9-26 16:37:23 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function APR_OFFSET(p_type,field : longint) : longint;
begin
  APR_OFFSET:=_Offsetof(p_type,field);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function APR_OFFSET(p_type,field : longint) : longint;
begin
  APR_OFFSET:=(sizeof(longint))*(dword(@((Tp_type(NULL))^.field)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function APR_OFFSET(p_type,field : longint) : dword;
begin
  APR_OFFSET:=dword(@((Tp_type(NULL))^.field));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function APR_OFFSET(p_type,field : longint) : longint;
begin
  APR_OFFSET:=longint((Pchar(@((Tp_type(NULL))^.field)))-(Pchar(NULL)));
end;


end.

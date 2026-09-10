
unit apr_lib;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_lib.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_lib.h
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
Papr_size_t  = ^apr_size_t;
Papr_vformatter_buff_t  = ^apr_vformatter_buff_t;
Pchar  = ^char;
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
{$ifndef APR_LIB_H}
{$define APR_LIB_H}
{*
 * @file apr_lib.h
 * This is collection of oddballs that didn't fit anywhere else,
 * and might move to more appropriate headers with the release
 * of APR 1.0.
 * @brief APR general purpose library routines
  }
{$include "apr.h"}
{$include "apr_errno.h"}
{$if APR_HAVE_CTYPE_H}
{$include <ctype.h>}
{$endif}
{$if APR_HAVE_STDARG_H}
{$include <stdarg.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_lib General Purpose Library Routines
 * @ingroup APR 
 * This is collection of oddballs that didn't fit anywhere else,
 * and might move to more appropriate headers with the release
 * of APR 1.0.
 * @
  }
{* A constant representing a 'large' string.  }

const
  HUGE_STRING_LEN = 8192;  
{
 * Define the structures used by the APR general-purpose library.
  }
{* @see apr_vformatter_buff_t  }
type
{*
 * Structure used by the variable-formatter routines.
  }
{* The current position  }
{* The end position of the format string  }
  Papr_vformatter_buff_t = ^Tapr_vformatter_buff_t;
  Tapr_vformatter_buff_t = record
      curpos : Pchar;
      endpos : Pchar;
    end;

{*
 * return the final element of the pathname
 * @param pathname The path to get the final element of
 * @return the final element of the path
 * @remark
 * <PRE>
 * For example:
 *                 "/foo/bar/gum"    -> "gum"
 *                 "/foo/bar/gum/"   -> ""
 *                 "gum"             -> "gum"
 *                 "bs\\path\\stuff" -> "stuff"
 * </PRE>
  }
(* Const before type ignored *)
(* Const before type ignored *)

function apr_filepath_name_get(pathname:Pchar):Pchar;cdecl;external;
{*
 * apr_killpg
 * Small utility macros to make things easier to read.  Not usually a
 * goal, to be sure..
  }
{*
 * apr_vformatter() is a generic printf-style formatting routine
 * with some extensions.
 * @param flush_func The function to call when the buffer is full
 * @param c The buffer to write to
 * @param fmt The format string
 * @param ap The arguments to use to fill out the format string.
 *
 * @remark
 * <PRE>
 * The extensions are:
 *
 * - %%pA takes a struct in_addr *, and prints it as a.b.c.d
 * - %%pI takes an apr_sockaddr_t * and prints it as a.b.c.d:port or
 * \[ipv6-address\]:port
 * - %%pT takes an apr_os_thread_t * and prints it in decimal
 * ('0' is printed if !APR_HAS_THREADS)
 * - %%pt takes an apr_os_thread_t * and prints it in hexadecimal
 * ('0' is printed if !APR_HAS_THREADS)
 * - %%pm takes an apr_status_t * and prints the appropriate error
 * string (from apr_strerror) corresponding to that error code.
 * - %%pp takes a void * and outputs it in hex
 * - %%pB takes a apr_uint32_t * as bytes and outputs it's apr_strfsize
 * - %%pF same as above, but takes a apr_off_t *
 * - %%pS same as above, but takes a apr_size_t *
 *
 * %%pA, %%pI, %%pT, %%pp are available from APR 1.0.0 onwards (and in 0.9.x).
 * %%pt is only available from APR 1.2.0 onwards.
 * %%pm, %%pB, %%pF and %%pS are only available from APR 1.3.0 onwards.
 *
 * The %%p hacks are to force gcc's printf warning code to skip
 * over a pointer argument without complaining.  This does
 * mean that the ANSI-style %%p (output a void * in hex format) won't
 * work as expected at all, but that seems to be a fair trade-off
 * for the increased robustness of having printf-warnings work.
 *
 * Additionally, apr_vformatter allows for arbitrary output methods
 * using the apr_vformatter_buff and flush_func.
 *
 * The apr_vformatter_buff has two elements curpos and endpos.
 * curpos is where apr_vformatter will write the next byte of output.
 * It proceeds writing output to curpos, and updating curpos, until
 * either the end of output is reached, or curpos == endpos (i.e. the
 * buffer is full).
 *
 * If the end of output is reached, apr_vformatter returns the
 * number of bytes written.
 *
 * When the buffer is full, the flush_func is called.  The flush_func
 * can return -1 to indicate that no further output should be attempted,
 * and apr_vformatter will return immediately with -1.  Otherwise
 * the flush_func should flush the buffer in whatever manner is
 * appropriate, re apr_pool_t nitialize curpos and endpos, and return 0.
 *
 * Note that flush_func is only invoked as a result of attempting to
 * write another byte at curpos when curpos >= endpos.  So for
 * example, it's possible when the output exactly matches the buffer
 * space available that curpos == endpos will be true when
 * apr_vformatter returns.
 *
 * apr_vformatter does not call out to any other code, it is entirely
 * self-contained.  This allows the callers to do things which are
 * otherwise "unsafe".  For example, apr_psprintf uses the "scratch"
 * space at the unallocated end of a block, and doesn't actually
 * complete the allocation until apr_vformatter returns.  apr_psprintf
 * would be completely broken if apr_vformatter were to call anything
 * that used this same pool.  Similarly http_bprintf() uses the "scratch"
 * space at the end of its output buffer, and doesn't actually note
 * that the space is in use until it either has to flush the buffer
 * or until apr_vformatter returns.
 * </PRE>
  }
(* Const before type ignored *)
function apr_vformatter(flush_func:function (b:Papr_vformatter_buff_t):longint; c:Papr_vformatter_buff_t; fmt:Pchar; ap:Tva_list):longint;cdecl;external;
{*
 * Display a prompt and read in the password from stdin.
 * @param prompt The prompt to display
 * @param pwbuf Buffer to store the password
 * @param bufsize The length of the password buffer.
 * @remark If the password entered must be truncated to fit in
 * the provided buffer, APR_ENAMETOOLONG will be returned.
 * Note that the bufsize paramater is passed by reference for no
 * reason; its value will never be modified by the apr_password_get()
 * function.
  }
(* Const before type ignored *)
function apr_password_get(prompt:Pchar; pwbuf:Pchar; bufsize:Papr_size_t):Tapr_status_t;cdecl;external;
{* @  }
{*
 * @defgroup apr_ctype ctype functions
 * These macros allow correct support of 8-bit characters on systems which
 * support 8-bit characters.  Pretty dumb how the cast is required, but
 * that's legacy libc for ya.  These new macros do not support EOF like
 * the standard macros do.  Tough.
 * @
  }
{* @see isalnum  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isalnum(c : longint) : longint;

{* @see isalpha  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isalpha(c : longint) : longint;

{* @see iscntrl  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_iscntrl(c : longint) : longint;

{* @see isdigit  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isdigit(c : longint) : longint;

{* @see isgraph  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isgraph(c : longint) : longint;

{* @see islower }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_islower(c : longint) : longint;

{* @see isascii  }
{$ifdef isascii}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isascii(c : longint) : longint;

{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function apr_isascii(c : longint) : longint;

{$endif}
{* @see isprint  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function apr_isprint(c : longint) : longint;

{* @see ispunct  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_ispunct(c : longint) : longint;

{* @see isspace  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isspace(c : longint) : longint;

{* @see isupper  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isupper(c : longint) : longint;

{* @see isxdigit  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isxdigit(c : longint) : longint;

{* @see tolower  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_tolower(c : longint) : longint;

{* @see toupper  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_toupper(c : longint) : longint;

{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_LIB_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isalnum(c : longint) : longint;
begin
  apr_isalnum:=isalnum(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isalpha(c : longint) : longint;
begin
  apr_isalpha:=isalpha(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_iscntrl(c : longint) : longint;
begin
  apr_iscntrl:=iscntrl(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isdigit(c : longint) : longint;
begin
  apr_isdigit:=isdigit(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isgraph(c : longint) : longint;
begin
  apr_isgraph:=isgraph(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_islower(c : longint) : longint;
begin
  apr_islower:=islower(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isascii(c : longint) : longint;
begin
  apr_isascii:=isascii(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isascii(c : longint) : longint;
begin
  apr_isascii:=(Tc(@( not ($7f))))=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isprint(c : longint) : longint;
begin
  apr_isprint:=isprint(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_ispunct(c : longint) : longint;
begin
  apr_ispunct:=ispunct(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isspace(c : longint) : longint;
begin
  apr_isspace:=isspace(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isupper(c : longint) : longint;
begin
  apr_isupper:=isupper(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_isxdigit(c : longint) : longint;
begin
  apr_isxdigit:=isxdigit(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_tolower(c : longint) : longint;
begin
  apr_tolower:=tolower(byte(c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function apr_toupper(c : longint) : longint;
begin
  apr_toupper:=toupper(byte(c));
end;


end.

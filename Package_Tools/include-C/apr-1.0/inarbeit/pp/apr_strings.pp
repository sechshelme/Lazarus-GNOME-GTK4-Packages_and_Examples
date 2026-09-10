
unit apr_strings;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_strings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_strings.h
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
Papr_off_t  = ^apr_off_t;
Papr_pool_t  = ^apr_pool_t;
Papr_size_t  = ^apr_size_t;
Pchar  = ^char;
Piovec  = ^iovec;
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
{ Portions of this file are covered by  }
{ -*- mode: c; c-file-style: "k&r" -*-

  strnatcmp.c -- Perform 'natural order' comparisons of strings in C.
  Copyright (C) 2000 by Martin Pool <mbp@humbug.org.au>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
 }
{$ifndef APR_STRINGS_H}
{$define APR_STRINGS_H}
{*
 * @file apr_strings.h
 * @brief APR Strings library
  }
{$include "apr.h"}
{$include "apr_errno.h"}
{$include "apr_pools.h"}
{$define APR_WANT_IOVEC}
{$include "apr_want.h"}
{$if APR_HAVE_STDARG_H}
{$include <stdarg.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_strings String routines
 * @ingroup APR 
 * @
  }
{*
 * Do a natural order comparison of two strings.
 * @param a The first string to compare
 * @param b The second string to compare
 * @return Either <0, 0, or >0.  If the first string is less than the second
 *          this returns <0, if they are equivalent it returns 0, and if the
 *          first string is greater than second string it retuns >0.
  }
(* Const before declarator ignored *)
(* Const before declarator ignored *)

function apr_strnatcmp(a:Pchar; b:Pchar):longint;cdecl;external;
{*
 * Do a natural order comparison of two strings ignoring the case of the 
 * strings.
 * @param a The first string to compare
 * @param b The second string to compare
 * @return Either <0, 0, or >0.  If the first string is less than the second
 *         this returns <0, if they are equivalent it returns 0, and if the
 *         first string is greater than second string it retuns >0.
  }
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function apr_strnatcasecmp(a:Pchar; b:Pchar):longint;cdecl;external;
{*
 * duplicate a string into memory allocated out of a pool
 * @param p The pool to allocate out of
 * @param s The string to duplicate
 * @return The new string or NULL if s == NULL
  }
(* Const before type ignored *)
function apr_pstrdup(p:Papr_pool_t; s:Pchar):Pchar;cdecl;external;
{*
 * Create a null-terminated string by making a copy of a sequence
 * of characters and appending a null byte
 * @param p The pool to allocate out of
 * @param s The block of characters to duplicate
 * @param n The number of characters to duplicate
 * @return The new string or NULL if s == NULL
 * @remark This is a faster alternative to apr_pstrndup(), for use
 *         when you know that the string being duplicated really
 *         has 'n' or more characters.  If the string might contain
 *         fewer characters, use apr_pstrndup().
  }
(* Const before type ignored *)
function apr_pstrmemdup(p:Papr_pool_t; s:Pchar; n:Tapr_size_t):Pchar;cdecl;external;
{*
 * Duplicate at most n characters of a string into memory allocated 
 * out of a pool; the new string will be NUL-terminated
 * @param p The pool to allocate out of
 * @param s The string to duplicate
 * @param n The maximum number of characters to duplicate
 * @return The new string or NULL if s == NULL
 * @remark The amount of memory allocated from the pool is the length
 *         of the returned string including the NUL terminator
  }
(* Const before type ignored *)
function apr_pstrndup(p:Papr_pool_t; s:Pchar; n:Tapr_size_t):Pchar;cdecl;external;
{*
 * Duplicate a block of memory.
 *
 * @param p The pool to allocate from
 * @param m The memory to duplicate
 * @param n The number of bytes to duplicate
 * @return The new block of memory or NULL if m == NULL
  }
(* Const before type ignored *)
function apr_pmemdup(p:Papr_pool_t; m:pointer; n:Tapr_size_t):pointer;cdecl;external;
{*
 * Concatenate multiple strings, allocating memory out a pool
 * @param p The pool to allocate out of
 * @param ... The strings to concatenate.  The final string must be NULL
 * @return The new string
  }
function apr_pstrcat(p:Papr_pool_t; args:array of const):Pchar;cdecl;external;
function apr_pstrcat(p:Papr_pool_t):Pchar;cdecl;external;
{*
 * Concatenate multiple strings specified in a writev-style vector
 * @param p The pool from which to allocate
 * @param vec The strings to concatenate
 * @param nvec The number of strings to concatenate
 * @param nbytes (output) strlen of new string (pass in NULL to omit)
 * @return The new string
  }
(* Const before type ignored *)
function apr_pstrcatv(p:Papr_pool_t; vec:Piovec; nvec:Tapr_size_t; nbytes:Papr_size_t):Pchar;cdecl;external;
{*
 * printf-style style printing routine.  The data is output to a string 
 * allocated from a pool
 * @param p The pool to allocate out of
 * @param fmt The format of the string
 * @param ap The arguments to use while printing the data
 * @return The new string
  }
(* Const before type ignored *)
function apr_pvsprintf(p:Papr_pool_t; fmt:Pchar; ap:Tva_list):Pchar;cdecl;external;
{*
 * printf-style style printing routine.  The data is output to a string 
 * allocated from a pool
 * @param p The pool to allocate out of
 * @param fmt The format of the string
 * @param ... The arguments to use while printing the data
 * @return The new string
  }
(* Const before type ignored *)
function apr_psprintf(p:Papr_pool_t; fmt:Pchar; args:array of const):Pchar;cdecl;external;
function apr_psprintf(p:Papr_pool_t; fmt:Pchar):Pchar;cdecl;external;
{*
 * Copy up to dst_size characters from src to dst; does not copy
 * past a NUL terminator in src, but always terminates dst with a NUL
 * regardless.
 * @param dst The destination string
 * @param src The source string
 * @param dst_size The space available in dst; dst always receives
 *                 NUL termination, so if src is longer than
 *                 dst_size, the actual number of characters copied is
 *                 dst_size - 1.
 * @return Pointer to the NUL terminator of the destination string, dst
 * @remark
 * <PRE>
 * Note the differences between this function and strncpy():
 *  1) strncpy() doesn't always NUL terminate; apr_cpystrn() does.
 *  2) strncpy() pads the destination string with NULs, which is often 
 *     unnecessary; apr_cpystrn() does not.
 *  3) strncpy() returns a pointer to the beginning of the dst string;
 *     apr_cpystrn() returns a pointer to the NUL terminator of dst, 
 *     to allow a check for truncation.
 * </PRE>
  }
(* Const before type ignored *)
function apr_cpystrn(dst:Pchar; src:Pchar; dst_size:Tapr_size_t):Pchar;cdecl;external;
{*
 * Remove all whitespace from a string
 * @param dest The destination string.  It is okay to modify the string
 *             in place.  Namely dest == src
 * @param src The string to rid the spaces from.
 * @return A pointer to the destination string's null terminator.
  }
(* Const before type ignored *)
function apr_collapse_spaces(dest:Pchar; src:Pchar):Pchar;cdecl;external;
{*
 * Convert the arguments to a program from one string to an array of 
 * strings terminated by a NULL pointer
 * @param arg_str The arguments to convert
 * @param argv_out Output location.  This is a pointer to an array of strings.
 * @param token_context Pool to use.
  }
(* Const before type ignored *)
function apr_tokenize_to_argv(arg_str:Pchar; argv_out:PPPchar; token_context:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Split a string into separate null-terminated tokens.  The tokens are 
 * delimited in the string by one or more characters from the sep
 * argument.
 * @param str The string to separate; this should be specified on the
 *            first call to apr_strtok() for a given string, and NULL
 *            on subsequent calls.
 * @param sep The set of delimiters
 * @param last State saved by apr_strtok() between calls.
 * @return The next token from the string
 * @note the 'last' state points to the trailing NUL char of the final
 * token, otherwise it points to the character following the current
 * token (all successive or empty occurances of sep are skiped on the
 * subsequent call to apr_strtok).  Therefore it is possible to avoid
 * a strlen() determination, with the following logic;
 * toklen = last - retval; if (*last) --toklen;
  }
(* Const before type ignored *)
function apr_strtok(str:Pchar; sep:Pchar; last:PPchar):Pchar;cdecl;external;
{*
 * @defgroup APR_Strings_Snprintf snprintf implementations
 * @warning
 * These are snprintf implementations based on apr_vformatter().
 *
 * Note that various standards and implementations disagree on the return
 * value of snprintf, and side-effects due to %n in the formatting string.
 * apr_snprintf (and apr_vsnprintf) behaves as follows:
 *
 * Process the format string until the entire string is exhausted, or
 * the buffer fills.  If the buffer fills then stop processing immediately
 * (so no further %n arguments are processed), and return the buffer
 * length.  In all cases the buffer is NUL terminated. It will return the
 * number of characters inserted into the buffer, not including the
 * terminating NUL. As a special case, if len is 0, apr_snprintf will
 * return the number of characters that would have been inserted if
 * the buffer had been infinite (in this case, *buffer can be NULL)
 *
 * In no event does apr_snprintf return a negative number.
 * @
  }
{*
 * snprintf routine based on apr_vformatter.  This means it understands the
 * same extensions.
 * @param buf The buffer to write to
 * @param len The size of the buffer
 * @param format The format string
 * @param ... The arguments to use to fill out the format string.
  }
(* Const before type ignored *)
function apr_snprintf(buf:Pchar; len:Tapr_size_t; format:Pchar; args:array of const):longint;cdecl;external;
function apr_snprintf(buf:Pchar; len:Tapr_size_t; format:Pchar):longint;cdecl;external;
{*
 * vsnprintf routine based on apr_vformatter.  This means it understands the
 * same extensions.
 * @param buf The buffer to write to
 * @param len The size of the buffer
 * @param format The format string
 * @param ap The arguments to use to fill out the format string.
  }
(* Const before type ignored *)
function apr_vsnprintf(buf:Pchar; len:Tapr_size_t; format:Pchar; ap:Tva_list):longint;cdecl;external;
{* @  }
{*
 * create a string representation of an int, allocated from a pool
 * @param p The pool from which to allocate
 * @param n The number to format
 * @return The string representation of the number
  }
function apr_itoa(p:Papr_pool_t; n:longint):Pchar;cdecl;external;
{*
 * create a string representation of a long, allocated from a pool
 * @param p The pool from which to allocate
 * @param n The number to format
 * @return The string representation of the number
  }
function apr_ltoa(p:Papr_pool_t; n:longint):Pchar;cdecl;external;
{*
 * create a string representation of an apr_off_t, allocated from a pool
 * @param p The pool from which to allocate
 * @param n The number to format
 * @return The string representation of the number
  }
function apr_off_t_toa(p:Papr_pool_t; n:Tapr_off_t):Pchar;cdecl;external;
{*
 * Convert a numeric string into an apr_off_t numeric value.
 * @param offset The value of the parsed string.
 * @param buf The string to parse. It may contain optional whitespace,
 *   followed by an optional '+' (positive, default) or '-' (negative)
 *   character, followed by an optional '0x' prefix if base is 0 or 16,
 *   followed by numeric digits appropriate for base.
 * @param end A pointer to the end of the valid character in buf. If
 *   not NULL, it is set to the first invalid character in buf.
 * @param base A numeric base in the range between 2 and 36 inclusive,
 *   or 0.  If base is zero, buf will be treated as base ten unless its
 *   digits are prefixed with '0x', in which case it will be treated as
 *   base 16.
 * @bug *end breaks type safety; where *buf is const, *end needs to be
 * declared as const in APR 2.0
  }
(* Const before type ignored *)
function apr_strtoff(offset:Papr_off_t; buf:Pchar; end:PPchar; base:longint):Tapr_status_t;cdecl;external;
{*
 * parse a numeric string into a 64-bit numeric value
 * @param buf The string to parse. It may contain optional whitespace,
 *   followed by an optional '+' (positive, default) or '-' (negative)
 *   character, followed by an optional '0x' prefix if base is 0 or 16,
 *   followed by numeric digits appropriate for base.
 * @param end A pointer to the end of the valid character in buf. If
 *   not NULL, it is set to the first invalid character in buf.
 * @param base A numeric base in the range between 2 and 36 inclusive,
 *   or 0.  If base is zero, buf will be treated as base ten unless its
 *   digits are prefixed with '0x', in which case it will be treated as
 *   base 16.
 * @return The numeric value of the string.  On overflow, errno is set
 * to ERANGE.  On success, errno is set to 0.
  }
(* Const before type ignored *)
function apr_strtoi64(buf:Pchar; end:PPchar; base:longint):Tapr_int64_t;cdecl;external;
{*
 * parse a base-10 numeric string into a 64-bit numeric value.
 * Equivalent to apr_strtoi64(buf, (char**)NULL, 10).
 * @param buf The string to parse
 * @return The numeric value of the string.  On overflow, errno is set
 * to ERANGE.  On success, errno is set to 0.
  }
(* Const before type ignored *)
function apr_atoi64(buf:Pchar):Tapr_int64_t;cdecl;external;
{*
 * Format a binary size (magnitiudes are 2^10 rather than 10^3) from an apr_off_t,
 * as bytes, K, M, T, etc, to a four character compacted human readable string.
 * @param size The size to format
 * @param buf The 5 byte text buffer (counting the trailing null)
 * @return The buf passed to apr_strfsize()
 * @remark All negative sizes report '  - ', apr_strfsize only formats positive values.
  }
function apr_strfsize(size:Tapr_off_t; buf:Pchar):Pchar;cdecl;external;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ !APR_STRINGS_H  }

implementation


end.

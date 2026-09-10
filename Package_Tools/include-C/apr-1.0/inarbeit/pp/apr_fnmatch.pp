
unit apr_fnmatch;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_fnmatch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_fnmatch.h
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
Papr_array_header_t  = ^apr_array_header_t;
Papr_pool_t  = ^apr_pool_t;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 1992, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 *	@(#)fnmatch.h	8.1 (Berkeley) 6/2/93
  }
{ This file has been modified by the Apache Software Foundation.  }
{$ifndef	_APR_FNMATCH_H_}
{$define _APR_FNMATCH_H_}
{*
 * @file apr_fnmatch.h
 * @brief APR FNMatch Functions
  }
{$include "apr_errno.h"}
{$include "apr_tables.h"}
{ C++ extern C conditionnal removed }
{*
 * @defgroup apr_fnmatch Filename Matching Functions
 * @ingroup APR 
 * @
  }
{*< Match failed.  }

const
  APR_FNM_NOMATCH = 1;  
{*< Disable backslash escaping.  }
  APR_FNM_NOESCAPE = $01;  
{*< Slash must be matched by slash.  }
  APR_FNM_PATHNAME = $02;  
{*< Period must be matched by period.  }
  APR_FNM_PERIOD = $04;  
{*< Compare characters case-insensitively.  }
  APR_FNM_CASE_BLIND = $08;  
{*
 * Try to match the string to the given pattern, return APR_SUCCESS if
 *    match, else return APR_FNM_NOMATCH.  Note that there is no such thing as
 *    an illegal pattern.
 *
 * With all flags unset, a pattern is interpreted as such:
 *
 * PATTERN: Backslash followed by any character, including another
 *          backslash.<br/>
 * MATCHES: That character exactly.
 * 
 * <p>
 * PATTERN: ?<br/>
 * MATCHES: Any single character.
 * </p>
 * 
 * <p>
 * PATTERN: *<br/>
 * MATCHES: Any sequence of zero or more characters. (Note that multiple
 *          *s in a row are equivalent to one.)
 * 
 * PATTERN: Any character other than \?*[ or a \ at the end of the pattern<br/>
 * MATCHES: That character exactly. (Case sensitive.)
 * 
 * PATTERN: [ followed by a class description followed by ]<br/>
 * MATCHES: A single character described by the class description.
 *          (Never matches, if the class description reaches until the
 *          end of the string without a ].) If the first character of
 *          the class description is ^ or !, the sense of the description
 *          is reversed.  The rest of the class description is a list of
 *          single characters or pairs of characters separated by -. Any
 *          of those characters can have a backslash in front of them,
 *          which is ignored; this lets you use the characters ] and -
 *          in the character class, as well as ^ and ! at the
 *          beginning.  The pattern matches a single character if it
 *          is one of the listed characters or falls into one of the
 *          listed ranges (inclusive, case sensitive).  Ranges with
 *          the first character larger than the second are legal but
 *          never match. Edge cases: [] never matches, and [^] and [!]
 *          always match without consuming a character.
 * 
 * Note that these patterns attempt to match the entire string, not
 * just find a substring matching the pattern.
 *
 * @param pattern The pattern to match to
 * @param strings The string we are trying to match
 * @param flags flags to use in the match.  Bitwise OR of:
 * <pre>
 *              APR_FNM_NOESCAPE       Disable backslash escaping
 *              APR_FNM_PATHNAME       Slash must be matched by slash
 *              APR_FNM_PERIOD         Period must be matched by period
 *              APR_FNM_CASE_BLIND     Compare characters case-insensitively.
 * </pre>
  }
(* Const before type ignored *)
(* Const before type ignored *)

function apr_fnmatch(pattern:Pchar; strings:Pchar; flags:longint):Tapr_status_t;cdecl;external;
{*
 * Determine if the given pattern is a regular expression.
 * @param pattern The pattern to search for glob characters.
 * @return non-zero if pattern has any glob characters in it
  }
(* Const before type ignored *)
function apr_fnmatch_test(pattern:Pchar):longint;cdecl;external;
{*
 * Find all files that match a specified pattern in a directory.
 * @param dir_pattern The pattern to use for finding files, appended
 * to the search directory.  The pattern is anything following the
 * final forward or backward slash in the parameter.  If no slash
 * is found, the current directory is searched.
 * @param result Array to use when storing the results
 * @param p The pool to use.
 * @return APR_SUCCESS if no processing errors occurred, APR error
 * code otherwise
 * @remark The returned array may be empty even if APR_SUCCESS was
 * returned.
  }
(* Const before type ignored *)
function apr_match_glob(dir_pattern:Pchar; result:PPapr_array_header_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ !_APR_FNMATCH_H_  }

implementation


end.

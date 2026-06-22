unit gstrfuncs;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_STRFUNCS_H__}
{$define __G_STRFUNCS_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <stdarg.h>}
{$include <string.h>}
{$include <glib/gmacros.h>}
{$include <glib/gtypes.h>}
{$include <glib/gerror.h>}
{$include <glib/gmem.h>}
{ Functions like the ones in <ctype.h> that are not affected by locale.  }
type
  PGAsciiType = ^TGAsciiType;
  TGAsciiType =  Longint;
  Const
    G_ASCII_ALNUM = 1 shl 0;
    G_ASCII_ALPHA = 1 shl 1;
    G_ASCII_CNTRL = 1 shl 2;
    G_ASCII_DIGIT = 1 shl 3;
    G_ASCII_GRAPH = 1 shl 4;
    G_ASCII_LOWER = 1 shl 5;
    G_ASCII_PRINT = 1 shl 6;
    G_ASCII_PUNCT = 1 shl 7;
    G_ASCII_SPACE = 1 shl 8;
    G_ASCII_UPPER = 1 shl 9;
    G_ASCII_XDIGIT = 1 shl 10;
;
  var
    g_ascii_table : Pguint16;cvar;external libglib2;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function g_ascii_isalnum(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isalpha(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_iscntrl(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isdigit(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isgraph(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_islower(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isprint(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_ispunct(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isspace(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isupper(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isxdigit(klass : longint) : longint;

function g_ascii_tolower(c:Tgchar):Tgchar;cdecl;external libglib2;
function g_ascii_toupper(c:Tgchar):Tgchar;cdecl;external libglib2;
function g_ascii_digit_value(c:Tgchar):Tgint;cdecl;external libglib2;
function g_ascii_xdigit_value(c:Tgchar):Tgint;cdecl;external libglib2;
{ String utility functions that modify a string argument or
 * return a constant string that must not be freed.
  }
const
  G_STR_DELIMITERS = '_-|> <.';  

function g_strdelimit(_string:Pgchar; delimiters:Pgchar; new_delimiter:Tgchar):Pgchar;cdecl;external libglib2;
function g_strcanon(_string:Pgchar; valid_chars:Pgchar; substitutor:Tgchar):Pgchar;cdecl;external libglib2;
function g_strerror(errnum:Tgint):Pgchar;cdecl;external libglib2;
function g_strsignal(signum:Tgint):Pgchar;cdecl;external libglib2;
function g_strreverse(_string:Pgchar):Pgchar;cdecl;external libglib2;
function g_strlcpy(dest:Pgchar; src:Pgchar; dest_size:Tgsize):Tgsize;cdecl;external libglib2;
function g_strlcat(dest:Pgchar; src:Pgchar; dest_size:Tgsize):Tgsize;cdecl;external libglib2;
function g_strstr_len(haystack:Pgchar; haystack_len:Tgssize; needle:Pgchar):Pgchar;cdecl;external libglib2;
function g_strrstr(haystack:Pgchar; needle:Pgchar):Pgchar;cdecl;external libglib2;
function g_strrstr_len(haystack:Pgchar; haystack_len:Tgssize; needle:Pgchar):Pgchar;cdecl;external libglib2;
function g_str_has_suffix(str:Pgchar; suffix:Pgchar):Tgboolean;cdecl;external libglib2;
function g_str_has_prefix(str:Pgchar; prefix:Pgchar):Tgboolean;cdecl;external libglib2;
function g_strtod(nptr:Pgchar; endptr:PPgchar):Tgdouble;cdecl;external libglib2;
function g_ascii_strtod(nptr:Pgchar; endptr:PPgchar):Tgdouble;cdecl;external libglib2;
function g_ascii_strtoull(nptr:Pgchar; endptr:PPgchar; base:Tguint):Tguint64;cdecl;external libglib2;
function g_ascii_strtoll(nptr:Pgchar; endptr:PPgchar; base:Tguint):Tgint64;cdecl;external libglib2;
{ 29 bytes should enough for all possible values that
 * g_ascii_dtostr can produce.
 * Then add 10 for good measure  }
const
  G_ASCII_DTOSTR_BUF_SIZE = 29+10;  

function g_ascii_dtostr(buffer:Pgchar; buf_len:Tgint; d:Tgdouble):Pgchar;cdecl;external libglib2;
function g_ascii_formatd(buffer:Pgchar; buf_len:Tgint; format:Pgchar; d:Tgdouble):Pgchar;cdecl;external libglib2;
{ removes leading spaces  }
function g_strchug(_string:Pgchar):Pgchar;cdecl;external libglib2;
{ removes trailing spaces  }
function g_strchomp(_string:Pgchar):Pgchar;cdecl;external libglib2;
{ removes leading & trailing spaces  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_strstrip(_string : longint) : longint;

function g_ascii_strcasecmp(s1:Pgchar; s2:Pgchar):Tgint;cdecl;external libglib2;
function g_ascii_strncasecmp(s1:Pgchar; s2:Pgchar; n:Tgsize):Tgint;cdecl;external libglib2;
function g_ascii_strdown(str:Pgchar; len:Tgssize):Pgchar;cdecl;external libglib2;
function g_ascii_strup(str:Pgchar; len:Tgssize):Pgchar;cdecl;external libglib2;
function g_str_is_ascii(str:Pgchar):Tgboolean;cdecl;external libglib2;
function g_strcasecmp(s1:Pgchar; s2:Pgchar):Tgint;cdecl;external libglib2;
function g_strncasecmp(s1:Pgchar; s2:Pgchar; n:Tguint):Tgint;cdecl;external libglib2;
function g_strdown(_string:Pgchar):Pgchar;cdecl;external libglib2;
function g_strup(_string:Pgchar):Pgchar;cdecl;external libglib2;
{ String utility functions that return a newly allocated string which
 * ought to be freed with g_free from the caller at some point.
  }
function g_strdup(str:Pgchar):Pgchar;cdecl;external libglib2;
function g_strdup_printf(format:Pgchar; args:array of const):Pgchar;cdecl;external libglib2;
function g_strdup_printf(format:Pgchar):Pgchar;cdecl;external libglib2;
function g_strdup_vprintf(format:Pgchar; args:Tva_list):Pgchar;cdecl;external libglib2;
function g_strndup(str:Pgchar; n:Tgsize):Pgchar;cdecl;external libglib2;
function g_strnfill(length:Tgsize; fill_char:Tgchar):Pgchar;cdecl;external libglib2;
function g_strconcat(string1:Pgchar; args:array of const):Pgchar;cdecl;external libglib2;
function g_strconcat(string1:Pgchar):Pgchar;cdecl;external libglib2;
function g_strjoin(separator:Pgchar; args:array of const):Pgchar;cdecl;external libglib2;
function g_strjoin(separator:Pgchar):Pgchar;cdecl;external libglib2;
function g_strcompress(source:Pgchar):Pgchar;cdecl;external libglib2;
function g_strescape(source:Pgchar; exceptions:Pgchar):Pgchar;cdecl;external libglib2;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_68_FOR (g_memdup2) }
function g_memdup(mem:Tgconstpointer; byte_size:Tguint):Tgpointer;cdecl;external libglib2;
{(2); }
function g_memdup2(mem:Tgconstpointer; byte_size:Tgsize):Tgpointer;cdecl;external libglib2;
{(2); }
{ NULL terminated string arrays.
 * g_strsplit(), g_strsplit_set() split up string into max_tokens tokens
 * at delim and return a newly allocated string array.
 * g_strjoinv() concatenates all of str_array's strings, sliding in an
 * optional separator, the returned string is newly allocated.
 * g_strfreev() frees the array itself and all of its strings.
 * g_strdupv() copies a NULL-terminated array of strings
 * g_strv_length() returns the length of a NULL-terminated array of strings
  }
type
  PGStrv = ^TGStrv;
  TGStrv = ^Pgchar;

function g_strsplit(_string:Pgchar; delimiter:Pgchar; max_tokens:Tgint):^Pgchar;cdecl;external libglib2;
function g_strsplit_set(_string:Pgchar; delimiters:Pgchar; max_tokens:Tgint):^Pgchar;cdecl;external libglib2;
function g_strjoinv(separator:Pgchar; str_array:PPgchar):Pgchar;cdecl;external libglib2;
procedure g_strfreev(str_array:PPgchar);cdecl;external libglib2;
function g_strdupv(str_array:PPgchar):^Pgchar;cdecl;external libglib2;
function g_strv_length(str_array:PPgchar):Tguint;cdecl;external libglib2;
function g_stpcpy(dest:Pgchar; src:Pchar):Pgchar;cdecl;external libglib2;
function g_str_to_ascii(str:Pgchar; from_locale:Pgchar):Pgchar;cdecl;external libglib2;
function g_str_tokenize_and_fold(_string:Pgchar; translit_locale:Pgchar; ascii_alternates:PPPgchar):^Pgchar;cdecl;external libglib2;
function g_str_match_string(search_term:Pgchar; potential_hit:Pgchar; accept_alternates:Tgboolean):Tgboolean;cdecl;external libglib2;
function g_strv_contains(strv:PPgchar; str:Pgchar):Tgboolean;cdecl;external libglib2;
function g_strv_equal(strv1:PPgchar; strv2:PPgchar):Tgboolean;cdecl;external libglib2;
{ Convenience ASCII string to number API  }
{*
 * GNumberParserError:
 * @G_NUMBER_PARSER_ERROR_INVALID: string was not a valid number
 * @G_NUMBER_PARSER_ERROR_OUT_OF_BOUNDS: string was a number, but out of bounds
 *
 * Error codes returned by functions converting a string to a number.
 *
 * Since: 2.54
  }
type
  PGNumberParserError = ^TGNumberParserError;
  TGNumberParserError =  Longint;
  Const
    G_NUMBER_PARSER_ERROR_INVALID = 0;
    G_NUMBER_PARSER_ERROR_OUT_OF_BOUNDS = 1;
;
{*
 * G_NUMBER_PARSER_ERROR:
 *
 * Domain for errors returned by functions converting a string to a
 * number.
 *
 * Since: 2.54
  }

{ was #define dname def_expr }
function G_NUMBER_PARSER_ERROR : longint; { return type might be wrong }

function g_number_parser_error_quark:TGQuark;cdecl;external libglib2;
function g_ascii_string_to_signed(str:Pgchar; base:Tguint; min:Tgint64; max:Tgint64; out_num:Pgint64; 
           error:PPGError):Tgboolean;cdecl;external libglib2;
function g_ascii_string_to_unsigned(str:Pgchar; base:Tguint; min:Tguint64; max:Tguint64; out_num:Pguint64; 
           error:PPGError):Tgboolean;cdecl;external libglib2;
{*xxxxxxxxxx
GLIB_AVAILABLE_STATIC_INLINE_IN_2_76
static inline gboolean g_set_str (char       **str_pointer,
                                  const char  *new_str);

GLIB_AVAILABLE_STATIC_INLINE_IN_2_76
static inline gboolean
g_set_str (char       **str_pointer,
           const char  *new_str)

  char *copy;

  if (*str_pointer == new_str ||
      (*str_pointer && new_str && strcmp (*str_pointer, new_str) == 0))
    return FALSE;

  copy = g_strdup (new_str);
  g_free (*str_pointer);
  *str_pointer = copy;

  return TRUE;

  }
{$endif}
{ __G_STRFUNCS_H__  }

// === Konventiert am: 22-6-26 19:23:05 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isalnum(klass : longint) : longint;
begin
  g_ascii_isalnum:=((g_ascii_table[Tguchar(c)]) and G_ASCII_ALNUM)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isalpha(klass : longint) : longint;
begin
  g_ascii_isalpha:=((g_ascii_table[Tguchar(c)]) and G_ASCII_ALPHA)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_iscntrl(klass : longint) : longint;
begin
  g_ascii_iscntrl:=((g_ascii_table[Tguchar(c)]) and G_ASCII_CNTRL)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isdigit(klass : longint) : longint;
begin
  g_ascii_isdigit:=((g_ascii_table[Tguchar(c)]) and G_ASCII_DIGIT)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isgraph(klass : longint) : longint;
begin
  g_ascii_isgraph:=((g_ascii_table[Tguchar(c)]) and G_ASCII_GRAPH)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_islower(klass : longint) : longint;
begin
  g_ascii_islower:=((g_ascii_table[Tguchar(c)]) and G_ASCII_LOWER)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isprint(klass : longint) : longint;
begin
  g_ascii_isprint:=((g_ascii_table[Tguchar(c)]) and G_ASCII_PRINT)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_ispunct(klass : longint) : longint;
begin
  g_ascii_ispunct:=((g_ascii_table[Tguchar(c)]) and G_ASCII_PUNCT)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isspace(klass : longint) : longint;
begin
  g_ascii_isspace:=((g_ascii_table[Tguchar(c)]) and G_ASCII_SPACE)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isupper(klass : longint) : longint;
begin
  g_ascii_isupper:=((g_ascii_table[Tguchar(c)]) and G_ASCII_UPPER)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_ascii_isxdigit(klass : longint) : longint;
begin
  g_ascii_isxdigit:=((g_ascii_table[Tguchar(c)]) and G_ASCII_XDIGIT)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_strstrip(_string : longint) : longint;
begin
  g_strstrip:=g_strchomp(g_strchug(_string));
end;

{ was #define dname def_expr }
function G_NUMBER_PARSER_ERROR : longint; { return type might be wrong }
  begin
    G_NUMBER_PARSER_ERROR:=g_number_parser_error_quark;
  end;


end.

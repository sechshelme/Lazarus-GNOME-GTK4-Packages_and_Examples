
unit bson_string;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_string.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_string.h
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
Pbson_string_t  = ^bson_string_t;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$include <bson/bson-prelude.h>}
{$ifndef BSON_STRING_H}
{$define BSON_STRING_H}
{$include <stdarg.h>}
{$include <bson/bson-macros.h>}
{$include <bson/bson-types.h>}
type
  Pbson_string_t = ^Tbson_string_t;
  Tbson_string_t = record
      str : Pchar;
      len : Tuint32_t;
      alloc : Tuint32_t;
    end;
(* Const before type ignored *)

function bson_string_new(str:Pchar):Pbson_string_t;cdecl;external;
function bson_string_free(_string:Pbson_string_t; free_segment:Tbool):Pchar;cdecl;external;
(* Const before type ignored *)
procedure bson_string_append(_string:Pbson_string_t; str:Pchar);cdecl;external;
procedure bson_string_append_c(_string:Pbson_string_t; str:char);cdecl;external;
procedure bson_string_append_unichar(_string:Pbson_string_t; unichar:Tbson_unichar_t);cdecl;external;
(* Const before type ignored *)
procedure bson_string_append_printf(_string:Pbson_string_t; format:Pchar; args:array of const);cdecl;external;
procedure bson_string_append_printf(_string:Pbson_string_t; format:Pchar);cdecl;external;
procedure bson_string_truncate(_string:Pbson_string_t; len:Tuint32_t);cdecl;external;
(* Const before type ignored *)
function bson_strdup(str:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function bson_strdup_printf(format:Pchar; args:array of const):Pchar;cdecl;external;
function bson_strdup_printf(format:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function bson_strdupv_printf(format:Pchar; args:Tva_list):Pchar;cdecl;external;
(* Const before type ignored *)
function bson_strndup(str:Pchar; n_bytes:Tsize_t):Pchar;cdecl;external;
(* Const before type ignored *)
procedure bson_strncpy(dst:Pchar; src:Pchar; size:Tsize_t);cdecl;external;
(* Const before type ignored *)
function bson_vsnprintf(str:Pchar; size:Tsize_t; format:Pchar; ap:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function bson_snprintf(str:Pchar; size:Tsize_t; format:Pchar; args:array of const):longint;cdecl;external;
function bson_snprintf(str:Pchar; size:Tsize_t; format:Pchar):longint;cdecl;external;
procedure bson_strfreev(strv:PPchar);cdecl;external;
(* Const before type ignored *)
function bson_strnlen(s:Pchar; maxlen:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function bson_ascii_strtoll(str:Pchar; endptr:PPchar; base:longint):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bson_strcasecmp(s1:Pchar; s2:Pchar):longint;cdecl;external;
function bson_isspace(c:longint):Tbool;cdecl;external;
{$endif}
{ BSON_STRING_H  }

implementation


end.

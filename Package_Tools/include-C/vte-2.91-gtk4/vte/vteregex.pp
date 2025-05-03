
unit vteregex;
interface

{
  Automatically converted by H2Pas 1.0.0 from vteregex.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vteregex.h
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
PGError  = ^GError;
Pgsize  = ^gsize;
PVteRegex  = ^VteRegex;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2015 Christian Persch
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__VTE_VTE_H_INSIDE__) && !defined (VTE_COMPILATION)}
{$error "Only <vte/vte.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <glib-object.h>}
{$include "vtemacros.h"}
type

{ was #define dname def_expr }
function VTE_TYPE_REGEX : longint; { return type might be wrong }

function vte_regex_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function VTE_REGEX_ERROR : longint; { return type might be wrong }

function vte_regex_error_quark:TGQuark;cdecl;external;
{ This is PCRE2_NO_UTF_CHECK | PCRE2_UTF | PCRE2_NEVER_BACKSLASH_C  }
const
  VTE_REGEX_FLAGS_DEFAULT = ($00080000 or $40000000) or $00100000;  

function vte_regex_ref(regex:PVteRegex):PVteRegex;cdecl;external;
function vte_regex_unref(regex:PVteRegex):PVteRegex;cdecl;external;
(* Const before type ignored *)
function vte_regex_new_for_match(pattern:Pchar; pattern_length:Tgssize; flags:Tguint32; error:PPGError):PVteRegex;cdecl;external;
(* Const before declarator ignored *)
function vte_regex_new_for_match_full(pattern:Pchar; pattern_length:Tgssize; flags:Tuint32_t; extra_flags:Tuint32_t; error_offset:Pgsize; 
           error:PPGError):PVteRegex;cdecl;external;
(* Const before type ignored *)
function vte_regex_new_for_search(pattern:Pchar; pattern_length:Tgssize; flags:Tguint32; error:PPGError):PVteRegex;cdecl;external;
(* Const before declarator ignored *)
function vte_regex_new_for_search_full(pattern:Pchar; pattern_length:Tgssize; flags:Tuint32_t; extra_flags:Tuint32_t; error_offset:Pgsize; 
           error:PPGError):PVteRegex;cdecl;external;
function vte_regex_jit(regex:PVteRegex; flags:Tguint32; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vte_regex_substitute(regex:PVteRegex; subject:Pchar; replacement:Pchar; flags:Tguint32; error:PPGError):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function VTE_TYPE_REGEX : longint; { return type might be wrong }
  begin
    VTE_TYPE_REGEX:=vte_regex_get_type;
  end;

{ was #define dname def_expr }
function VTE_REGEX_ERROR : longint; { return type might be wrong }
  begin
    VTE_REGEX_ERROR:=vte_regex_error_quark;
  end;


end.

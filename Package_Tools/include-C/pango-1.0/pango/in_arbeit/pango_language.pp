
unit pango_language;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_language.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_language.h
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
Plongint  = ^longint;
PPangoLanguage  = ^PangoLanguage;
PPangoScript  = ^PangoScript;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-language.h: Language handling routines
 *
 * Copyright (C) 1999 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_LANGUAGE_H__}
{$define __PANGO_LANGUAGE_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <pango/pango-types.h>}
{$include <pango/pango-version-macros.h>}
{$include <pango/pango-script.h>}

{ was #define dname def_expr }
function PANGO_TYPE_LANGUAGE : longint; { return type might be wrong }

function pango_language_get_type:TGType;cdecl;external;
function pango_language_get_default:PPangoLanguage;cdecl;external;
function pango_language_get_preferred:^PPangoLanguage;cdecl;external;
(* Const before type ignored *)
function pango_language_from_string(language:Pchar):PPangoLanguage;cdecl;external;
(* Const before type ignored *)
function pango_language_to_string(language:PPangoLanguage):Pchar;cdecl;external;
{ For back compat.  Will have to keep indefinitely.  }
(* Const before type ignored *)
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function pango_language_to_string(language : longint) : Pchar;

(* Const before type ignored *)
function pango_language_get_sample_string(language:PPangoLanguage):Pchar;cdecl;external;
(* Const before type ignored *)
function pango_language_matches(language:PPangoLanguage; range_list:Pchar):Tgboolean;cdecl;external;
function pango_language_includes_script(language:PPangoLanguage; script:TPangoScript):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pango_language_get_scripts(language:PPangoLanguage; num_scripts:Plongint):PPangoScript;cdecl;external;
{$endif}
{ __PANGO_LANGUAGE_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_LANGUAGE : longint; { return type might be wrong }
  begin
    PANGO_TYPE_LANGUAGE:=pango_language_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function pango_language_to_string(language : longint) : Pchar;
begin
  pango_language_to_string:=Pchar(language);
end;


end.


unit as_branding;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_branding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_branding.h
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
PAsBranding  = ^AsBranding;
PAsBrandingClass  = ^AsBrandingClass;
PAsBrandingColorIter  = ^AsBrandingColorIter;
PAsColorKind  = ^AsColorKind;
PAsColorSchemeKind  = ^AsColorSchemeKind;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2022-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$ifndef __AS_BRANDING_H}
{$define __AS_BRANDING_H}
{$include <glib-object.h>}

{ was #define dname def_expr }
function AS_TYPE_BRANDING : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsBranding, as_branding, AS, BRANDING, GObject) }
{< private > }
type
  PAsBrandingClass = ^TAsBrandingClass;
  TAsBrandingClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{< private > }

  PAsBrandingColorIter = ^TAsBrandingColorIter;
  TAsBrandingColorIter = record
      dummy1 : Tgpointer;
      dummy2 : Tguint;
      dummy3 : Tgpointer;
      dummy4 : Tgpointer;
      dummy5 : Tgpointer;
      dummy6 : Tgpointer;
    end;
{*
 * AsColorKind:
 * @AS_COLOR_KIND_UNKNOWN:	Color type invalid or not known
 * @AS_COLOR_KIND_PRIMARY:	Primary accent color
 *
 * A branding color type.
 * }
{< private > }

  PAsColorKind = ^TAsColorKind;
  TAsColorKind =  Longint;
  Const
    AS_COLOR_KIND_UNKNOWN = 0;
    AS_COLOR_KIND_PRIMARY = 1;
    AS_COLOR_KIND_LAST = 2;
;
{*
 * AsColorSchemeKind:
 * @AS_COLOR_SCHEME_KIND_UNKNOWN:	Color scheme invalid or not known
 * @AS_COLOR_SCHEME_KIND_LIGHT:		A light color scheme
 * @AS_COLOR_SCHEME_KIND_DARK:		A dark color scheme
 *
 * A color scheme type.
 * }
{< private > }
type
  PAsColorSchemeKind = ^TAsColorSchemeKind;
  TAsColorSchemeKind =  Longint;
  Const
    AS_COLOR_SCHEME_KIND_UNKNOWN = 0;
    AS_COLOR_SCHEME_KIND_LIGHT = 1;
    AS_COLOR_SCHEME_KIND_DARK = 2;
    AS_COLOR_SCHEME_KIND_LAST = 3;
;
(* Const before type ignored *)

function as_color_kind_to_string(kind:TAsColorKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_color_kind_from_string(str:Pgchar):TAsColorKind;cdecl;external;
(* Const before type ignored *)
function as_color_scheme_kind_to_string(kind:TAsColorSchemeKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_color_scheme_kind_from_string(str:Pgchar):TAsColorSchemeKind;cdecl;external;
function as_branding_new:PAsBranding;cdecl;external;
(* Const before type ignored *)
procedure as_branding_set_color(branding:PAsBranding; kind:TAsColorKind; scheme_preference:TAsColorSchemeKind; colorcode:Pgchar);cdecl;external;
procedure as_branding_remove_color(branding:PAsBranding; kind:TAsColorKind; scheme_preference:TAsColorSchemeKind);cdecl;external;
procedure as_branding_color_iter_init(iter:PAsBrandingColorIter; branding:PAsBranding);cdecl;external;
(* Const before type ignored *)
function as_branding_color_iter_next(iter:PAsBrandingColorIter; kind:PAsColorKind; scheme_preference:PAsColorSchemeKind; value:PPgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function as_branding_get_color(branding:PAsBranding; kind:TAsColorKind; scheme_kind:TAsColorSchemeKind):Pgchar;cdecl;external;
{$endif}
{ __AS_BRANDING_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_BRANDING : longint; { return type might be wrong }
  begin
    AS_TYPE_BRANDING:=as_branding_get_type;
  end;


end.

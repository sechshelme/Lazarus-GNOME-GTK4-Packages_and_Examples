
unit as_bundle;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_bundle.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_bundle.h
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
PAsBundle  = ^AsBundle;
PAsBundleClass  = ^AsBundleClass;
PAsBundleKind  = ^AsBundleKind;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2016-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_BUNDLE_H}
{$define __AS_BUNDLE_H}
{$include <glib-object.h>}

{ was #define dname def_expr }
function AS_TYPE_BUNDLE : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsBundle, as_bundle, AS, BUNDLE, GObject) }
{< private > }
type
  PAsBundleClass = ^TAsBundleClass;
  TAsBundleClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsBundleKind:
 * @AS_BUNDLE_KIND_UNKNOWN:	Type invalid or not known
 * @AS_BUNDLE_KIND_PACKAGE:	A native package (currently not used)
 * @AS_BUNDLE_KIND_LIMBA:	A Limba bundle
 * @AS_BUNDLE_KIND_FLATPAK:	A Flatpak bundle
 * @AS_BUNDLE_KIND_APPIMAGE:	An AppImageKit bundle
 * @AS_BUNDLE_KIND_SNAP:	A Snap/Snappy bundle
 * @AS_BUNDLE_KIND_TARBALL:	A (maybe compressed) tarball.
 * @AS_BUNDLE_KIND_CABINET:	Cabinet firmware deployment
 * @AS_BUNDLE_KIND_LINGLONG:	A Linglong bundle
 *
 * The bundle type.
 * }
{< private > }

  PAsBundleKind = ^TAsBundleKind;
  TAsBundleKind =  Longint;
  Const
    AS_BUNDLE_KIND_UNKNOWN = 0;
    AS_BUNDLE_KIND_PACKAGE = 1;
    AS_BUNDLE_KIND_LIMBA = 2;
    AS_BUNDLE_KIND_FLATPAK = 3;
    AS_BUNDLE_KIND_APPIMAGE = 4;
    AS_BUNDLE_KIND_SNAP = 5;
    AS_BUNDLE_KIND_TARBALL = 6;
    AS_BUNDLE_KIND_CABINET = 7;
    AS_BUNDLE_KIND_LINGLONG = 8;
    AS_BUNDLE_KIND_LAST = 9;
;
(* Const before type ignored *)

function as_bundle_kind_to_string(kind:TAsBundleKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function as_bundle_kind_from_string(bundle_str:Pgchar):TAsBundleKind;cdecl;external;
function as_bundle_new:PAsBundle;cdecl;external;
function as_bundle_get_kind(bundle:PAsBundle):TAsBundleKind;cdecl;external;
procedure as_bundle_set_kind(bundle:PAsBundle; kind:TAsBundleKind);cdecl;external;
(* Const before type ignored *)
function as_bundle_get_id(bundle:PAsBundle):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_bundle_set_id(bundle:PAsBundle; id:Pgchar);cdecl;external;
{$endif}
{ __AS_BUNDLE_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_BUNDLE : longint; { return type might be wrong }
  begin
    AS_TYPE_BUNDLE:=as_bundle_get_type;
  end;


end.

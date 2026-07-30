
unit as_category;
interface

{
  Automatically converted by H2Pas 1.0.0 from as_category.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    as_category
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
PAsCategory  = ^AsCategory;
PAsCategoryClass  = ^AsCategoryClass;
PAsComponent  = ^AsComponent;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012-2024 Matthias Klumpp <matthias@tenstral.net>
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
{$ifndef __AS_CATEGORY_H}
{$define __AS_CATEGORY_H}
{$include <glib-object.h>}
type

{ was #define dname def_expr }
function AS_TYPE_CATEGORY : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AsCategory, as_category, AS, CATEGORY, GObject) }
{< private > }
type
  PAsCategoryClass = ^TAsCategoryClass;
  TAsCategoryClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
    end;


function as_category_new:PAsCategory;cdecl;external;
(* Const before type ignored *)
function as_category_get_id(category:PAsCategory):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_category_set_id(category:PAsCategory; id:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_category_get_name(category:PAsCategory):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_category_set_name(category:PAsCategory; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_category_get_summary(category:PAsCategory):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_category_set_summary(category:PAsCategory; value:Pgchar);cdecl;external;
(* Const before type ignored *)
function as_category_get_icon(category:PAsCategory):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure as_category_set_icon(category:PAsCategory; value:Pgchar);cdecl;external;
function as_category_get_children(category:PAsCategory):PGPtrArray;cdecl;external;
function as_category_has_children(category:PAsCategory):Tgboolean;cdecl;external;
procedure as_category_add_child(category:PAsCategory; subcat:PAsCategory);cdecl;external;
procedure as_category_remove_child(category:PAsCategory; subcat:PAsCategory);cdecl;external;
function as_category_get_desktop_groups(category:PAsCategory):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure as_category_add_desktop_group(category:PAsCategory; group_name:Pgchar);cdecl;external;
function as_category_get_components(category:PAsCategory):PGPtrArray;cdecl;external;
procedure as_category_add_component(category:PAsCategory; cpt:PAsComponent);cdecl;external;
function as_category_has_component(category:PAsCategory; cpt:PAsComponent):Tgboolean;cdecl;external;
function as_get_default_categories(with_special:Tgboolean):PGPtrArray;cdecl;external;
{$endif}
{ __AS_CATEGORY_H  }

implementation

{ was #define dname def_expr }
function AS_TYPE_CATEGORY : longint; { return type might be wrong }
  begin
    AS_TYPE_CATEGORY:=as_category_get_type;
  end;


end.

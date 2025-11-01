
unit cd_dom;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_dom.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_dom.h
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
PCdColorLab  = ^CdColorLab;
PCdColorRGB  = ^CdColorRGB;
PCdColorYxy  = ^CdColorYxy;
PCdDom  = ^CdDom;
PCdDomClass  = ^CdDomClass;
Pgchar  = ^gchar;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGNode  = ^GNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2013 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord.h> can be included directly."}
{$endif}
{$ifndef __CD_DOM_H}
{$define __CD_DOM_H}
{$include <glib-object.h>}
{$include "cd-color.h"}

{ was #define dname def_expr }
function CD_DOM_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_DOM_TYPE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_DOM : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdDom, cd_dom, CD, DOM, GObject) }
{< private > }
{ Padding for future expansion  }
type
  PCdDomClass = ^TCdDomClass;
  TCdDomClass = record
      parent_class : TGObjectClass;
      _cd_dom_reserved1 : procedure ;cdecl;
      _cd_dom_reserved2 : procedure ;cdecl;
      _cd_dom_reserved3 : procedure ;cdecl;
      _cd_dom_reserved4 : procedure ;cdecl;
      _cd_dom_reserved5 : procedure ;cdecl;
      _cd_dom_reserved6 : procedure ;cdecl;
      _cd_dom_reserved7 : procedure ;cdecl;
      _cd_dom_reserved8 : procedure ;cdecl;
    end;


function cd_dom_error_quark:TGQuark;cdecl;external;
function cd_dom_new:PCdDom;cdecl;external;
function cd_dom_to_string(dom:PCdDom):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_dom_parse_xml_data(dom:PCdDom; data:Pgchar; data_len:Tgssize; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cd_dom_get_node(dom:PCdDom; root:PGNode; path:Pgchar):PGNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_dom_get_node_name(node:PGNode):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_dom_get_node_data(node:PGNode):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_dom_get_node_data_as_int(node:PGNode):Tgint;cdecl;external;
(* Const before type ignored *)
function cd_dom_get_node_data_as_double(node:PGNode):Tgdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function cd_dom_get_node_attribute(node:PGNode; key:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_dom_get_node_rgb(node:PGNode; rgb:PCdColorRGB):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_dom_get_node_yxy(node:PGNode; yxy:PCdColorYxy):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_dom_get_node_lab(node:PGNode; lab:PCdColorLab):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cd_dom_get_node_localized(node:PGNode; key:Pgchar):PGHashTable;cdecl;external;
{$endif}
{ __CD_DOM_H  }

implementation

{ was #define dname def_expr }
function CD_DOM_ERROR : longint; { return type might be wrong }
  begin
    CD_DOM_ERROR:=cd_dom_error_quark;
  end;

{ was #define dname def_expr }
function CD_DOM_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_DOM_TYPE_ERROR:=cd_dom_error_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_DOM : longint; { return type might be wrong }
  begin
    CD_TYPE_DOM:=cd_dom_get_type;
  end;


end.

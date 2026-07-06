
unit gtkcssprovider;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcssprovider.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcssprovider.h
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
PGBytes  = ^GBytes;
PGFile  = ^GFile;
PGtkCssProvider  = ^GtkCssProvider;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2010 Carlos Garnacho <carlosg@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <gio/gio.h>}
{$include <gtk/css/gtkcss.h>}

{ was #define dname def_expr }
function GTK_TYPE_CSS_PROVIDER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CSS_PROVIDER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CSS_PROVIDER(o : longint) : longint;

type
  PGtkCssProvider = ^TGtkCssProvider;
  TGtkCssProvider = record
      parent_instance : TGObject;
    end;


function gtk_css_provider_get_type:TGType;cdecl;external;
function gtk_css_provider_new:PGtkCssProvider;cdecl;external;
function gtk_css_provider_to_string(provider:PGtkCssProvider):Pchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_css_provider_load_from_string) }
(* Const before type ignored *)
procedure gtk_css_provider_load_from_data(css_provider:PGtkCssProvider; data:Pchar; length:Tgssize);cdecl;external;
(* Const before type ignored *)
procedure gtk_css_provider_load_from_string(css_provider:PGtkCssProvider; _string:Pchar);cdecl;external;
procedure gtk_css_provider_load_from_bytes(css_provider:PGtkCssProvider; data:PGBytes);cdecl;external;
procedure gtk_css_provider_load_from_file(css_provider:PGtkCssProvider; file:PGFile);cdecl;external;
(* Const before type ignored *)
procedure gtk_css_provider_load_from_path(css_provider:PGtkCssProvider; path:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_css_provider_load_from_resource(css_provider:PGtkCssProvider; resource_path:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_css_provider_load_named(provider:PGtkCssProvider; name:Pchar; variant:Pchar);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCssProvider, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_CSS_PROVIDER : longint; { return type might be wrong }
  begin
    GTK_TYPE_CSS_PROVIDER:=gtk_css_provider_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_CSS_PROVIDER(o : longint) : longint;
begin
  GTK_CSS_PROVIDER:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_CSS_PROVIDER,GtkCssProvider);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_CSS_PROVIDER(o : longint) : longint;
begin
  GTK_IS_CSS_PROVIDER:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_CSS_PROVIDER);
end;


end.

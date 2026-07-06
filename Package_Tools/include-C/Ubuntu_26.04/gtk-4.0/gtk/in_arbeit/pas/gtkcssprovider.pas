unit gtkcssprovider;

interface

uses
  fp_glib2, fp_gtk4;

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

type
  PGtkCssProvider = ^TGtkCssProvider;
  TGtkCssProvider = record
      parent_instance : TGObject;
    end;


function gtk_css_provider_get_type:TGType;cdecl;external libgtk4;
function gtk_css_provider_new:PGtkCssProvider;cdecl;external libgtk4;
function gtk_css_provider_to_string(provider:PGtkCssProvider):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_css_provider_load_from_string) }
procedure gtk_css_provider_load_from_data(css_provider:PGtkCssProvider; data:Pchar; length:Tgssize);cdecl;external libgtk4;
procedure gtk_css_provider_load_from_string(css_provider:PGtkCssProvider; _string:Pchar);cdecl;external libgtk4;
procedure gtk_css_provider_load_from_bytes(css_provider:PGtkCssProvider; data:PGBytes);cdecl;external libgtk4;
procedure gtk_css_provider_load_from_file(css_provider:PGtkCssProvider; file:PGFile);cdecl;external libgtk4;
procedure gtk_css_provider_load_from_path(css_provider:PGtkCssProvider; path:Pchar);cdecl;external libgtk4;
procedure gtk_css_provider_load_from_resource(css_provider:PGtkCssProvider; resource_path:Pchar);cdecl;external libgtk4;
procedure gtk_css_provider_load_named(provider:PGtkCssProvider; name:Pchar; variant:Pchar);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkCssProvider, g_object_unref) }

// === Konventiert am: 6-7-26 14:08:35 ===

function GTK_TYPE_CSS_PROVIDER : TGType;
function GTK_CSS_PROVIDER(obj : Pointer) : PGtkCssProvider;
function GTK_IS_CSS_PROVIDER(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_CSS_PROVIDER : TGType;
  begin
    GTK_TYPE_CSS_PROVIDER:=gtk_css_provider_get_type;
  end;

function GTK_CSS_PROVIDER(obj : Pointer) : PGtkCssProvider;
begin
  Result := PGtkCssProvider(g_type_check_instance_cast(obj, GTK_TYPE_CSS_PROVIDER));
end;

function GTK_IS_CSS_PROVIDER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_CSS_PROVIDER);
end;



end.

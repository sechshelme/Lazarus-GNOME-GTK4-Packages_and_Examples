unit gtknative;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Red Hat, Inc.
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkwidget.h>}

{G_DECLARE_INTERFACE (GtkNative, gtk_native, GTK, NATIVE, GtkWidget) }
procedure gtk_native_realize(self:PGtkNative);cdecl;external libgtk4;
procedure gtk_native_unrealize(self:PGtkNative);cdecl;external libgtk4;
function gtk_native_get_for_surface(surface:PGdkSurface):PGtkNative;cdecl;external libgtk4;
function gtk_native_get_surface(self:PGtkNative):PGdkSurface;cdecl;external libgtk4;
function gtk_native_get_renderer(self:PGtkNative):PGskRenderer;cdecl;external libgtk4;
procedure gtk_native_get_surface_transform(self:PGtkNative; x:Pdouble; y:Pdouble);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:14:30 ===

function GTK_TYPE_NATIVE: TGType;
function GTK_NATIVE(obj: Pointer): PGtkNative;
function GTK_IS_NATIVE(obj: Pointer): Tgboolean;
function GTK_NATIVE_GET_IFACE(obj: Pointer): PGtkNativeInterface;

implementation

function GTK_TYPE_NATIVE: TGType;
begin
  Result := gtk_native_get_type;
end;

function GTK_NATIVE(obj: Pointer): PGtkNative;
begin
  Result := PGtkNative(g_type_check_instance_cast(obj, GTK_TYPE_NATIVE));
end;

function GTK_IS_NATIVE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_NATIVE);
end;

function GTK_NATIVE_GET_IFACE(obj: Pointer): PGtkNativeInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_NATIVE);
end;

type 
  PGtkNative = type Pointer;

  PGtkNativeInterface = type Pointer

function gtk_native_get_type: TGType; cdecl; external libgxxxxxxx;



end.

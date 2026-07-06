unit gtkroot;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkwidget.h>}

{G_DECLARE_INTERFACE (GtkRoot, gtk_root, GTK, ROOT, GtkWidget) }
function gtk_root_get_display(self:PGtkRoot):PGdkDisplay;cdecl;external libgtk4;
procedure gtk_root_set_focus(self:PGtkRoot; focus:PGtkWidget);cdecl;external libgtk4;
function gtk_root_get_focus(self:PGtkRoot):PGtkWidget;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:18:11 ===

function GTK_TYPE_ROOT: TGType;
function GTK_ROOT(obj: Pointer): PGtkRoot;
function GTK_IS_ROOT(obj: Pointer): Tgboolean;
function GTK_ROOT_GET_IFACE(obj: Pointer): PGtkRootInterface;

implementation

function GTK_TYPE_ROOT: TGType;
begin
  Result := gtk_root_get_type;
end;

function GTK_ROOT(obj: Pointer): PGtkRoot;
begin
  Result := PGtkRoot(g_type_check_instance_cast(obj, GTK_TYPE_ROOT));
end;

function GTK_IS_ROOT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ROOT);
end;

function GTK_ROOT_GET_IFACE(obj: Pointer): PGtkRootInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ROOT);
end;

type 
  PGtkRoot = type Pointer;

  PGtkRootInterface = type Pointer

function gtk_root_get_type: TGType; cdecl; external libgxxxxxxx;



end.

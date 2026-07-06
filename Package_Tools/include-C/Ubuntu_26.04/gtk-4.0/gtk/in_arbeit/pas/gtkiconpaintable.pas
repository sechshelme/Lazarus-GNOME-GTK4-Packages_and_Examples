unit gtkiconpaintable;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GtkIconPaintable
 * gtkiconpaintable.h Copyright (C) 2002, 2003 Red Hat, Inc.
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
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkenums.h>}

{G_DECLARE_FINAL_TYPE (GtkIconPaintable, gtk_icon_paintable, GTK, ICON_PAINTABLE, GObject) }
function gtk_icon_paintable_new_for_file(file:PGFile; size:longint; scale:longint):PGtkIconPaintable;cdecl;external libgtk4;
function gtk_icon_paintable_get_file(self:PGtkIconPaintable):PGFile;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_20 }
function gtk_icon_paintable_get_icon_name(self:PGtkIconPaintable):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_20 }
function gtk_icon_paintable_is_symbolic(self:PGtkIconPaintable):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:10:39 ===

function GTK_TYPE_ICON_PAINTABLE: TGType;
function GTK_ICON_PAINTABLE(obj: Pointer): PGtkIconPaintable;
function GTK_IS_ICON_PAINTABLE(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_ICON_PAINTABLE: TGType;
begin
  Result := gtk_icon_paintable_get_type;
end;

function GTK_ICON_PAINTABLE(obj: Pointer): PGtkIconPaintable;
begin
  Result := PGtkIconPaintable(g_type_check_instance_cast(obj, GTK_TYPE_ICON_PAINTABLE));
end;

function GTK_IS_ICON_PAINTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ICON_PAINTABLE);
end;

type 
  PGtkIconPaintable = type Pointer;

  TGtkIconPaintableClass = record
    parent_class: TGObjectClass;
  end;
  PGtkIconPaintableClass = ^TGtkIconPaintableClass;

function gtk_icon_paintable_get_type: TGType; cdecl; external libgxxxxxxx;



end.

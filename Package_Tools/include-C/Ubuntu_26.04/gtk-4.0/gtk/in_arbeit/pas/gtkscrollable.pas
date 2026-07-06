unit gtkscrollable;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkscrollable.h
 * Copyright (C) 2008 Tadej Borovšak <tadeboro@gmail.com>
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
{$include <gtk/gtktypes.h>}
{$include <gtk/gtkborder.h>}

type
{ Dummy  }
  PGtkScrollableInterface = ^TGtkScrollableInterface;
  TGtkScrollableInterface = record
      base_iface : TGTypeInterface;
      get_border : function (scrollable:PGtkScrollable; border:PGtkBorder):Tgboolean;cdecl;
    end;

{ Public API  }

function gtk_scrollable_get_type:TGType;cdecl;external libgtk4;
function gtk_scrollable_get_hadjustment(scrollable:PGtkScrollable):PGtkAdjustment;cdecl;external libgtk4;
procedure gtk_scrollable_set_hadjustment(scrollable:PGtkScrollable; hadjustment:PGtkAdjustment);cdecl;external libgtk4;
function gtk_scrollable_get_vadjustment(scrollable:PGtkScrollable):PGtkAdjustment;cdecl;external libgtk4;
procedure gtk_scrollable_set_vadjustment(scrollable:PGtkScrollable; vadjustment:PGtkAdjustment);cdecl;external libgtk4;
function gtk_scrollable_get_hscroll_policy(scrollable:PGtkScrollable):TGtkScrollablePolicy;cdecl;external libgtk4;
procedure gtk_scrollable_set_hscroll_policy(scrollable:PGtkScrollable; policy:TGtkScrollablePolicy);cdecl;external libgtk4;
function gtk_scrollable_get_vscroll_policy(scrollable:PGtkScrollable):TGtkScrollablePolicy;cdecl;external libgtk4;
procedure gtk_scrollable_set_vscroll_policy(scrollable:PGtkScrollable; policy:TGtkScrollablePolicy);cdecl;external libgtk4;
function gtk_scrollable_get_border(scrollable:PGtkScrollable; border:PGtkBorder):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkScrollable, g_object_unref) }

// === Konventiert am: 6-7-26 16:36:48 ===

function GTK_TYPE_SCROLLABLE : TGType;
function GTK_SCROLLABLE(obj : Pointer) : PGtkScrollable;
function GTK_IS_SCROLLABLE(obj : Pointer) : Tgboolean;
function GTK_SCROLLABLE_GET_IFACE(obj : Pointer) : PGtkScrollableInterface;

implementation

function GTK_TYPE_SCROLLABLE : TGType;
  begin
    GTK_TYPE_SCROLLABLE:=gtk_scrollable_get_type;
  end;

function GTK_SCROLLABLE(obj : Pointer) : PGtkScrollable;
begin
  Result := PGtkScrollable(g_type_check_instance_cast(obj, GTK_TYPE_SCROLLABLE));
end;

function GTK_IS_SCROLLABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SCROLLABLE);
end;

function GTK_SCROLLABLE_GET_IFACE(obj : Pointer) : PGtkScrollableInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_SCROLLABLE);
end;



end.

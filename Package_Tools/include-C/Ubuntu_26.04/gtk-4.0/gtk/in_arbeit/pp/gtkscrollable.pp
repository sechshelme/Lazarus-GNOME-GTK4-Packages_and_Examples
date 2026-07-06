
unit gtkscrollable;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkscrollable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkscrollable.h
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
PGtkAdjustment  = ^GtkAdjustment;
PGtkBorder  = ^GtkBorder;
PGtkScrollable  = ^GtkScrollable;
PGtkScrollableInterface  = ^GtkScrollableInterface;
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

{ was #define dname def_expr }
function GTK_TYPE_SCROLLABLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SCROLLABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SCROLLABLE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SCROLLABLE_GET_IFACE(inst : longint) : longint;

type
{ Dummy  }
  PGtkScrollableInterface = ^TGtkScrollableInterface;
  TGtkScrollableInterface = record
      base_iface : TGTypeInterface;
      get_border : function (scrollable:PGtkScrollable; border:PGtkBorder):Tgboolean;cdecl;
    end;

{ Public API  }

function gtk_scrollable_get_type:TGType;cdecl;external;
function gtk_scrollable_get_hadjustment(scrollable:PGtkScrollable):PGtkAdjustment;cdecl;external;
procedure gtk_scrollable_set_hadjustment(scrollable:PGtkScrollable; hadjustment:PGtkAdjustment);cdecl;external;
function gtk_scrollable_get_vadjustment(scrollable:PGtkScrollable):PGtkAdjustment;cdecl;external;
procedure gtk_scrollable_set_vadjustment(scrollable:PGtkScrollable; vadjustment:PGtkAdjustment);cdecl;external;
function gtk_scrollable_get_hscroll_policy(scrollable:PGtkScrollable):TGtkScrollablePolicy;cdecl;external;
procedure gtk_scrollable_set_hscroll_policy(scrollable:PGtkScrollable; policy:TGtkScrollablePolicy);cdecl;external;
function gtk_scrollable_get_vscroll_policy(scrollable:PGtkScrollable):TGtkScrollablePolicy;cdecl;external;
procedure gtk_scrollable_set_vscroll_policy(scrollable:PGtkScrollable; policy:TGtkScrollablePolicy);cdecl;external;
function gtk_scrollable_get_border(scrollable:PGtkScrollable; border:PGtkBorder):Tgboolean;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkScrollable, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_SCROLLABLE : longint; { return type might be wrong }
  begin
    GTK_TYPE_SCROLLABLE:=gtk_scrollable_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SCROLLABLE(obj : longint) : longint;
begin
  GTK_SCROLLABLE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_SCROLLABLE,GtkScrollable);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SCROLLABLE(obj : longint) : longint;
begin
  GTK_IS_SCROLLABLE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_SCROLLABLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SCROLLABLE_GET_IFACE(inst : longint) : longint;
begin
  GTK_SCROLLABLE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GTK_TYPE_SCROLLABLE,GtkScrollableInterface);
end;


end.

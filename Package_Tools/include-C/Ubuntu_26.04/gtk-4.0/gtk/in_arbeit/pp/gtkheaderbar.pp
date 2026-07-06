
unit gtkheaderbar;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkheaderbar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkheaderbar.h
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
PGtkHeaderBar  = ^GtkHeaderBar;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2013 Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_HEADER_BAR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_HEADER_BAR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_HEADER_BAR(obj : longint) : longint;

type

function gtk_header_bar_get_type:TGType;cdecl;external;
function gtk_header_bar_new:PGtkWidget;cdecl;external;
procedure gtk_header_bar_set_title_widget(bar:PGtkHeaderBar; title_widget:PGtkWidget);cdecl;external;
function gtk_header_bar_get_title_widget(bar:PGtkHeaderBar):PGtkWidget;cdecl;external;
procedure gtk_header_bar_pack_start(bar:PGtkHeaderBar; child:PGtkWidget);cdecl;external;
procedure gtk_header_bar_pack_end(bar:PGtkHeaderBar; child:PGtkWidget);cdecl;external;
procedure gtk_header_bar_remove(bar:PGtkHeaderBar; child:PGtkWidget);cdecl;external;
function gtk_header_bar_get_show_title_buttons(bar:PGtkHeaderBar):Tgboolean;cdecl;external;
procedure gtk_header_bar_set_show_title_buttons(bar:PGtkHeaderBar; setting:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure gtk_header_bar_set_decoration_layout(bar:PGtkHeaderBar; layout:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_header_bar_get_decoration_layout(bar:PGtkHeaderBar):Pchar;cdecl;external;
function gtk_header_bar_get_use_native_controls(bar:PGtkHeaderBar):Tgboolean;cdecl;external;
procedure gtk_header_bar_set_use_native_controls(bar:PGtkHeaderBar; setting:Tgboolean);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkHeaderBar, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_HEADER_BAR : longint; { return type might be wrong }
  begin
    GTK_TYPE_HEADER_BAR:=gtk_header_bar_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_HEADER_BAR(obj : longint) : longint;
begin
  GTK_HEADER_BAR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_HEADER_BAR,GtkHeaderBar);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_HEADER_BAR(obj : longint) : longint;
begin
  GTK_IS_HEADER_BAR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_HEADER_BAR);
end;


end.

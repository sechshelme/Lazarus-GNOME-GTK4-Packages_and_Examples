
unit gtkoverlay;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkoverlay.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkoverlay.h
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
PGtkOverlay  = ^GtkOverlay;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gtkoverlay.h
 * This file is part of gtk
 *
 * Copyright (C) 2011 - Ignacio Casal Quinteiro
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
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_OVERLAY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_OVERLAY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_OVERLAY(obj : longint) : longint;

type

function gtk_overlay_get_type:TGType;cdecl;external;
function gtk_overlay_new:PGtkWidget;cdecl;external;
procedure gtk_overlay_add_overlay(overlay:PGtkOverlay; widget:PGtkWidget);cdecl;external;
procedure gtk_overlay_remove_overlay(overlay:PGtkOverlay; widget:PGtkWidget);cdecl;external;
procedure gtk_overlay_set_child(overlay:PGtkOverlay; child:PGtkWidget);cdecl;external;
function gtk_overlay_get_child(overlay:PGtkOverlay):PGtkWidget;cdecl;external;
function gtk_overlay_get_measure_overlay(overlay:PGtkOverlay; widget:PGtkWidget):Tgboolean;cdecl;external;
procedure gtk_overlay_set_measure_overlay(overlay:PGtkOverlay; widget:PGtkWidget; measure:Tgboolean);cdecl;external;
function gtk_overlay_get_clip_overlay(overlay:PGtkOverlay; widget:PGtkWidget):Tgboolean;cdecl;external;
procedure gtk_overlay_set_clip_overlay(overlay:PGtkOverlay; widget:PGtkWidget; clip_overlay:Tgboolean);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkOverlay, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_OVERLAY : longint; { return type might be wrong }
  begin
    GTK_TYPE_OVERLAY:=gtk_overlay_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_OVERLAY(obj : longint) : longint;
begin
  GTK_OVERLAY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_OVERLAY,GtkOverlay);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_OVERLAY(obj : longint) : longint;
begin
  GTK_IS_OVERLAY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_OVERLAY);
end;


end.

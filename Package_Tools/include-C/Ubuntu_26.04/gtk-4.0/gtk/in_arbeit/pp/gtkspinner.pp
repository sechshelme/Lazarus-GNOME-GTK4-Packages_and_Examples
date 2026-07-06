
unit gtkspinner;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkspinner.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkspinner.h
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
PGtkSpinner  = ^GtkSpinner;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2007 John Stowers, Neil Jagdish Patel.
 * Copyright (C) 2009 Bastien Nocera, David Zeuthen
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Code adapted from egg-spinner
 * by Christian Hergert <christian.hergert@gmail.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_SPINNER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SPINNER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SPINNER(obj : longint) : longint;

type

function gtk_spinner_get_type:TGType;cdecl;external;
function gtk_spinner_new:PGtkWidget;cdecl;external;
procedure gtk_spinner_start(spinner:PGtkSpinner);cdecl;external;
procedure gtk_spinner_stop(spinner:PGtkSpinner);cdecl;external;
procedure gtk_spinner_set_spinning(spinner:PGtkSpinner; spinning:Tgboolean);cdecl;external;
function gtk_spinner_get_spinning(spinner:PGtkSpinner):Tgboolean;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSpinner, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_SPINNER : longint; { return type might be wrong }
  begin
    GTK_TYPE_SPINNER:=gtk_spinner_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SPINNER(obj : longint) : longint;
begin
  GTK_SPINNER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_SPINNER,GtkSpinner);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SPINNER(obj : longint) : longint;
begin
  GTK_IS_SPINNER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_SPINNER);
end;


end.

unit gtkspinner;

interface

uses
  fp_glib2, fp_gtk4;

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

type

function gtk_spinner_get_type:TGType;cdecl;external libgtk4;
function gtk_spinner_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_spinner_start(spinner:PGtkSpinner);cdecl;external libgtk4;
procedure gtk_spinner_stop(spinner:PGtkSpinner);cdecl;external libgtk4;
procedure gtk_spinner_set_spinning(spinner:PGtkSpinner; spinning:Tgboolean);cdecl;external libgtk4;
function gtk_spinner_get_spinning(spinner:PGtkSpinner):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSpinner, g_object_unref) }

// === Konventiert am: 6-7-26 17:10:09 ===

function GTK_TYPE_SPINNER : TGType;
function GTK_SPINNER(obj : Pointer) : PGtkSpinner;
function GTK_IS_SPINNER(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SPINNER : TGType;
  begin
    GTK_TYPE_SPINNER:=gtk_spinner_get_type;
  end;

function GTK_SPINNER(obj : Pointer) : PGtkSpinner;
begin
  Result := PGtkSpinner(g_type_check_instance_cast(obj, GTK_TYPE_SPINNER));
end;

function GTK_IS_SPINNER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SPINNER);
end;



end.

unit gtkexpander;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2003 Sun Microsystems, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *      Mark McLoughlin <mark@skynet.ie>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type

function gtk_expander_get_type:TGType;cdecl;external libgtk4;
function gtk_expander_new(_label:Pchar):PGtkWidget;cdecl;external libgtk4;
function gtk_expander_new_with_mnemonic(_label:Pchar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_expander_set_expanded(expander:PGtkExpander; expanded:Tgboolean);cdecl;external libgtk4;
function gtk_expander_get_expanded(expander:PGtkExpander):Tgboolean;cdecl;external libgtk4;
procedure gtk_expander_set_label(expander:PGtkExpander; _label:Pchar);cdecl;external libgtk4;
function gtk_expander_get_label(expander:PGtkExpander):Pchar;cdecl;external libgtk4;
procedure gtk_expander_set_use_underline(expander:PGtkExpander; use_underline:Tgboolean);cdecl;external libgtk4;
function gtk_expander_get_use_underline(expander:PGtkExpander):Tgboolean;cdecl;external libgtk4;
procedure gtk_expander_set_use_markup(expander:PGtkExpander; use_markup:Tgboolean);cdecl;external libgtk4;
function gtk_expander_get_use_markup(expander:PGtkExpander):Tgboolean;cdecl;external libgtk4;
procedure gtk_expander_set_label_widget(expander:PGtkExpander; label_widget:PGtkWidget);cdecl;external libgtk4;
function gtk_expander_get_label_widget(expander:PGtkExpander):PGtkWidget;cdecl;external libgtk4;
procedure gtk_expander_set_resize_toplevel(expander:PGtkExpander; resize_toplevel:Tgboolean);cdecl;external libgtk4;
function gtk_expander_get_resize_toplevel(expander:PGtkExpander):Tgboolean;cdecl;external libgtk4;
procedure gtk_expander_set_child(expander:PGtkExpander; child:PGtkWidget);cdecl;external libgtk4;
function gtk_expander_get_child(expander:PGtkExpander):PGtkWidget;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkExpander, g_object_unref) }

// === Konventiert am: 6-7-26 16:33:30 ===

function GTK_TYPE_EXPANDER : TGType;
function GTK_EXPANDER(obj : Pointer) : PGtkExpander;
function GTK_IS_EXPANDER(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_EXPANDER : TGType;
  begin
    GTK_TYPE_EXPANDER:=gtk_expander_get_type;
  end;

function GTK_EXPANDER(obj : Pointer) : PGtkExpander;
begin
  Result := PGtkExpander(g_type_check_instance_cast(obj, GTK_TYPE_EXPANDER));
end;

function GTK_IS_EXPANDER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_EXPANDER);
end;



end.

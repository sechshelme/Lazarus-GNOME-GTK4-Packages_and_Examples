unit gtktestutils;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Gtk+ testing utilities
 * Copyright (C) 2007 Imendio AB
 * Authors: Tim Janik
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
{$include <gtk/gtkspinbutton.h>}
{ --- Gtk+ Test Utility API ---  }

procedure gtk_test_init(argcp:Plongint; argvp:PPPchar; args:array of const);cdecl;external libgtk4;
procedure gtk_test_init(argcp:Plongint; argvp:PPPchar);cdecl;external libgtk4;
procedure gtk_test_register_all_types;cdecl;external libgtk4;
function gtk_test_list_all_types(n_types:Pguint):PGType;cdecl;external libgtk4;
procedure gtk_test_widget_wait_for_draw(widget:PGtkWidget);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:18:06 ===


implementation



end.

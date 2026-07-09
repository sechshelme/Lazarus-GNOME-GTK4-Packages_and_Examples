unit gtkinfobar;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gtkinfobar.h
 * This file is part of GTK
 *
 * Copyright (C) 2005 - Paolo Maggi
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
{
 * Modified by the gedit Team, 2005. See the gedit AUTHORS file for a
 * list of people on the gedit Team.
 * See the gedit ChangeLog files for a list of changes.
 *
 * Modified by the GTK+ Team, 2008-2009.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtkenums.h>}

type

function gtk_info_bar_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_info_bar_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_info_bar_new_with_buttons(first_button_text:Pchar; args:array of const):PGtkWidget;cdecl;external libgtk4;
function gtk_info_bar_new_with_buttons(first_button_text:Pchar):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_add_action_widget(info_bar:PGtkInfoBar; child:PGtkWidget; response_id:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_remove_action_widget(info_bar:PGtkInfoBar; widget:PGtkWidget);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_info_bar_add_button(info_bar:PGtkInfoBar; button_text:Pchar; response_id:longint):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_add_buttons(info_bar:PGtkInfoBar; first_button_text:Pchar; args:array of const);cdecl;external libgtk4;
procedure gtk_info_bar_add_buttons(info_bar:PGtkInfoBar; first_button_text:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_add_child(info_bar:PGtkInfoBar; widget:PGtkWidget);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_remove_child(info_bar:PGtkInfoBar; widget:PGtkWidget);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_set_response_sensitive(info_bar:PGtkInfoBar; response_id:longint; setting:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_set_default_response(info_bar:PGtkInfoBar; response_id:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_response(info_bar:PGtkInfoBar; response_id:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_set_message_type(info_bar:PGtkInfoBar; message_type:TGtkMessageType);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_info_bar_get_message_type(info_bar:PGtkInfoBar):TGtkMessageType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_set_show_close_button(info_bar:PGtkInfoBar; setting:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_info_bar_get_show_close_button(info_bar:PGtkInfoBar):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_info_bar_set_revealed(info_bar:PGtkInfoBar; revealed:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_info_bar_get_revealed(info_bar:PGtkInfoBar):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkInfoBar, g_object_unref) }

// === Konventiert am: 9-7-26 19:45:10 ===

function GTK_TYPE_INFO_BAR : TGType;
function GTK_INFO_BAR(obj : Pointer) : PGtkInfoBar;
function GTK_IS_INFO_BAR(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_INFO_BAR : TGType;
  begin
    GTK_TYPE_INFO_BAR:=gtk_info_bar_get_type;
  end;

function GTK_INFO_BAR(obj : Pointer) : PGtkInfoBar;
begin
  Result := PGtkInfoBar(g_type_check_instance_cast(obj, GTK_TYPE_INFO_BAR));
end;

function GTK_IS_INFO_BAR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_INFO_BAR);
end;



end.

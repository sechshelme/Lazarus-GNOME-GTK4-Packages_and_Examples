unit gtkassistant;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ 
 * GTK - The GIMP Toolkit
 * Copyright (C) 1999  Red Hat, Inc.
 * Copyright (C) 2002  Anders Carlsson <andersca@gnu.org>
 * Copyright (C) 2003  Matthias Clasen <mclasen@redhat.com>
 * Copyright (C) 2005  Carlos Garnacho Parro <carlosg@gnome.org>
 *
 * All rights reserved.
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
{$include <gtk/gtkwindow.h>}

{*
 * GtkAssistantPageType:
 * @GTK_ASSISTANT_PAGE_CONTENT: The page has regular contents. Both the
 *  Back and forward buttons will be shown.
 * @GTK_ASSISTANT_PAGE_INTRO: The page contains an introduction to the
 *  assistant task. Only the Forward button will be shown if there is a
 *   next page.
 * @GTK_ASSISTANT_PAGE_CONFIRM: The page lets the user confirm or deny the
 *  changes. The Back and Apply buttons will be shown.
 * @GTK_ASSISTANT_PAGE_SUMMARY: The page informs the user of the changes
 *  done. Only the Close button will be shown.
 * @GTK_ASSISTANT_PAGE_PROGRESS: Used for tasks that take a long time to
 *  complete, blocks the assistant until the page is marked as complete.
 *   Only the back button will be shown.
 * @GTK_ASSISTANT_PAGE_CUSTOM: Used for when other page types are not
 *  appropriate. No buttons will be shown, and the application must
 *  add its own buttons through gtk_assistant_add_action_widget().
 *
 * Determines the role of a page inside a `GtkAssistant`.
 *
 * The role is used to handle buttons sensitivity and visibility.
 *
 * Note that an assistant needs to end its page flow with a page of type
 * %GTK_ASSISTANT_PAGE_CONFIRM, %GTK_ASSISTANT_PAGE_SUMMARY or
 * %GTK_ASSISTANT_PAGE_PROGRESS to be correct.
 *
 * The Cancel button will only be shown if the page isn’t “committed”.
 * See gtk_assistant_commit() for details.
 *
 * Deprecated: 4.10: `GtkAssistant` will be removed in GTK 5
  }
type
  PGtkAssistantPageType = ^TGtkAssistantPageType;
  TGtkAssistantPageType =  Longint;
  Const
    GTK_ASSISTANT_PAGE_CONTENT = 0;
    GTK_ASSISTANT_PAGE_INTRO = 1;
    GTK_ASSISTANT_PAGE_CONFIRM = 2;
    GTK_ASSISTANT_PAGE_SUMMARY = 3;
    GTK_ASSISTANT_PAGE_PROGRESS = 4;
    GTK_ASSISTANT_PAGE_CUSTOM = 5;
;
type

{ was #define dname def_expr }
function GTK_TYPE_ASSISTANT_PAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ASSISTANT_PAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ASSISTANT_PAGE(obj : longint) : longint;

type
{*
 * GtkAssistantPageFunc:
 * @current_page: The page number used to calculate the next page.
 * @data: (closure): user data.
 *
 * Type of callback used to calculate the next page in a `GtkAssistant`.
 *
 * It’s called both for computing the next page when the user presses the
 * “forward” button and for handling the behavior of the “last” button.
 *
 * See [method@Gtk.Assistant.set_forward_page_func].
 *
 * Returns: The next page number
  }

  TGtkAssistantPageFunc = function (current_page:longint; data:Tgpointer):longint;cdecl;

function gtk_assistant_page_get_type:TGType;cdecl;external libgtk4;
function gtk_assistant_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_next_page(assistant:PGtkAssistant);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_previous_page(assistant:PGtkAssistant);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_get_current_page(assistant:PGtkAssistant):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_set_current_page(assistant:PGtkAssistant; page_num:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_get_n_pages(assistant:PGtkAssistant):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_get_nth_page(assistant:PGtkAssistant; page_num:longint):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_prepend_page(assistant:PGtkAssistant; page:PGtkWidget):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_append_page(assistant:PGtkAssistant; page:PGtkWidget):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_insert_page(assistant:PGtkAssistant; page:PGtkWidget; position:longint):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_remove_page(assistant:PGtkAssistant; page_num:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_set_forward_page_func(assistant:PGtkAssistant; page_func:TGtkAssistantPageFunc; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_set_page_type(assistant:PGtkAssistant; page:PGtkWidget; _type:TGtkAssistantPageType);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_get_page_type(assistant:PGtkAssistant; page:PGtkWidget):TGtkAssistantPageType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_set_page_title(assistant:PGtkAssistant; page:PGtkWidget; title:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_get_page_title(assistant:PGtkAssistant; page:PGtkWidget):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_set_page_complete(assistant:PGtkAssistant; page:PGtkWidget; complete:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_get_page_complete(assistant:PGtkAssistant; page:PGtkWidget):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_add_action_widget(assistant:PGtkAssistant; child:PGtkWidget);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_remove_action_widget(assistant:PGtkAssistant; child:PGtkWidget);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_update_buttons_state(assistant:PGtkAssistant);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_assistant_commit(assistant:PGtkAssistant);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_get_page(assistant:PGtkAssistant; child:PGtkWidget):PGtkAssistantPage;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_page_get_child(page:PGtkAssistantPage):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_assistant_get_pages(assistant:PGtkAssistant):PGListModel;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkAssistant, g_object_unref) }

// === Konventiert am: 9-7-26 19:34:04 ===

function GTK_TYPE_ASSISTANT : TGType;
function GTK_ASSISTANT(obj : Pointer) : PGtkAssistant;
function GTK_IS_ASSISTANT(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_ASSISTANT : TGType;
  begin
    GTK_TYPE_ASSISTANT:=gtk_assistant_get_type;
  end;

function GTK_ASSISTANT(obj : Pointer) : PGtkAssistant;
begin
  Result := PGtkAssistant(g_type_check_instance_cast(obj, GTK_TYPE_ASSISTANT));
end;

function GTK_IS_ASSISTANT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ASSISTANT);
end;


{ was #define dname def_expr }
function GTK_TYPE_ASSISTANT_PAGE : longint; { return type might be wrong }
  begin
    GTK_TYPE_ASSISTANT_PAGE:=gtk_assistant_page_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_ASSISTANT_PAGE(obj : longint) : longint;
begin
  GTK_ASSISTANT_PAGE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_ASSISTANT_PAGE,GtkAssistantPage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_ASSISTANT_PAGE(obj : longint) : longint;
begin
  GTK_IS_ASSISTANT_PAGE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_ASSISTANT_PAGE);
end;


end.

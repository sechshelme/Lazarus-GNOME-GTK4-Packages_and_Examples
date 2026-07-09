unit gtkentrycompletion;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkentrycompletion.h
 * Copyright (C) 2003  Kristian Rietveld  <kris@gtk.org>
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
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/deprecated/gtktreemodel.h>}
{$include <gtk/deprecated/gtkliststore.h>}
{$include <gtk/deprecated/gtkcellarea.h>}
{$include <gtk/deprecated/gtktreeviewcolumn.h>}
{$include <gtk/deprecated/gtktreemodelfilter.h>}

type
{*
 * GtkEntryCompletionMatchFunc:
 * @completion: the `GtkEntryCompletion`
 * @key: the string to match, normalized and case-folded
 * @iter: a `GtkTreeIter` indicating the row to match
 * @user_data: user data given to gtk_entry_completion_set_match_func()
 *
 * A function which decides whether the row indicated by @iter matches
 * a given @key, and should be displayed as a possible completion for @key.
 *
 * Note that @key is normalized and case-folded (see g_utf8_normalize()
 * and g_utf8_casefold()). If this is not appropriate, match functions
 * have access to the unmodified key via
 * `gtk_editable_get_text (GTK_EDITABLE (gtk_entry_completion_get_entry ()))`.
 *
 * Returns: %TRUE if @iter should be displayed as a possible completion
 *   for @key
 *
 * Deprecated: 4.20: There is no replacement
  }

  TGtkEntryCompletionMatchFunc = function (completion:PGtkEntryCompletion; key:Pchar; iter:PGtkTreeIter; user_data:Tgpointer):Tgboolean;cdecl;

function gtk_entry_completion_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_new:PGtkEntryCompletion;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_new_with_area(area:PGtkCellArea):PGtkEntryCompletion;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_entry(completion:PGtkEntryCompletion):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_set_model(completion:PGtkEntryCompletion; model:PGtkTreeModel);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_model(completion:PGtkEntryCompletion):PGtkTreeModel;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_set_match_func(completion:PGtkEntryCompletion; func:TGtkEntryCompletionMatchFunc; func_data:Tgpointer; func_notify:TGDestroyNotify);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_set_minimum_key_length(completion:PGtkEntryCompletion; length:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_minimum_key_length(completion:PGtkEntryCompletion):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_compute_prefix(completion:PGtkEntryCompletion; key:Pchar):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_complete(completion:PGtkEntryCompletion);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_insert_prefix(completion:PGtkEntryCompletion);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_set_inline_completion(completion:PGtkEntryCompletion; inline_completion:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_inline_completion(completion:PGtkEntryCompletion):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_set_inline_selection(completion:PGtkEntryCompletion; inline_selection:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_inline_selection(completion:PGtkEntryCompletion):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_set_popup_completion(completion:PGtkEntryCompletion; popup_completion:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_popup_completion(completion:PGtkEntryCompletion):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_set_popup_set_width(completion:PGtkEntryCompletion; popup_set_width:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_popup_set_width(completion:PGtkEntryCompletion):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_set_popup_single_match(completion:PGtkEntryCompletion; popup_single_match:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_popup_single_match(completion:PGtkEntryCompletion):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_completion_prefix(completion:PGtkEntryCompletion):Pchar;cdecl;external libgtk4;
{ convenience  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_entry_completion_set_text_column(completion:PGtkEntryCompletion; column:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_entry_completion_get_text_column(completion:PGtkEntryCompletion):longint;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkEntryCompletion, g_object_unref) }

// === Konventiert am: 9-7-26 19:42:13 ===

function GTK_TYPE_ENTRY_COMPLETION : TGType;
function GTK_ENTRY_COMPLETION(obj : PGtkEntryCompletion) : longint;
function GTK_IS_ENTRY_COMPLETION(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_ENTRY_COMPLETION : TGType;
  begin
    GTK_TYPE_ENTRY_COMPLETION:=gtk_entry_completion_get_type;
  end;

function GTK_ENTRY_COMPLETION(obj : PGtkEntryCompletion) : longint;
begin
  Result := PGtkEntryCompletion(g_type_check_class_cast(klass, GTK_TYPE_ENTRY_COMPLETION));
end;

function GTK_IS_ENTRY_COMPLETION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_ENTRY_COMPLETION);
end;



end.

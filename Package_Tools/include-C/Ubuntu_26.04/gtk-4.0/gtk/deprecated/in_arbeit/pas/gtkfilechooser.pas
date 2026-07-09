unit gtkfilechooser;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtkfilechooser.h: Abstract interface for file selector GUIs
 * Copyright (C) 2003, Red Hat, Inc.
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
{$include <gtk/gtkfilefilter.h>}
{$include <gtk/gtkwidget.h>}

type
{*
 * GtkFileChooserAction:
 * @GTK_FILE_CHOOSER_ACTION_OPEN: Indicates open mode.  The file chooser
 *  will only let the user pick an existing file.
 * @GTK_FILE_CHOOSER_ACTION_SAVE: Indicates save mode.  The file chooser
 *  will let the user pick an existing file, or type in a new
 *  filename.
 * @GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER: Indicates an Open mode for
 *  selecting folders.  The file chooser will let the user pick an
 *  existing folder.
 *
 * Describes whether a `GtkFileChooser` is being used to open existing files
 * or to save to a possibly new file.
  }

  PGtkFileChooserAction = ^TGtkFileChooserAction;
  TGtkFileChooserAction =  Longint;
  Const
    GTK_FILE_CHOOSER_ACTION_OPEN = 0;
    GTK_FILE_CHOOSER_ACTION_SAVE = 1;
    GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER = 2;
;

function gtk_file_chooser_get_type:TGType;cdecl;external libgtk4;
{ GError enumeration for GtkFileChooser  }
{*
 * GTK_FILE_CHOOSER_ERROR:
 *
 * Used to get the `GError` quark for `GtkFileChooser` errors.
 *
 * Deprecated: 4.10: There is no replacement
  }
{ was #define dname def_expr }
function GTK_FILE_CHOOSER_ERROR : longint; { return type might be wrong }

{*
 * GtkFileChooserError:
 * @GTK_FILE_CHOOSER_ERROR_NONEXISTENT: Indicates that a file does not exist.
 * @GTK_FILE_CHOOSER_ERROR_BAD_FILENAME: Indicates a malformed filename.
 * @GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS: Indicates a duplicate path (e.g. when
 *  adding a bookmark).
 * @GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME: Indicates an incomplete hostname
 *  (e.g. "http://foo" without a slash after that).
 *
 * These identify the various errors that can occur while calling
 * `GtkFileChooser` functions.
 *
 * Deprecated: 4.20: There is no replacement
  }
type
  PGtkFileChooserError = ^TGtkFileChooserError;
  TGtkFileChooserError =  Longint;
  Const
    GTK_FILE_CHOOSER_ERROR_NONEXISTENT = 0;
    GTK_FILE_CHOOSER_ERROR_BAD_FILENAME = 1;
    GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS = 2;
    GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME = 3;
;
{xxxxxGLIB_DEPRECATED_IN_4_10 }

function gtk_file_chooser_error_quark:TGQuark;cdecl;external libgtk4;
{ Configuration  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_set_action(chooser:PGtkFileChooser; action:TGtkFileChooserAction);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_action(chooser:PGtkFileChooser):TGtkFileChooserAction;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_set_select_multiple(chooser:PGtkFileChooser; select_multiple:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_select_multiple(chooser:PGtkFileChooser):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_set_create_folders(chooser:PGtkFileChooser; create_folders:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_create_folders(chooser:PGtkFileChooser):Tgboolean;cdecl;external libgtk4;
{ Suggested name for the Save-type actions  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_set_current_name(chooser:PGtkFileChooser; name:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_current_name(chooser:PGtkFileChooser):Pchar;cdecl;external libgtk4;
{ GFile manipulation  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_file(chooser:PGtkFileChooser):PGFile;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_set_file(chooser:PGtkFileChooser; file:PGFile; error:PPGError):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_files(chooser:PGtkFileChooser):PGListModel;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_set_current_folder(chooser:PGtkFileChooser; file:PGFile; error:PPGError):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_current_folder(chooser:PGtkFileChooser):PGFile;cdecl;external libgtk4;
{ List of user selectable filters  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_add_filter(chooser:PGtkFileChooser; filter:PGtkFileFilter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_remove_filter(chooser:PGtkFileChooser; filter:PGtkFileFilter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_filters(chooser:PGtkFileChooser):PGListModel;cdecl;external libgtk4;
{ Current filter  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_set_filter(chooser:PGtkFileChooser; filter:PGtkFileFilter);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_filter(chooser:PGtkFileChooser):PGtkFileFilter;cdecl;external libgtk4;
{ Per-application shortcut folders  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_add_shortcut_folder(chooser:PGtkFileChooser; folder:PGFile; error:PPGError):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_remove_shortcut_folder(chooser:PGtkFileChooser; folder:PGFile; error:PPGError):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_shortcut_folders(chooser:PGtkFileChooser):PGListModel;cdecl;external libgtk4;
{ Custom widgets  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_add_choice(chooser:PGtkFileChooser; id:Pchar; _label:Pchar; options:PPchar; option_labels:PPchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_remove_choice(chooser:PGtkFileChooser; id:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_set_choice(chooser:PGtkFileChooser; id:Pchar; option:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_get_choice(chooser:PGtkFileChooser; id:Pchar):Pchar;cdecl;external libgtk4;

// === Konventiert am: 9-7-26 19:42:08 ===

function GTK_TYPE_FILE_CHOOSER : TGType;
function GTK_FILE_CHOOSER(obj : PGtkFileChooser) : longint;
function GTK_IS_FILE_CHOOSER(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_FILE_CHOOSER : TGType;
  begin
    GTK_TYPE_FILE_CHOOSER:=gtk_file_chooser_get_type;
  end;

function GTK_FILE_CHOOSER(obj : PGtkFileChooser) : longint;
begin
  Result := PGtkFileChooser(g_type_check_class_cast(klass, GTK_TYPE_FILE_CHOOSER));
end;

function GTK_IS_FILE_CHOOSER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_FILE_CHOOSER);
end;


{ was #define dname def_expr }
function GTK_FILE_CHOOSER_ERROR : longint; { return type might be wrong }
  begin
    GTK_FILE_CHOOSER_ERROR:=gtk_file_chooser_error_quark;
  end;


end.

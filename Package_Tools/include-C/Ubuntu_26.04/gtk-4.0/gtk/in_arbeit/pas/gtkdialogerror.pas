unit gtkdialogerror;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2022 Red Hat, Inc.
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
{$include <gdk/gdk.h>}
{*
 * GTK_DIALOG_ERROR:
 *
 * The error domain for errors returned by async dialog functions.
 *
 * Since: 4.10
  }

{ was #define dname def_expr }
function GTK_DIALOG_ERROR : longint; { return type might be wrong }

{*
 * GtkDialogError:
 * @GTK_DIALOG_ERROR_FAILED: Generic error condition for when
 *   an operation fails and no more specific code is applicable
 * @GTK_DIALOG_ERROR_CANCELLED: The async function call was cancelled
 *   via its `GCancellable`
 * @GTK_DIALOG_ERROR_DISMISSED: The operation was cancelled
 *   by the user (via a Cancel or Close button)
 *
 * Error codes in the `GTK_DIALOG_ERROR` domain that can be returned
 * by async dialog functions.
 *
 * Since: 4.10
  }
type
  PGtkDialogError = ^TGtkDialogError;
  TGtkDialogError =  Longint;
  Const
    GTK_DIALOG_ERROR_FAILED = 0;
    GTK_DIALOG_ERROR_CANCELLED = 1;
    GTK_DIALOG_ERROR_DISMISSED = 2;
;

function gtk_dialog_error_quark:TGQuark;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:08:09 ===


implementation


{ was #define dname def_expr }
function GTK_DIALOG_ERROR : longint; { return type might be wrong }
  begin
    GTK_DIALOG_ERROR:=gtk_dialog_error_quark;
  end;


end.

unit gtkcolorbutton;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK - The GIMP Toolkit
 * Copyright (C) 1998, 1999 Red Hat, Inc.
 * All rights reserved.
 *
 * This Library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{ Color picker button for GNOME
 *
 * Author: Federico Mena <federico@nuclecu.unam.mx>
 *
 * Modified by the GTK+ Team and others 2003.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkbutton.h>}

type

function gtk_color_button_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_color_button_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_color_button_new_with_rgba(rgba:PGdkRGBA):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_color_button_set_title(button:PGtkColorButton; title:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_color_button_get_title(button:PGtkColorButton):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_color_button_get_modal(button:PGtkColorButton):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_color_button_set_modal(button:PGtkColorButton; modal:Tgboolean);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkColorButton, g_object_unref) }

// === Konventiert am: 9-7-26 19:42:51 ===

function GTK_TYPE_COLOR_BUTTON : TGType;
function GTK_COLOR_BUTTON(obj : Pointer) : PGtkColorButton;
function GTK_IS_COLOR_BUTTON(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_COLOR_BUTTON : TGType;
  begin
    GTK_TYPE_COLOR_BUTTON:=gtk_color_button_get_type;
  end;

function GTK_COLOR_BUTTON(obj : Pointer) : PGtkColorButton;
begin
  Result := PGtkColorButton(g_type_check_instance_cast(obj, GTK_TYPE_COLOR_BUTTON));
end;

function GTK_IS_COLOR_BUTTON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_COLOR_BUTTON);
end;



end.

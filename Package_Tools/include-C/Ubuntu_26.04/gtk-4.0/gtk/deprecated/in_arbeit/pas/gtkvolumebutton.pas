unit gtkvolumebutton;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2007 Red Hat, Inc.
 *
 * Authors:
 * - Bastien Nocera <bnocera@redhat.com>
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
 * Modified by the GTK+ Team and others 2007.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkscalebutton.h>}

type
  PGtkVolumeButton = ^TGtkVolumeButton;
  TGtkVolumeButton = record
      parent : TGtkScaleButton;
    end;


function gtk_volume_button_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_volume_button_new:PGtkWidget;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkVolumeButton, g_object_unref) }

// === Konventiert am: 9-7-26 19:51:47 ===

function GTK_TYPE_VOLUME_BUTTON : TGType;
function GTK_VOLUME_BUTTON(obj : Pointer) : PGtkVolumeButton;
function GTK_IS_VOLUME_BUTTON(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_VOLUME_BUTTON : TGType;
  begin
    GTK_TYPE_VOLUME_BUTTON:=gtk_volume_button_get_type;
  end;

function GTK_VOLUME_BUTTON(obj : Pointer) : PGtkVolumeButton;
begin
  Result := PGtkVolumeButton(g_type_check_instance_cast(obj, GTK_TYPE_VOLUME_BUTTON));
end;

function GTK_IS_VOLUME_BUTTON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_VOLUME_BUTTON);
end;



end.

unit gtksettings;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2000 Red Hat, Inc.
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
{$include <gtk/gtktypes.h>}
{ -- type macros ---  }

{ --- functions ---  }
function gtk_settings_get_type:TGType;cdecl;external libgtk4;
function gtk_settings_get_default:PGtkSettings;cdecl;external libgtk4;
function gtk_settings_get_for_display(display:PGdkDisplay):PGtkSettings;cdecl;external libgtk4;
procedure gtk_settings_reset_property(settings:PGtkSettings; name:Pchar);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSettings, g_object_unref) }

// === Konventiert am: 6-7-26 17:14:11 ===

function GTK_TYPE_SETTINGS : TGType;
function GTK_SETTINGS(obj : PGtkSettings) : longint;
function GTK_IS_SETTINGS(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_SETTINGS : TGType;
  begin
    GTK_TYPE_SETTINGS:=gtk_settings_get_type;
  end;

function GTK_SETTINGS(obj : PGtkSettings) : longint;
begin
  Result := PGtkSettings(g_type_check_class_cast(klass, GTK_TYPE_SETTINGS));
end;

function GTK_IS_SETTINGS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_SETTINGS);
end;



end.


unit gtksettings;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksettings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksettings.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGdkDisplay  = ^GdkDisplay;
PGtkSettings  = ^GtkSettings;
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

{ was #define dname def_expr }
function GTK_TYPE_SETTINGS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SETTINGS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SETTINGS(obj : longint) : longint;

{ --- functions ---  }
function gtk_settings_get_type:TGType;cdecl;external;
function gtk_settings_get_default:PGtkSettings;cdecl;external;
function gtk_settings_get_for_display(display:PGdkDisplay):PGtkSettings;cdecl;external;
(* Const before type ignored *)
procedure gtk_settings_reset_property(settings:PGtkSettings; name:Pchar);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkSettings, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_SETTINGS : longint; { return type might be wrong }
  begin
    GTK_TYPE_SETTINGS:=gtk_settings_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_SETTINGS(obj : longint) : longint;
begin
  GTK_SETTINGS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_SETTINGS,GtkSettings);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_SETTINGS(obj : longint) : longint;
begin
  GTK_IS_SETTINGS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_SETTINGS);
end;


end.

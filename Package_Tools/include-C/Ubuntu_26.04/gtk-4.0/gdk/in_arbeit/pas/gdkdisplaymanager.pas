unit gdkdisplaymanager;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
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
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
{$include <gdk/gdkdisplay.h>}

function gdk_display_manager_get_type:TGType;cdecl;external libgtk4;
function gdk_display_manager_get:PGdkDisplayManager;cdecl;external libgtk4;
function gdk_display_manager_get_default_display(manager:PGdkDisplayManager):PGdkDisplay;cdecl;external libgtk4;
procedure gdk_display_manager_set_default_display(manager:PGdkDisplayManager; display:PGdkDisplay);cdecl;external libgtk4;
function gdk_display_manager_list_displays(manager:PGdkDisplayManager):PGSList;cdecl;external libgtk4;
function gdk_display_manager_open_display(manager:PGdkDisplayManager; name:Pchar):PGdkDisplay;cdecl;external libgtk4;
procedure gdk_set_allowed_backends(backends:Pchar);cdecl;external libgtk4;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkDisplayManager, g_object_unref) }

// === Konventiert am: 2-7-26 19:12:29 ===

function GDK_TYPE_DISPLAY_MANAGER : TGType;
function GDK_DISPLAY_MANAGER(obj : Pointer) : PGdkDisplayManager;
function GDK_IS_DISPLAY_MANAGER(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_DISPLAY_MANAGER : TGType;
  begin
    GDK_TYPE_DISPLAY_MANAGER:=gdk_display_manager_get_type;
  end;

function GDK_DISPLAY_MANAGER(obj : Pointer) : PGdkDisplayManager;
begin
  Result := PGdkDisplayManager(g_type_check_instance_cast(obj, GDK_TYPE_DISPLAY_MANAGER));
end;

function GDK_IS_DISPLAY_MANAGER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_DISPLAY_MANAGER);
end;



end.

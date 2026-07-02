unit gdkapplaunchcontext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gdkapplaunchcontext.h - Gtk+ implementation for GAppLaunchContext
 *
 * Copyright (C) 2007 Red Hat, Inc.
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
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

function gdk_app_launch_context_get_type:TGType;cdecl;external libgtk4;
function gdk_app_launch_context_get_display(context:PGdkAppLaunchContext):PGdkDisplay;cdecl;external libgtk4;
procedure gdk_app_launch_context_set_desktop(context:PGdkAppLaunchContext; desktop:longint);cdecl;external libgtk4;
procedure gdk_app_launch_context_set_timestamp(context:PGdkAppLaunchContext; timestamp:Tguint32);cdecl;external libgtk4;
procedure gdk_app_launch_context_set_icon(context:PGdkAppLaunchContext; icon:PGIcon);cdecl;external libgtk4;
procedure gdk_app_launch_context_set_icon_name(context:PGdkAppLaunchContext; icon_name:Pchar);cdecl;external libgtk4;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (GdkAppLaunchContext, g_object_unref) }

// === Konventiert am: 2-7-26 17:36:01 ===

function GDK_TYPE_APP_LAUNCH_CONTEXT : TGType;
function GDK_APP_LAUNCH_CONTEXT(obj : Pointer) : PGdkAppLaunchContext;
function GDK_IS_APP_LAUNCH_CONTEXT(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_APP_LAUNCH_CONTEXT : TGType;
  begin
    GDK_TYPE_APP_LAUNCH_CONTEXT:=gdk_app_launch_context_get_type;
  end;

function GDK_APP_LAUNCH_CONTEXT(obj : Pointer) : PGdkAppLaunchContext;
begin
  Result := PGdkAppLaunchContext(g_type_check_instance_cast(obj, GDK_TYPE_APP_LAUNCH_CONTEXT));
end;

function GDK_IS_APP_LAUNCH_CONTEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_APP_LAUNCH_CONTEXT);
end;



end.

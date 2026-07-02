
unit gdkapplaunchcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkapplaunchcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkapplaunchcontext.h
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
PGdkAppLaunchContext  = ^GdkAppLaunchContext;
PGdkDisplay  = ^GdkDisplay;
PGIcon  = ^GIcon;
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

{ was #define dname def_expr }
function GDK_TYPE_APP_LAUNCH_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_APP_LAUNCH_CONTEXT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_APP_LAUNCH_CONTEXT(o : longint) : longint;

function gdk_app_launch_context_get_type:TGType;cdecl;external;
function gdk_app_launch_context_get_display(context:PGdkAppLaunchContext):PGdkDisplay;cdecl;external;
procedure gdk_app_launch_context_set_desktop(context:PGdkAppLaunchContext; desktop:longint);cdecl;external;
procedure gdk_app_launch_context_set_timestamp(context:PGdkAppLaunchContext; timestamp:Tguint32);cdecl;external;
procedure gdk_app_launch_context_set_icon(context:PGdkAppLaunchContext; icon:PGIcon);cdecl;external;
(* Const before type ignored *)
procedure gdk_app_launch_context_set_icon_name(context:PGdkAppLaunchContext; icon_name:Pchar);cdecl;external;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (GdkAppLaunchContext, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_APP_LAUNCH_CONTEXT : longint; { return type might be wrong }
  begin
    GDK_TYPE_APP_LAUNCH_CONTEXT:=gdk_app_launch_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_APP_LAUNCH_CONTEXT(o : longint) : longint;
begin
  GDK_APP_LAUNCH_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(o,GDK_TYPE_APP_LAUNCH_CONTEXT,GdkAppLaunchContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_APP_LAUNCH_CONTEXT(o : longint) : longint;
begin
  GDK_IS_APP_LAUNCH_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(o,GDK_TYPE_APP_LAUNCH_CONTEXT);
end;


end.

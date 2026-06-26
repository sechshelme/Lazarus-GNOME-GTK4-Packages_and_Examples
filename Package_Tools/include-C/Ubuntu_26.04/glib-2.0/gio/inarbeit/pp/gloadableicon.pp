
unit gloadableicon;
interface

{
  Automatically converted by H2Pas 1.0.0 from gloadableicon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gloadableicon.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGLoadableIcon  = ^GLoadableIcon;
PGLoadableIconIface  = ^GLoadableIconIface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_LOADABLE_ICON_H__}
{$define __G_LOADABLE_ICON_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_LOADABLE_ICON : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_LOADABLE_ICON(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_LOADABLE_ICON(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_LOADABLE_ICON_GET_IFACE(obj : longint) : longint;

type
{*
 * GLoadableIconIface:
 * @g_iface: The parent interface.
 * @load: Loads an icon.
 * @load_async: Loads an icon asynchronously.
 * @load_finish: Finishes an asynchronous icon load.
 *
 * Interface for icons that can be loaded as a stream.
 * }
{ Virtual Table  }
  PGLoadableIconIface = ^TGLoadableIconIface;
  TGLoadableIconIface = record
      g_iface : TGTypeInterface;
      load : function (icon:PGLoadableIcon; size:longint; _type:PPchar; cancellable:PGCancellable; error:PPGError):PGInputStream;cdecl;
      load_async : procedure (icon:PGLoadableIcon; size:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      load_finish : function (icon:PGLoadableIcon; res:PGAsyncResult; _type:PPchar; error:PPGError):PGInputStream;cdecl;
    end;


function g_loadable_icon_get_type:TGType;cdecl;external;
function g_loadable_icon_load(icon:PGLoadableIcon; size:longint; _type:PPchar; cancellable:PGCancellable; error:PPGError):PGInputStream;cdecl;external;
procedure g_loadable_icon_load_async(icon:PGLoadableIcon; size:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_loadable_icon_load_finish(icon:PGLoadableIcon; res:PGAsyncResult; _type:PPchar; error:PPGError):PGInputStream;cdecl;external;
{$endif}
{ __G_LOADABLE_ICON_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_LOADABLE_ICON : longint; { return type might be wrong }
  begin
    G_TYPE_LOADABLE_ICON:=g_loadable_icon_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_LOADABLE_ICON(obj : longint) : longint;
begin
  G_LOADABLE_ICON:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_LOADABLE_ICON,GLoadableIcon);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_LOADABLE_ICON(obj : longint) : longint;
begin
  G_IS_LOADABLE_ICON:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_LOADABLE_ICON);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_LOADABLE_ICON_GET_IFACE(obj : longint) : longint;
begin
  G_LOADABLE_ICON_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_LOADABLE_ICON,GLoadableIconIface);
end;


end.

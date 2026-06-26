unit gloadableicon;

interface

uses
  fp_glib2;

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


function g_loadable_icon_get_type:TGType;cdecl;external libgio2;
function g_loadable_icon_load(icon:PGLoadableIcon; size:longint; _type:PPchar; cancellable:PGCancellable; error:PPGError):PGInputStream;cdecl;external libgio2;
procedure g_loadable_icon_load_async(icon:PGLoadableIcon; size:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgio2;
function g_loadable_icon_load_finish(icon:PGLoadableIcon; res:PGAsyncResult; _type:PPchar; error:PPGError):PGInputStream;cdecl;external libgio2;
{$endif}
{ __G_LOADABLE_ICON_H__  }

// === Konventiert am: 26-6-26 19:39:48 ===

function G_TYPE_LOADABLE_ICON : TGType;
function G_LOADABLE_ICON(obj : Pointer) : PGLoadableIcon;
function G_IS_LOADABLE_ICON(obj : Pointer) : Tgboolean;
function G_LOADABLE_ICON_GET_IFACE(obj : Pointer) : PGLoadableIconIface;

implementation

function G_TYPE_LOADABLE_ICON : TGType;
  begin
    G_TYPE_LOADABLE_ICON:=g_loadable_icon_get_type;
  end;

function G_LOADABLE_ICON(obj : Pointer) : PGLoadableIcon;
begin
  Result := PGLoadableIcon(g_type_check_instance_cast(obj, G_TYPE_LOADABLE_ICON));
end;

function G_IS_LOADABLE_ICON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_LOADABLE_ICON);
end;

function G_LOADABLE_ICON_GET_IFACE(obj : Pointer) : PGLoadableIconIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_LOADABLE_ICON);
end;



end.

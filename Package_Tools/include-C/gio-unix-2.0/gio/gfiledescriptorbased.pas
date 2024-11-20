unit gfiledescriptorbased;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2010 Christian Kellner
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
 * Author: Christian Kellner <gicmo@gnome.org>
  }
{$ifndef __G_FILE_DESCRIPTOR_BASED_H__}
{$define __G_FILE_DESCRIPTOR_BASED_H__}
{$include <gio/gio.h>}
type

{*
 * GFileDescriptorBasedIface:
 * @g_iface: The parent interface.
 * @get_fd: Gets the underlying file descriptor.
 *
 * An interface for file descriptor based io objects.
 * }
{ Virtual Table  }
type
  PGFileDescriptorBasedIface = ^TGFileDescriptorBasedIface;
  TGFileDescriptorBasedIface = record
      g_iface : TGTypeInterface;
      get_fd : function (fd_based:PGFileDescriptorBased):longint;cdecl;
    end;


function g_file_descriptor_based_get_type:TGType;cdecl;external libgio2;
function g_file_descriptor_based_get_fd(fd_based:PGFileDescriptorBased):longint;cdecl;external libgio2;
{$endif}
{ __G_FILE_DESCRIPTOR_BASED_H__  }

// === Konventiert am: 20-11-24 15:19:09 ===

function G_TYPE_FILE_DESCRIPTOR_BASED : TGType;
function G_FILE_DESCRIPTOR_BASED(obj : Pointer) : PGFileDescriptorBased;
function G_IS_FILE_DESCRIPTOR_BASED(obj : Pointer) : Tgboolean;
function G_FILE_DESCRIPTOR_BASED_GET_IFACE(obj : Pointer) : PGFileDescriptorBasedIface;

implementation

function G_TYPE_FILE_DESCRIPTOR_BASED : TGType;
  begin
    G_TYPE_FILE_DESCRIPTOR_BASED:=g_file_descriptor_based_get_type;
  end;

function G_FILE_DESCRIPTOR_BASED(obj : Pointer) : PGFileDescriptorBased;
begin
  Result := PGFileDescriptorBased(g_type_check_instance_cast(obj, G_TYPE_FILE_DESCRIPTOR_BASED));
end;

function G_IS_FILE_DESCRIPTOR_BASED(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_FILE_DESCRIPTOR_BASED);
end;

function G_FILE_DESCRIPTOR_BASED_GET_IFACE(obj : Pointer) : PGFileDescriptorBasedIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_FILE_DESCRIPTOR_BASED);
end;



end.

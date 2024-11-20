
unit gfiledescriptorbased;
interface

{
  Automatically converted by H2Pas 1.0.0 from gfiledescriptorbased.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gfiledescriptorbased.h
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
PGFileDescriptorBased  = ^GFileDescriptorBased;
PGFileDescriptorBasedIface  = ^GFileDescriptorBasedIface;
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

{ was #define dname def_expr }
function G_TYPE_FILE_DESCRIPTOR_BASED : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_DESCRIPTOR_BASED(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_DESCRIPTOR_BASED(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_DESCRIPTOR_BASED_GET_IFACE(obj : longint) : longint;

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


function g_file_descriptor_based_get_type:TGType;cdecl;external;
function g_file_descriptor_based_get_fd(fd_based:PGFileDescriptorBased):longint;cdecl;external;
{$endif}
{ __G_FILE_DESCRIPTOR_BASED_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_FILE_DESCRIPTOR_BASED : longint; { return type might be wrong }
  begin
    G_TYPE_FILE_DESCRIPTOR_BASED:=g_file_descriptor_based_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_DESCRIPTOR_BASED(obj : longint) : longint;
begin
  G_FILE_DESCRIPTOR_BASED:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_FILE_DESCRIPTOR_BASED,GFileDescriptorBased);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_DESCRIPTOR_BASED(obj : longint) : longint;
begin
  G_IS_FILE_DESCRIPTOR_BASED:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_FILE_DESCRIPTOR_BASED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_DESCRIPTOR_BASED_GET_IFACE(obj : longint) : longint;
begin
  G_FILE_DESCRIPTOR_BASED_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_FILE_DESCRIPTOR_BASED,GFileDescriptorBasedIface);
end;


end.

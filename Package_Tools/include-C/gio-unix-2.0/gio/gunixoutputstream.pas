unit gunixoutputstream;

interface

uses
  common_GLIB, gtypes, gerror, gtype, giotypes, gobject, gioenums;

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
{$ifndef __G_UNIX_OUTPUT_STREAM_H__}
{$define __G_UNIX_OUTPUT_STREAM_H__}
{$include <gio/gio.h>}

type
{< private > }
  PGUnixOutputStream = ^TGUnixOutputStream;
  TGUnixOutputStream = record
      parent_instance : TGOutputStream;
      priv : PGUnixOutputStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGUnixOutputStreamClass = ^TGUnixOutputStreamClass;
  TGUnixOutputStreamClass = record
      parent_class : TGOutputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_unix_output_stream_get_type:TGType;cdecl;external libgio2;
function g_unix_output_stream_new(fd:Tgint; close_fd:Tgboolean):PGOutputStream;cdecl;external libgio2;
procedure g_unix_output_stream_set_close_fd(stream:PGUnixOutputStream; close_fd:Tgboolean);cdecl;external libgio2;
function g_unix_output_stream_get_close_fd(stream:PGUnixOutputStream):Tgboolean;cdecl;external libgio2;
function g_unix_output_stream_get_fd(stream:PGUnixOutputStream):Tgint;cdecl;external libgio2;
{$endif}
{ __G_UNIX_OUTPUT_STREAM_H__  }

// === Konventiert am: 20-11-24 15:20:14 ===

function G_TYPE_UNIX_OUTPUT_STREAM : TGType;
function G_UNIX_OUTPUT_STREAM(obj : Pointer) : PGUnixOutputStream;
function G_UNIX_OUTPUT_STREAM_CLASS(klass : Pointer) : PGUnixOutputStreamClass;
function G_IS_UNIX_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
function G_IS_UNIX_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_UNIX_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGUnixOutputStreamClass;

implementation

function G_TYPE_UNIX_OUTPUT_STREAM : TGType;
  begin
    G_TYPE_UNIX_OUTPUT_STREAM:=g_unix_output_stream_get_type;
  end;

function G_UNIX_OUTPUT_STREAM(obj : Pointer) : PGUnixOutputStream;
begin
  Result := PGUnixOutputStream(g_type_check_instance_cast(obj, G_TYPE_UNIX_OUTPUT_STREAM));
end;

function G_UNIX_OUTPUT_STREAM_CLASS(klass : Pointer) : PGUnixOutputStreamClass;
begin
  Result := PGUnixOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_UNIX_OUTPUT_STREAM));
end;

function G_IS_UNIX_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_UNIX_OUTPUT_STREAM);
end;

function G_IS_UNIX_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_UNIX_OUTPUT_STREAM);
end;

function G_UNIX_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGUnixOutputStreamClass;
begin
  Result := PGUnixOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

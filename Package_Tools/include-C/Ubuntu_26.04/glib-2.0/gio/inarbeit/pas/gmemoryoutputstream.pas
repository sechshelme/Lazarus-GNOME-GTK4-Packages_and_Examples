unit gmemoryoutputstream;

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
 * Author: Christian Kellner <gicmo@gnome.org>
  }
{$ifndef __G_MEMORY_OUTPUT_STREAM_H__}
{$define __G_MEMORY_OUTPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/goutputstream.h>}

type
{< private > }
  PGMemoryOutputStream = ^TGMemoryOutputStream;
  TGMemoryOutputStream = record
      parent_instance : TGOutputStream;
      priv : PGMemoryOutputStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGMemoryOutputStreamClass = ^TGMemoryOutputStreamClass;
  TGMemoryOutputStreamClass = record
      parent_class : TGOutputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;

{*
 * GReallocFunc:
 * @data: memory block to reallocate
 * @size: size to reallocate @data to
 *
 * Changes the size of the memory block pointed to by @data to
 * @size bytes.
 *
 * The function should have the same semantics as realloc().
 *
 * Returns: a pointer to the reallocated memory
  }

  TGReallocFunc = function (data:Tgpointer; size:Tgsize):Tgpointer;cdecl;

function g_memory_output_stream_get_type:TGType;cdecl;external libgio2;
function g_memory_output_stream_new(data:Tgpointer; size:Tgsize; realloc_function:TGReallocFunc; destroy_function:TGDestroyNotify):PGOutputStream;cdecl;external libgio2;
function g_memory_output_stream_new_resizable:PGOutputStream;cdecl;external libgio2;
function g_memory_output_stream_get_data(ostream:PGMemoryOutputStream):Tgpointer;cdecl;external libgio2;
function g_memory_output_stream_get_size(ostream:PGMemoryOutputStream):Tgsize;cdecl;external libgio2;
function g_memory_output_stream_get_data_size(ostream:PGMemoryOutputStream):Tgsize;cdecl;external libgio2;
function g_memory_output_stream_steal_data(ostream:PGMemoryOutputStream):Tgpointer;cdecl;external libgio2;
function g_memory_output_stream_steal_as_bytes(ostream:PGMemoryOutputStream):PGBytes;cdecl;external libgio2;
{$endif}
{ __G_MEMORY_OUTPUT_STREAM_H__  }

// === Konventiert am: 26-6-26 19:39:22 ===

function G_TYPE_MEMORY_OUTPUT_STREAM : TGType;
function G_MEMORY_OUTPUT_STREAM(obj : Pointer) : PGMemoryOutputStream;
function G_MEMORY_OUTPUT_STREAM_CLASS(klass : Pointer) : PGMemoryOutputStreamClass;
function G_IS_MEMORY_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
function G_IS_MEMORY_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_MEMORY_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGMemoryOutputStreamClass;

implementation

function G_TYPE_MEMORY_OUTPUT_STREAM : TGType;
  begin
    G_TYPE_MEMORY_OUTPUT_STREAM:=g_memory_output_stream_get_type;
  end;

function G_MEMORY_OUTPUT_STREAM(obj : Pointer) : PGMemoryOutputStream;
begin
  Result := PGMemoryOutputStream(g_type_check_instance_cast(obj, G_TYPE_MEMORY_OUTPUT_STREAM));
end;

function G_MEMORY_OUTPUT_STREAM_CLASS(klass : Pointer) : PGMemoryOutputStreamClass;
begin
  Result := PGMemoryOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_MEMORY_OUTPUT_STREAM));
end;

function G_IS_MEMORY_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_MEMORY_OUTPUT_STREAM);
end;

function G_IS_MEMORY_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_MEMORY_OUTPUT_STREAM);
end;

function G_MEMORY_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGMemoryOutputStreamClass;
begin
  Result := PGMemoryOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

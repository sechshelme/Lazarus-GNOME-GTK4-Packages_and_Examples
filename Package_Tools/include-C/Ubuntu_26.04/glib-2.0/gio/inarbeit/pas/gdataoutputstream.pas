unit gdataoutputstream;

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
{$ifndef __G_DATA_OUTPUT_STREAM_H__}
{$define __G_DATA_OUTPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gfilteroutputstream.h>}

type
{< private > }
  PGDataOutputStream = ^TGDataOutputStream;
  TGDataOutputStream = record
      parent_instance : TGFilterOutputStream;
      priv : PGDataOutputStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGDataOutputStreamClass = ^TGDataOutputStreamClass;
  TGDataOutputStreamClass = record
      parent_class : TGFilterOutputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_data_output_stream_get_type:TGType;cdecl;external libgio2;
function g_data_output_stream_new(base_stream:PGOutputStream):PGDataOutputStream;cdecl;external libgio2;
procedure g_data_output_stream_set_byte_order(stream:PGDataOutputStream; order:TGDataStreamByteOrder);cdecl;external libgio2;
function g_data_output_stream_get_byte_order(stream:PGDataOutputStream):TGDataStreamByteOrder;cdecl;external libgio2;
function g_data_output_stream_put_byte(stream:PGDataOutputStream; data:Tguchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_data_output_stream_put_int16(stream:PGDataOutputStream; data:Tgint16; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_data_output_stream_put_uint16(stream:PGDataOutputStream; data:Tguint16; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_data_output_stream_put_int32(stream:PGDataOutputStream; data:Tgint32; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_data_output_stream_put_uint32(stream:PGDataOutputStream; data:Tguint32; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_data_output_stream_put_int64(stream:PGDataOutputStream; data:Tgint64; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_data_output_stream_put_uint64(stream:PGDataOutputStream; data:Tguint64; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
function g_data_output_stream_put_string(stream:PGDataOutputStream; str:Pchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_DATA_OUTPUT_STREAM_H__  }

// === Konventiert am: 26-6-26 16:43:57 ===

function G_TYPE_DATA_OUTPUT_STREAM : TGType;
function G_DATA_OUTPUT_STREAM(obj : Pointer) : PGDataOutputStream;
function G_DATA_OUTPUT_STREAM_CLASS(klass : Pointer) : PGDataOutputStreamClass;
function G_IS_DATA_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
function G_IS_DATA_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_DATA_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGDataOutputStreamClass;

implementation

function G_TYPE_DATA_OUTPUT_STREAM : TGType;
  begin
    G_TYPE_DATA_OUTPUT_STREAM:=g_data_output_stream_get_type;
  end;

function G_DATA_OUTPUT_STREAM(obj : Pointer) : PGDataOutputStream;
begin
  Result := PGDataOutputStream(g_type_check_instance_cast(obj, G_TYPE_DATA_OUTPUT_STREAM));
end;

function G_DATA_OUTPUT_STREAM_CLASS(klass : Pointer) : PGDataOutputStreamClass;
begin
  Result := PGDataOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_DATA_OUTPUT_STREAM));
end;

function G_IS_DATA_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DATA_OUTPUT_STREAM);
end;

function G_IS_DATA_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_DATA_OUTPUT_STREAM);
end;

function G_DATA_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGDataOutputStreamClass;
begin
  Result := PGDataOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

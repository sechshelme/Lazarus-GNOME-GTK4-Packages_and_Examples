unit gbufferedinputstream;

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
{$ifndef __G_BUFFERED_INPUT_STREAM_H__}
{$define __G_BUFFERED_INPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gfilterinputstream.h>}

type
{< private > }
  PGBufferedInputStream = ^TGBufferedInputStream;
  TGBufferedInputStream = record
      parent_instance : TGFilterInputStream;
      priv : PGBufferedInputStreamPrivate;
    end;

{ Async ops: (optional in derived classes)  }
{< private > }
{ Padding for future expansion  }
  PGBufferedInputStreamClass = ^TGBufferedInputStreamClass;
  TGBufferedInputStreamClass = record
      parent_class : TGFilterInputStreamClass;
      fill : function (stream:PGBufferedInputStream; count:Tgssize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;
      fill_async : procedure (stream:PGBufferedInputStream; count:Tgssize; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      fill_finish : function (stream:PGBufferedInputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_buffered_input_stream_get_type:TGType;cdecl;external libgio2;
function g_buffered_input_stream_new(base_stream:PGInputStream):PGInputStream;cdecl;external libgio2;
function g_buffered_input_stream_new_sized(base_stream:PGInputStream; size:Tgsize):PGInputStream;cdecl;external libgio2;
function g_buffered_input_stream_get_buffer_size(stream:PGBufferedInputStream):Tgsize;cdecl;external libgio2;
procedure g_buffered_input_stream_set_buffer_size(stream:PGBufferedInputStream; size:Tgsize);cdecl;external libgio2;
function g_buffered_input_stream_get_available(stream:PGBufferedInputStream):Tgsize;cdecl;external libgio2;
function g_buffered_input_stream_peek(stream:PGBufferedInputStream; buffer:pointer; offset:Tgsize; count:Tgsize):Tgsize;cdecl;external libgio2;
function g_buffered_input_stream_peek_buffer(stream:PGBufferedInputStream; count:Pgsize):pointer;cdecl;external libgio2;
function g_buffered_input_stream_fill(stream:PGBufferedInputStream; count:Tgssize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external libgio2;
procedure g_buffered_input_stream_fill_async(stream:PGBufferedInputStream; count:Tgssize; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgio2;
function g_buffered_input_stream_fill_finish(stream:PGBufferedInputStream; result:PGAsyncResult; error:PPGError):Tgssize;cdecl;external libgio2;
function g_buffered_input_stream_read_byte(stream:PGBufferedInputStream; cancellable:PGCancellable; error:PPGError):longint;cdecl;external libgio2;
{$endif}
{ __G_BUFFERED_INPUT_STREAM_H__  }

// === Konventiert am: 26-6-26 16:26:26 ===

function G_TYPE_BUFFERED_INPUT_STREAM : TGType;
function G_BUFFERED_INPUT_STREAM(obj : Pointer) : PGBufferedInputStream;
function G_BUFFERED_INPUT_STREAM_CLASS(klass : Pointer) : PGBufferedInputStreamClass;
function G_IS_BUFFERED_INPUT_STREAM(obj : Pointer) : Tgboolean;
function G_IS_BUFFERED_INPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_BUFFERED_INPUT_STREAM_GET_CLASS(obj : Pointer) : PGBufferedInputStreamClass;

implementation

function G_TYPE_BUFFERED_INPUT_STREAM : TGType;
  begin
    G_TYPE_BUFFERED_INPUT_STREAM:=g_buffered_input_stream_get_type;
  end;

function G_BUFFERED_INPUT_STREAM(obj : Pointer) : PGBufferedInputStream;
begin
  Result := PGBufferedInputStream(g_type_check_instance_cast(obj, G_TYPE_BUFFERED_INPUT_STREAM));
end;

function G_BUFFERED_INPUT_STREAM_CLASS(klass : Pointer) : PGBufferedInputStreamClass;
begin
  Result := PGBufferedInputStreamClass(g_type_check_class_cast(klass, G_TYPE_BUFFERED_INPUT_STREAM));
end;

function G_IS_BUFFERED_INPUT_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_BUFFERED_INPUT_STREAM);
end;

function G_IS_BUFFERED_INPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_BUFFERED_INPUT_STREAM);
end;

function G_BUFFERED_INPUT_STREAM_GET_CLASS(obj : Pointer) : PGBufferedInputStreamClass;
begin
  Result := PGBufferedInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

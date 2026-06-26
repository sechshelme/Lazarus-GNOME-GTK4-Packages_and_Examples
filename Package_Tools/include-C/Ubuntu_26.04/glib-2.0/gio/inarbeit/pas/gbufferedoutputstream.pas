unit gbufferedoutputstream;

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
{$ifndef __G_BUFFERED_OUTPUT_STREAM_H__}
{$define __G_BUFFERED_OUTPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gfilteroutputstream.h>}

type
{< protected > }
  PGBufferedOutputStream = ^TGBufferedOutputStream;
  TGBufferedOutputStream = record
      parent_instance : TGFilterOutputStream;
      priv : PGBufferedOutputStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGBufferedOutputStreamClass = ^TGBufferedOutputStreamClass;
  TGBufferedOutputStreamClass = record
      parent_class : TGFilterOutputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
    end;


function g_buffered_output_stream_get_type:TGType;cdecl;external libgio2;
function g_buffered_output_stream_new(base_stream:PGOutputStream):PGOutputStream;cdecl;external libgio2;
function g_buffered_output_stream_new_sized(base_stream:PGOutputStream; size:Tgsize):PGOutputStream;cdecl;external libgio2;
function g_buffered_output_stream_get_buffer_size(stream:PGBufferedOutputStream):Tgsize;cdecl;external libgio2;
procedure g_buffered_output_stream_set_buffer_size(stream:PGBufferedOutputStream; size:Tgsize);cdecl;external libgio2;
function g_buffered_output_stream_get_auto_grow(stream:PGBufferedOutputStream):Tgboolean;cdecl;external libgio2;
procedure g_buffered_output_stream_set_auto_grow(stream:PGBufferedOutputStream; auto_grow:Tgboolean);cdecl;external libgio2;
{$endif}
{ __G_BUFFERED_OUTPUT_STREAM_H__  }

// === Konventiert am: 26-6-26 16:36:44 ===

function G_TYPE_BUFFERED_OUTPUT_STREAM : TGType;
function G_BUFFERED_OUTPUT_STREAM(obj : Pointer) : PGBufferedOutputStream;
function G_BUFFERED_OUTPUT_STREAM_CLASS(klass : Pointer) : PGBufferedOutputStreamClass;
function G_IS_BUFFERED_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
function G_IS_BUFFERED_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_BUFFERED_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGBufferedOutputStreamClass;

implementation

function G_TYPE_BUFFERED_OUTPUT_STREAM : TGType;
  begin
    G_TYPE_BUFFERED_OUTPUT_STREAM:=g_buffered_output_stream_get_type;
  end;

function G_BUFFERED_OUTPUT_STREAM(obj : Pointer) : PGBufferedOutputStream;
begin
  Result := PGBufferedOutputStream(g_type_check_instance_cast(obj, G_TYPE_BUFFERED_OUTPUT_STREAM));
end;

function G_BUFFERED_OUTPUT_STREAM_CLASS(klass : Pointer) : PGBufferedOutputStreamClass;
begin
  Result := PGBufferedOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_BUFFERED_OUTPUT_STREAM));
end;

function G_IS_BUFFERED_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_BUFFERED_OUTPUT_STREAM);
end;

function G_IS_BUFFERED_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_BUFFERED_OUTPUT_STREAM);
end;

function G_BUFFERED_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGBufferedOutputStreamClass;
begin
  Result := PGBufferedOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

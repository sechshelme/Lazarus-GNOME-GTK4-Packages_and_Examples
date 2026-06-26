unit gconverterinputstream;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2009 Red Hat, Inc.
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
{$ifndef __G_CONVERTER_INPUT_STREAM_H__}
{$define __G_CONVERTER_INPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gfilterinputstream.h>}
{$include <gio/gconverter.h>}

type
{< private > }
  PGConverterInputStream = ^TGConverterInputStream;
  TGConverterInputStream = record
      parent_instance : TGFilterInputStream;
      priv : PGConverterInputStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGConverterInputStreamClass = ^TGConverterInputStreamClass;
  TGConverterInputStreamClass = record
      parent_class : TGFilterInputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_converter_input_stream_get_type:TGType;cdecl;external libgio2;
function g_converter_input_stream_new(base_stream:PGInputStream; converter:PGConverter):PGInputStream;cdecl;external libgio2;
function g_converter_input_stream_get_converter(converter_stream:PGConverterInputStream):PGConverter;cdecl;external libgio2;
{$endif}
{ __G_CONVERTER_INPUT_STREAM_H__  }

// === Konventiert am: 26-6-26 16:35:41 ===

function G_TYPE_CONVERTER_INPUT_STREAM : TGType;
function G_CONVERTER_INPUT_STREAM(obj : Pointer) : PGConverterInputStream;
function G_CONVERTER_INPUT_STREAM_CLASS(klass : Pointer) : PGConverterInputStreamClass;
function G_IS_CONVERTER_INPUT_STREAM(obj : Pointer) : Tgboolean;
function G_IS_CONVERTER_INPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_CONVERTER_INPUT_STREAM_GET_CLASS(obj : Pointer) : PGConverterInputStreamClass;

implementation

function G_TYPE_CONVERTER_INPUT_STREAM : TGType;
  begin
    G_TYPE_CONVERTER_INPUT_STREAM:=g_converter_input_stream_get_type;
  end;

function G_CONVERTER_INPUT_STREAM(obj : Pointer) : PGConverterInputStream;
begin
  Result := PGConverterInputStream(g_type_check_instance_cast(obj, G_TYPE_CONVERTER_INPUT_STREAM));
end;

function G_CONVERTER_INPUT_STREAM_CLASS(klass : Pointer) : PGConverterInputStreamClass;
begin
  Result := PGConverterInputStreamClass(g_type_check_class_cast(klass, G_TYPE_CONVERTER_INPUT_STREAM));
end;

function G_IS_CONVERTER_INPUT_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_CONVERTER_INPUT_STREAM);
end;

function G_IS_CONVERTER_INPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_CONVERTER_INPUT_STREAM);
end;

function G_CONVERTER_INPUT_STREAM_GET_CLASS(obj : Pointer) : PGConverterInputStreamClass;
begin
  Result := PGConverterInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

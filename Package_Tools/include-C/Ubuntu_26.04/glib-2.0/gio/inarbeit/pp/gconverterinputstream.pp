
unit gconverterinputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gconverterinputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gconverterinputstream.h
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
PGConverter  = ^GConverter;
PGConverterInputStream  = ^GConverterInputStream;
PGConverterInputStreamClass  = ^GConverterInputStreamClass;
PGConverterInputStreamPrivate  = ^GConverterInputStreamPrivate;
PGInputStream  = ^GInputStream;
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

{ was #define dname def_expr }
function G_TYPE_CONVERTER_INPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CONVERTER_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CONVERTER_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER_INPUT_STREAM_GET_CLASS(o : longint) : longint;

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


function g_converter_input_stream_get_type:TGType;cdecl;external;
function g_converter_input_stream_new(base_stream:PGInputStream; converter:PGConverter):PGInputStream;cdecl;external;
function g_converter_input_stream_get_converter(converter_stream:PGConverterInputStream):PGConverter;cdecl;external;
{$endif}
{ __G_CONVERTER_INPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_CONVERTER_INPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_CONVERTER_INPUT_STREAM:=g_converter_input_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER_INPUT_STREAM(o : longint) : longint;
begin
  G_CONVERTER_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_CONVERTER_INPUT_STREAM,GConverterInputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_CONVERTER_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_CONVERTER_INPUT_STREAM,GConverterInputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CONVERTER_INPUT_STREAM(o : longint) : longint;
begin
  G_IS_CONVERTER_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_CONVERTER_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CONVERTER_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_CONVERTER_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_CONVERTER_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER_INPUT_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_CONVERTER_INPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_CONVERTER_INPUT_STREAM,GConverterInputStreamClass);
end;


end.

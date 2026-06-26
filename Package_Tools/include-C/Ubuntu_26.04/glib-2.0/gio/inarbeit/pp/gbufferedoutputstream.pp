
unit gbufferedoutputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gbufferedoutputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gbufferedoutputstream.h
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
PGBufferedOutputStream  = ^GBufferedOutputStream;
PGBufferedOutputStreamClass  = ^GBufferedOutputStreamClass;
PGBufferedOutputStreamPrivate  = ^GBufferedOutputStreamPrivate;
PGOutputStream  = ^GOutputStream;
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

{ was #define dname def_expr }
function G_TYPE_BUFFERED_OUTPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_BUFFERED_OUTPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_BUFFERED_OUTPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_BUFFERED_OUTPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_BUFFERED_OUTPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_BUFFERED_OUTPUT_STREAM_GET_CLASS(o : longint) : longint;

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


function g_buffered_output_stream_get_type:TGType;cdecl;external;
function g_buffered_output_stream_new(base_stream:PGOutputStream):PGOutputStream;cdecl;external;
function g_buffered_output_stream_new_sized(base_stream:PGOutputStream; size:Tgsize):PGOutputStream;cdecl;external;
function g_buffered_output_stream_get_buffer_size(stream:PGBufferedOutputStream):Tgsize;cdecl;external;
procedure g_buffered_output_stream_set_buffer_size(stream:PGBufferedOutputStream; size:Tgsize);cdecl;external;
function g_buffered_output_stream_get_auto_grow(stream:PGBufferedOutputStream):Tgboolean;cdecl;external;
procedure g_buffered_output_stream_set_auto_grow(stream:PGBufferedOutputStream; auto_grow:Tgboolean);cdecl;external;
{$endif}
{ __G_BUFFERED_OUTPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_BUFFERED_OUTPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_BUFFERED_OUTPUT_STREAM:=g_buffered_output_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_BUFFERED_OUTPUT_STREAM(o : longint) : longint;
begin
  G_BUFFERED_OUTPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_BUFFERED_OUTPUT_STREAM,GBufferedOutputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_BUFFERED_OUTPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_BUFFERED_OUTPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_BUFFERED_OUTPUT_STREAM,GBufferedOutputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_BUFFERED_OUTPUT_STREAM(o : longint) : longint;
begin
  G_IS_BUFFERED_OUTPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_BUFFERED_OUTPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_BUFFERED_OUTPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_BUFFERED_OUTPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_BUFFERED_OUTPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_BUFFERED_OUTPUT_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_BUFFERED_OUTPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_BUFFERED_OUTPUT_STREAM,GBufferedOutputStreamClass);
end;


end.


unit gdatainputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdatainputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdatainputstream.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGDataInputStream  = ^GDataInputStream;
PGDataInputStreamClass  = ^GDataInputStreamClass;
PGDataInputStreamPrivate  = ^GDataInputStreamPrivate;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
Pgsize  = ^gsize;
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
{$ifndef __G_DATA_INPUT_STREAM_H__}
{$define __G_DATA_INPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gbufferedinputstream.h>}

{ was #define dname def_expr }
function G_TYPE_DATA_INPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATA_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATA_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DATA_INPUT_STREAM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DATA_INPUT_STREAM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATA_INPUT_STREAM_GET_CLASS(o : longint) : longint;

type
{< private > }
  PGDataInputStream = ^TGDataInputStream;
  TGDataInputStream = record
      parent_instance : TGBufferedInputStream;
      priv : PGDataInputStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGDataInputStreamClass = ^TGDataInputStreamClass;
  TGDataInputStreamClass = record
      parent_class : TGBufferedInputStreamClass;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_data_input_stream_get_type:TGType;cdecl;external;
function g_data_input_stream_new(base_stream:PGInputStream):PGDataInputStream;cdecl;external;
procedure g_data_input_stream_set_byte_order(stream:PGDataInputStream; order:TGDataStreamByteOrder);cdecl;external;
function g_data_input_stream_get_byte_order(stream:PGDataInputStream):TGDataStreamByteOrder;cdecl;external;
procedure g_data_input_stream_set_newline_type(stream:PGDataInputStream; _type:TGDataStreamNewlineType);cdecl;external;
function g_data_input_stream_get_newline_type(stream:PGDataInputStream):TGDataStreamNewlineType;cdecl;external;
function g_data_input_stream_read_byte(stream:PGDataInputStream; cancellable:PGCancellable; error:PPGError):Tguchar;cdecl;external;
function g_data_input_stream_read_int16(stream:PGDataInputStream; cancellable:PGCancellable; error:PPGError):Tgint16;cdecl;external;
function g_data_input_stream_read_uint16(stream:PGDataInputStream; cancellable:PGCancellable; error:PPGError):Tguint16;cdecl;external;
function g_data_input_stream_read_int32(stream:PGDataInputStream; cancellable:PGCancellable; error:PPGError):Tgint32;cdecl;external;
function g_data_input_stream_read_uint32(stream:PGDataInputStream; cancellable:PGCancellable; error:PPGError):Tguint32;cdecl;external;
function g_data_input_stream_read_int64(stream:PGDataInputStream; cancellable:PGCancellable; error:PPGError):Tgint64;cdecl;external;
function g_data_input_stream_read_uint64(stream:PGDataInputStream; cancellable:PGCancellable; error:PPGError):Tguint64;cdecl;external;
function g_data_input_stream_read_line(stream:PGDataInputStream; length:Pgsize; cancellable:PGCancellable; error:PPGError):Pchar;cdecl;external;
function g_data_input_stream_read_line_utf8(stream:PGDataInputStream; length:Pgsize; cancellable:PGCancellable; error:PPGError):Pchar;cdecl;external;
procedure g_data_input_stream_read_line_async(stream:PGDataInputStream; io_priority:Tgint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_data_input_stream_read_line_finish(stream:PGDataInputStream; result:PGAsyncResult; length:Pgsize; error:PPGError):Pchar;cdecl;external;
function g_data_input_stream_read_line_finish_utf8(stream:PGDataInputStream; result:PGAsyncResult; length:Pgsize; error:PPGError):Pchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_56_FOR (g_data_input_stream_read_upto) }
(* Const before type ignored *)
function g_data_input_stream_read_until(stream:PGDataInputStream; stop_chars:Pgchar; length:Pgsize; cancellable:PGCancellable; error:PPGError):Pchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_56_FOR (g_data_input_stream_read_upto_async) }
(* Const before type ignored *)
procedure g_data_input_stream_read_until_async(stream:PGDataInputStream; stop_chars:Pgchar; io_priority:Tgint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_56_FOR (g_data_input_stream_read_upto_finish) }
function g_data_input_stream_read_until_finish(stream:PGDataInputStream; result:PGAsyncResult; length:Pgsize; error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
function g_data_input_stream_read_upto(stream:PGDataInputStream; stop_chars:Pgchar; stop_chars_len:Tgssize; length:Pgsize; cancellable:PGCancellable; 
           error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_data_input_stream_read_upto_async(stream:PGDataInputStream; stop_chars:Pgchar; stop_chars_len:Tgssize; io_priority:Tgint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_data_input_stream_read_upto_finish(stream:PGDataInputStream; result:PGAsyncResult; length:Pgsize; error:PPGError):Pchar;cdecl;external;
{$endif}
{ __G_DATA_INPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DATA_INPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_DATA_INPUT_STREAM:=g_data_input_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATA_INPUT_STREAM(o : longint) : longint;
begin
  G_DATA_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DATA_INPUT_STREAM,GDataInputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATA_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_DATA_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_DATA_INPUT_STREAM,GDataInputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DATA_INPUT_STREAM(o : longint) : longint;
begin
  G_IS_DATA_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DATA_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DATA_INPUT_STREAM_CLASS(k : longint) : longint;
begin
  G_IS_DATA_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_DATA_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATA_INPUT_STREAM_GET_CLASS(o : longint) : longint;
begin
  G_DATA_INPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_DATA_INPUT_STREAM,GDataInputStreamClass);
end;


end.

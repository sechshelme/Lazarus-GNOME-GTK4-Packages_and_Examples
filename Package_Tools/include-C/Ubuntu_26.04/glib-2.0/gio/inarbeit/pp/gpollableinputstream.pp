
unit gpollableinputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gpollableinputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gpollableinputstream.h
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
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGPollableInputStream  = ^GPollableInputStream;
PGPollableInputStreamInterface  = ^GPollableInputStreamInterface;
PGSource  = ^GSource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2010 Red Hat, Inc.
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
  }
{$ifndef __G_POLLABLE_INPUT_STREAM_H__}
{$define __G_POLLABLE_INPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function G_TYPE_POLLABLE_INPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_POLLABLE_INPUT_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_POLLABLE_INPUT_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_POLLABLE_INPUT_STREAM_GET_INTERFACE(obj : longint) : longint;

type
{*
 * GPollableInputStreamInterface:
 * @g_iface: The parent interface.
 * @can_poll: Checks if the #GPollableInputStream instance is actually pollable
 * @is_readable: Checks if the stream is readable
 * @create_source: Creates a #GSource to poll the stream
 * @read_nonblocking: Does a non-blocking read or returns
 *   %G_IO_ERROR_WOULD_BLOCK
 *
 * The interface for pollable input streams.
 *
 * The default implementation of @can_poll always returns %TRUE.
 *
 * The default implementation of @read_nonblocking calls
 * g_pollable_input_stream_is_readable(), and then calls
 * g_input_stream_read() if it returns %TRUE. This means you only need
 * to override it if it is possible that your @is_readable
 * implementation may return %TRUE when the stream is not actually
 * readable.
 *
 * Since: 2.28
  }
{ Virtual Table  }
  PGPollableInputStreamInterface = ^TGPollableInputStreamInterface;
  TGPollableInputStreamInterface = record
      g_iface : TGTypeInterface;
      can_poll : function (stream:PGPollableInputStream):Tgboolean;cdecl;
      is_readable : function (stream:PGPollableInputStream):Tgboolean;cdecl;
      create_source : function (stream:PGPollableInputStream; cancellable:PGCancellable):PGSource;cdecl;
      read_nonblocking : function (stream:PGPollableInputStream; buffer:pointer; count:Tgsize; error:PPGError):Tgssize;cdecl;
    end;


function g_pollable_input_stream_get_type:TGType;cdecl;external;
function g_pollable_input_stream_can_poll(stream:PGPollableInputStream):Tgboolean;cdecl;external;
function g_pollable_input_stream_is_readable(stream:PGPollableInputStream):Tgboolean;cdecl;external;
function g_pollable_input_stream_create_source(stream:PGPollableInputStream; cancellable:PGCancellable):PGSource;cdecl;external;
function g_pollable_input_stream_read_nonblocking(stream:PGPollableInputStream; buffer:pointer; count:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
{$endif}
{ __G_POLLABLE_INPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_POLLABLE_INPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_POLLABLE_INPUT_STREAM:=g_pollable_input_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_POLLABLE_INPUT_STREAM(obj : longint) : longint;
begin
  G_POLLABLE_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_POLLABLE_INPUT_STREAM,GPollableInputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_POLLABLE_INPUT_STREAM(obj : longint) : longint;
begin
  G_IS_POLLABLE_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_POLLABLE_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_POLLABLE_INPUT_STREAM_GET_INTERFACE(obj : longint) : longint;
begin
  G_POLLABLE_INPUT_STREAM_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_POLLABLE_INPUT_STREAM,GPollableInputStreamInterface);
end;


end.

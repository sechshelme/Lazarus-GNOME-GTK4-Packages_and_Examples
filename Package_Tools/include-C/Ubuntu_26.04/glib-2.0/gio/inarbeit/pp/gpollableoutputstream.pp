
unit gpollableoutputstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gpollableoutputstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gpollableoutputstream.h
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
PGOutputVector  = ^GOutputVector;
PGPollableOutputStream  = ^GPollableOutputStream;
PGPollableOutputStreamInterface  = ^GPollableOutputStreamInterface;
Pgsize  = ^gsize;
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
{$ifndef __G_POLLABLE_OUTPUT_STREAM_H__}
{$define __G_POLLABLE_OUTPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function G_TYPE_POLLABLE_OUTPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_POLLABLE_OUTPUT_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_POLLABLE_OUTPUT_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_POLLABLE_OUTPUT_STREAM_GET_INTERFACE(obj : longint) : longint;

type
{*
 * GPollableOutputStreamInterface:
 * @g_iface: The parent interface.
 * @can_poll: Checks if the #GPollableOutputStream instance is actually pollable
 * @is_writable: Checks if the stream is writable
 * @create_source: Creates a #GSource to poll the stream
 * @write_nonblocking: Does a non-blocking write or returns
 *   %G_IO_ERROR_WOULD_BLOCK
 * @writev_nonblocking: Does a vectored non-blocking write, or returns
 *   %G_POLLABLE_RETURN_WOULD_BLOCK
 *
 * The interface for pollable output streams.
 *
 * The default implementation of @can_poll always returns %TRUE.
 *
 * The default implementation of @write_nonblocking calls
 * g_pollable_output_stream_is_writable(), and then calls
 * g_output_stream_write() if it returns %TRUE. This means you only
 * need to override it if it is possible that your @is_writable
 * implementation may return %TRUE when the stream is not actually
 * writable.
 *
 * The default implementation of @writev_nonblocking calls
 * g_pollable_output_stream_write_nonblocking() for each vector, and converts
 * its return value and error (if set) to a #GPollableReturn. You should
 * override this where possible to avoid having to allocate a #GError to return
 * %G_IO_ERROR_WOULD_BLOCK.
 *
 * Since: 2.28
  }
{ Virtual Table  }
(* Const before type ignored *)
(* Const before type ignored *)
  PGPollableOutputStreamInterface = ^TGPollableOutputStreamInterface;
  TGPollableOutputStreamInterface = record
      g_iface : TGTypeInterface;
      can_poll : function (stream:PGPollableOutputStream):Tgboolean;cdecl;
      is_writable : function (stream:PGPollableOutputStream):Tgboolean;cdecl;
      create_source : function (stream:PGPollableOutputStream; cancellable:PGCancellable):PGSource;cdecl;
      write_nonblocking : function (stream:PGPollableOutputStream; buffer:pointer; count:Tgsize; error:PPGError):Tgssize;cdecl;
      writev_nonblocking : function (stream:PGPollableOutputStream; vectors:PGOutputVector; n_vectors:Tgsize; bytes_written:Pgsize; error:PPGError):TGPollableReturn;cdecl;
    end;


function g_pollable_output_stream_get_type:TGType;cdecl;external;
function g_pollable_output_stream_can_poll(stream:PGPollableOutputStream):Tgboolean;cdecl;external;
function g_pollable_output_stream_is_writable(stream:PGPollableOutputStream):Tgboolean;cdecl;external;
function g_pollable_output_stream_create_source(stream:PGPollableOutputStream; cancellable:PGCancellable):PGSource;cdecl;external;
(* Const before type ignored *)
function g_pollable_output_stream_write_nonblocking(stream:PGPollableOutputStream; buffer:pointer; count:Tgsize; cancellable:PGCancellable; error:PPGError):Tgssize;cdecl;external;
(* Const before type ignored *)
function g_pollable_output_stream_writev_nonblocking(stream:PGPollableOutputStream; vectors:PGOutputVector; n_vectors:Tgsize; bytes_written:Pgsize; cancellable:PGCancellable; 
           error:PPGError):TGPollableReturn;cdecl;external;
{$endif}
{ __G_POLLABLE_OUTPUT_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_POLLABLE_OUTPUT_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_POLLABLE_OUTPUT_STREAM:=g_pollable_output_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_POLLABLE_OUTPUT_STREAM(obj : longint) : longint;
begin
  G_POLLABLE_OUTPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_POLLABLE_OUTPUT_STREAM,GPollableOutputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_POLLABLE_OUTPUT_STREAM(obj : longint) : longint;
begin
  G_IS_POLLABLE_OUTPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_POLLABLE_OUTPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_POLLABLE_OUTPUT_STREAM_GET_INTERFACE(obj : longint) : longint;
begin
  G_POLLABLE_OUTPUT_STREAM_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_POLLABLE_OUTPUT_STREAM,GPollableOutputStreamInterface);
end;


end.

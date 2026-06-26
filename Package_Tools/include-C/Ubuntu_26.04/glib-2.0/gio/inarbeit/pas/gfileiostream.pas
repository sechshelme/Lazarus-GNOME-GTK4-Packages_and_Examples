unit gfileiostream;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Io and Streaming Library
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
{$ifndef __G_FILE_IO_STREAM_H__}
{$define __G_FILE_IO_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giostream.h>}

type
{< private > }
  PGFileIOStream = ^TGFileIOStream;
  TGFileIOStream = record
      parent_instance : TGIOStream;
      priv : PGFileIOStreamPrivate;
    end;

{ Padding for future expansion  }
  PGFileIOStreamClass = ^TGFileIOStreamClass;
  TGFileIOStreamClass = record
      parent_class : TGIOStreamClass;
      tell : function (stream:PGFileIOStream):Tgoffset;cdecl;
      can_seek : function (stream:PGFileIOStream):Tgboolean;cdecl;
      seek : function (stream:PGFileIOStream; offset:Tgoffset; _type:TGSeekType; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      can_truncate : function (stream:PGFileIOStream):Tgboolean;cdecl;
      truncate_fn : function (stream:PGFileIOStream; size:Tgoffset; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      query_info : function (stream:PGFileIOStream; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;
      query_info_async : procedure (stream:PGFileIOStream; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      query_info_finish : function (stream:PGFileIOStream; result:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;
      get_etag : function (stream:PGFileIOStream):Pchar;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_file_io_stream_get_type:TGType;cdecl;external libgio2;
function g_file_io_stream_query_info(stream:PGFileIOStream; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;external libgio2;
procedure g_file_io_stream_query_info_async(stream:PGFileIOStream; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgio2;
function g_file_io_stream_query_info_finish(stream:PGFileIOStream; result:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;external libgio2;
function g_file_io_stream_get_etag(stream:PGFileIOStream):Pchar;cdecl;external libgio2;
{$endif}
{ __G_FILE_FILE_IO_STREAM_H__  }

// === Konventiert am: 26-6-26 19:21:39 ===

function G_TYPE_FILE_IO_STREAM : TGType;
function G_FILE_IO_STREAM(obj : Pointer) : PGFileIOStream;
function G_FILE_IO_STREAM_CLASS(klass : Pointer) : PGFileIOStreamClass;
function G_IS_FILE_IO_STREAM(obj : Pointer) : Tgboolean;
function G_IS_FILE_IO_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_FILE_IO_STREAM_GET_CLASS(obj : Pointer) : PGFileIOStreamClass;

implementation

function G_TYPE_FILE_IO_STREAM : TGType;
  begin
    G_TYPE_FILE_IO_STREAM:=g_file_io_stream_get_type;
  end;

function G_FILE_IO_STREAM(obj : Pointer) : PGFileIOStream;
begin
  Result := PGFileIOStream(g_type_check_instance_cast(obj, G_TYPE_FILE_IO_STREAM));
end;

function G_FILE_IO_STREAM_CLASS(klass : Pointer) : PGFileIOStreamClass;
begin
  Result := PGFileIOStreamClass(g_type_check_class_cast(klass, G_TYPE_FILE_IO_STREAM));
end;

function G_IS_FILE_IO_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_FILE_IO_STREAM);
end;

function G_IS_FILE_IO_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_FILE_IO_STREAM);
end;

function G_FILE_IO_STREAM_GET_CLASS(obj : Pointer) : PGFileIOStreamClass;
begin
  Result := PGFileIOStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

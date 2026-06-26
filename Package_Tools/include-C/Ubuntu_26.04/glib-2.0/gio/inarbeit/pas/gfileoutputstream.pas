unit gfileoutputstream;

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
{$ifndef __G_FILE_OUTPUT_STREAM_H__}
{$define __G_FILE_OUTPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/goutputstream.h>}

type
{< private > }
  PGFileOutputStream = ^TGFileOutputStream;
  TGFileOutputStream = record
      parent_instance : TGOutputStream;
      priv : PGFileOutputStreamPrivate;
    end;

{ Padding for future expansion  }
  PGFileOutputStreamClass = ^TGFileOutputStreamClass;
  TGFileOutputStreamClass = record
      parent_class : TGOutputStreamClass;
      tell : function (stream:PGFileOutputStream):Tgoffset;cdecl;
      can_seek : function (stream:PGFileOutputStream):Tgboolean;cdecl;
      seek : function (stream:PGFileOutputStream; offset:Tgoffset; _type:TGSeekType; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      can_truncate : function (stream:PGFileOutputStream):Tgboolean;cdecl;
      truncate_fn : function (stream:PGFileOutputStream; size:Tgoffset; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      query_info : function (stream:PGFileOutputStream; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;
      query_info_async : procedure (stream:PGFileOutputStream; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      query_info_finish : function (stream:PGFileOutputStream; result:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;
      get_etag : function (stream:PGFileOutputStream):Pchar;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_file_output_stream_get_type:TGType;cdecl;external libgio2;
function g_file_output_stream_query_info(stream:PGFileOutputStream; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;external libgio2;
procedure g_file_output_stream_query_info_async(stream:PGFileOutputStream; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgio2;
function g_file_output_stream_query_info_finish(stream:PGFileOutputStream; result:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;external libgio2;
function g_file_output_stream_get_etag(stream:PGFileOutputStream):Pchar;cdecl;external libgio2;
{$endif}
{ __G_FILE_FILE_OUTPUT_STREAM_H__  }

// === Konventiert am: 26-6-26 19:26:38 ===

function G_TYPE_FILE_OUTPUT_STREAM : TGType;
function G_FILE_OUTPUT_STREAM(obj : Pointer) : PGFileOutputStream;
function G_FILE_OUTPUT_STREAM_CLASS(klass : Pointer) : PGFileOutputStreamClass;
function G_IS_FILE_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
function G_IS_FILE_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_FILE_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGFileOutputStreamClass;

implementation

function G_TYPE_FILE_OUTPUT_STREAM : TGType;
  begin
    G_TYPE_FILE_OUTPUT_STREAM:=g_file_output_stream_get_type;
  end;

function G_FILE_OUTPUT_STREAM(obj : Pointer) : PGFileOutputStream;
begin
  Result := PGFileOutputStream(g_type_check_instance_cast(obj, G_TYPE_FILE_OUTPUT_STREAM));
end;

function G_FILE_OUTPUT_STREAM_CLASS(klass : Pointer) : PGFileOutputStreamClass;
begin
  Result := PGFileOutputStreamClass(g_type_check_class_cast(klass, G_TYPE_FILE_OUTPUT_STREAM));
end;

function G_IS_FILE_OUTPUT_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_FILE_OUTPUT_STREAM);
end;

function G_IS_FILE_OUTPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_FILE_OUTPUT_STREAM);
end;

function G_FILE_OUTPUT_STREAM_GET_CLASS(obj : Pointer) : PGFileOutputStreamClass;
begin
  Result := PGFileOutputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.

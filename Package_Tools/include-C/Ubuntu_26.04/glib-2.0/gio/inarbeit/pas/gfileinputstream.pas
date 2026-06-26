unit gfileinputstream;

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
{$ifndef __G_FILE_INPUT_STREAM_H__}
{$define __G_FILE_INPUT_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/ginputstream.h>}

type
{< private > }
  PGFileInputStream = ^TGFileInputStream;
  TGFileInputStream = record
      parent_instance : TGInputStream;
      priv : PGFileInputStreamPrivate;
    end;

{< private > }
{ Padding for future expansion  }
  PGFileInputStreamClass = ^TGFileInputStreamClass;
  TGFileInputStreamClass = record
      parent_class : TGInputStreamClass;
      tell : function (stream:PGFileInputStream):Tgoffset;cdecl;
      can_seek : function (stream:PGFileInputStream):Tgboolean;cdecl;
      seek : function (stream:PGFileInputStream; offset:Tgoffset; _type:TGSeekType; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
      query_info : function (stream:PGFileInputStream; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;
      query_info_async : procedure (stream:PGFileInputStream; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      query_info_finish : function (stream:PGFileInputStream; result:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_file_input_stream_get_type:TGType;cdecl;external libgio2;
function g_file_input_stream_query_info(stream:PGFileInputStream; attributes:Pchar; cancellable:PGCancellable; error:PPGError):PGFileInfo;cdecl;external libgio2;
procedure g_file_input_stream_query_info_async(stream:PGFileInputStream; attributes:Pchar; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgio2;
function g_file_input_stream_query_info_finish(stream:PGFileInputStream; result:PGAsyncResult; error:PPGError):PGFileInfo;cdecl;external libgio2;
{$endif}
{ __G_FILE_FILE_INPUT_STREAM_H__  }

// === Konventiert am: 26-6-26 19:21:46 ===

function G_TYPE_FILE_INPUT_STREAM : TGType;
function G_FILE_INPUT_STREAM(obj : Pointer) : PGFileInputStream;
function G_FILE_INPUT_STREAM_CLASS(klass : Pointer) : PGFileInputStreamClass;
function G_IS_FILE_INPUT_STREAM(obj : Pointer) : Tgboolean;
function G_IS_FILE_INPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
function G_FILE_INPUT_STREAM_GET_CLASS(obj : Pointer) : PGFileInputStreamClass;

implementation

function G_TYPE_FILE_INPUT_STREAM : TGType;
  begin
    G_TYPE_FILE_INPUT_STREAM:=g_file_input_stream_get_type;
  end;

function G_FILE_INPUT_STREAM(obj : Pointer) : PGFileInputStream;
begin
  Result := PGFileInputStream(g_type_check_instance_cast(obj, G_TYPE_FILE_INPUT_STREAM));
end;

function G_FILE_INPUT_STREAM_CLASS(klass : Pointer) : PGFileInputStreamClass;
begin
  Result := PGFileInputStreamClass(g_type_check_class_cast(klass, G_TYPE_FILE_INPUT_STREAM));
end;

function G_IS_FILE_INPUT_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_FILE_INPUT_STREAM);
end;

function G_IS_FILE_INPUT_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_FILE_INPUT_STREAM);
end;

function G_FILE_INPUT_STREAM_GET_CLASS(obj : Pointer) : PGFileInputStreamClass;
begin
  Result := PGFileInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.
